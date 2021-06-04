# library and reading in ####
library(tidyverse) # for plots/tibbles
library(ggplot2) # for some more plots
library(karyoploteR) # for more interesting plots
library(broom) #for pca tidy plots
library(ggfortify) #for other pca plots

d3res=read_csv("deni4chr3example1.res.xz") #read in and name files
d3snp = read_csv("deni4chr3example2.snp.xz")
d3bin = read_csv("deni8chr3example2.bin.xz")
d3cont = read_csv("deni4chr3example1.cont.xz")
d3rle = read_csv("deni4chr3example1.rle.xz")

# creation of simple visualisation for bin.xz file ####
d3bin %>% 
  gather(k, v, -chrom:-n_snps) %>%
  filter(k!="AFR", v>.1) %>%
  ggplot(aes(x=map, y=v, fill=k)) + 
  geom_col()+
  facet_wrap(~chrom, ncol=1)
#something interesting to note: how to plot propotions of ancestry that are visible
#in this graph, perhaps this, esp the first gather and filter lines, can be used 
#as a launch point. 

# creation of simple barplots for res.xz and rle.xz files
d3rletype = as.data.frame(table(d3rle$type))
d3rletarget = as.data.frame(table(d3rle$target))

d3resframe=as.data.frame(table(d3res$state)) %>% 
  ggplot(aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", fill="steelblue")+
  geom_text(aes(label=Freq), vjust=1.6, color="white", size=3.5)+
  theme_minimal()


# creating a jitterplot for rle.xz files
d3rle %>% 
  ggplot(aes(x=target, y=type))+
  geom_point(shape=18, size=1)+
  geom_jitter(aes(color=target))+
  theme_minimal()

# prepping and performing pca for snp file ####
d3snp_drop = d3snp %>% 
  subset(select=c(chrom, G0, G1, G2, p))
#removal of anything bar the columns we're interested in - I think in particular the G0/G1 are interesting 
#the p column suggests this has already been statistically tested - for what? 
#this might be the 'state' of the SNP - work how to join these two together.

d3snpm=as.matrix(d3snp_drop) #matrix out of the snp dataset

d3snpm_pca=prcomp(d3snpm, scale. = F)
#pca this. I'm not sure what it does, or whether the pca is needed, but useful to know 
#that i can do it, even if it doesn't produce a proper/needed pca. 
  
#visualising results of pca ####
screeplot(d3snpm_pca) #initial plot

d3pc_scores <- d3snpm_pca$x
d3pc_eigen <- d3snpm_pca$sdev^2 #important! extracts eigen values, variance explained by each component
d3pc_loadings <- d3snpm_pca$rotation

ncol(d3pc_scores)
length(d3pc_eigen)
ncol(d3pc_loadings)
# above will be used for plotting the pca output.

tidy(d3snpm_pca, matrix = "eigenvalues") %>% 
  ggplot(aes(x=factor(PC), y=percent))+
  geom_col()+
  geom_line()
#beginning plot of the pca values for this. 

d3pc_scores %>% 
  as_tibble(rownames = "state") %>% 
  ggplot(aes(x=PC1, y=PC2))+
  geom_point(alpha=0.5)+
  geom_abline()
#this produces a strange plot that I don't think is particularly useful, but 
#nevertheless interesting to produce. it essentially just follows a general pc curve. 

# creating a new scatterplot of bin file ####
d3bin_drop_longer = d3bin_drop  %>% 
  select(n_snps, AFR, NEA, DEN, AFRNEA, AFRDEN, NEADEN) %>% 
  pivot_longer(., cols = c(AFR, NEA, DEN, AFRNEA, AFRDEN, NEADEN), 
               names_to = "Var", values_to = "Val")

d3bin_drop_longer %>% 
  ggplot(aes(y=n_snps, x=Val, color=Var))+
  geom_point(alpha = 0.5)

# prepping, performing and plotting pca for bin file ####
d3bin_drop = d3bin %>% 
  subset(select=c(n_snps, AFR, NEA, DEN, AFRNEA, AFRDEN, NEADEN))

d3binm = as.matrix(d3bin_drop_longer)

d3binm_pca=prcomp(d3binm, scale. = TRUE)

d3b_pc_scores <- d3binm_pca$x
d3b_pc_eigen <- d3binm_pca$sdev^2 #important! extracts eigen values, variance explained by each component
d3b_pc_loadings <- d3binm_pca$rotation


tidy(d3binm_pca, matrix = "eigenvalues") %>% 
  ggplot(aes(x=factor(PC), y=percent))+
  geom_col()+
  geom_line()

d3b_pc_scores %>% 
  as_tibble(rownames = "Var") %>% 
  ggplot(aes(x=PC1, y=PC2))+
  geom_point(alpha=0.5)
