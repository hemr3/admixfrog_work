#code to create binplots in Figs 8, 9, S3 

#commands needed to make this work from lib.R: load_bin_data, bin_to_long, col_scale, col_vec

library(tidyverse) #for ggplot

d4 = load_bin_data("total_alt_bin.csv",
                     name = T)
                     
d4 = d4[which(d4$map > 28477797 & 
              d4$map < 33448354),]
  #only use if clipping off genome to certain positions (as with MHC locus)

d2 = bin_to_long(d4)

d4 = ggplot(d2)+
  geom_col(aes(x = d2$map, y = d2$value,
               fill = d2$variable),
               width = d2$bwidth * 1.0001,
           lwd = 0)+
  scale_y_continuous(name="Pr(Local Ancestry)\n", breaks=c(), expand=expand_scale(0,0)) +
  scale_x_continuous(name="Position (Mb)", 
                     breaks=seq(0, 360, 40), 
                     expand=expand_scale(c(0,0.04),0.00))+
                     #limits = c(28477797, 33448354)) +
  coord_cartesian(ylim=0:1, clip='off') +
  col_scale() + theme_classic() +
  facet_wrap(~chrom, ncol = 1, strip = "left")+
  theme(legend.title = element_blank())+
  ggtitle(" ")
