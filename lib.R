# defining functions to make similar plots to Peter's graphs
library(tidyverse)
library(scales)
library(yaml)
library(dplyr)
library(ggplot2)
library(readr)
library(patchwork)

FACET_THEME = theme(panel.background = element_rect(color='#eeeeee'),
                    strip.background = element_rect(size = .3), 
                    panel.spacing.y = unit(.2, "lines"))

THEME = theme_classic() + FACET_THEME

# function to make the _plot functions work 
# bg_chrom function #### 

bg_chrom <- function(ref=NULL, map="AA_Map", flip=F){
  x = read_csv("chrom_limits.csv", col_types=cols(chrom=readr::col_factor())) %>% 
    select('chrom', min=sprintf('%s_min', map), max=sprintf("%s_max", map))
  if(!is.null(ref)) x = filter(x, chrom %in% unique(ref$chrom))
  if(flip){
    return(geom_rect(data=x, color=NA, mapping=aes(ymin=min, ymax=max, xmin=-Inf, xmax=Inf), fill='#efefef'))
  }
  
  return(geom_rect(data=x, color=NA, mapping=aes(xmin=min, xmax=max, ymin=-Inf, ymax=Inf), fill='#efefef'))
}

# bg_chrom_wrap for _wrap plot ####
bg_chrom_wrap <- function(ref=NULL, map="AA_Map", hasX=T){
  x = read_csv("chrom_limits.csv", col_types=cols(chrom=readr::col_factor())) %>% 
    select('chrom', min=sprintf('%s_min', map), max=sprintf("%s_max", map))
  if(!hasX){
    x = x %>% filter(chrom!='X')
  }
  
  x_wrap = x %>% mutate(c_wrap=high_chrom(chrom, hasX),
                        min2 = ifelse(as.character(chrom)==as.character(c_wrap), min, 360 - max),
                        max = ifelse(as.character(chrom)==as.character(c_wrap), max, 360 - min)) %>%
    select(-min) %>%
    rename(min=min2)
  
  
  return(geom_rect(data=x_wrap, color=NA, mapping=aes(xmin=min, xmax=max, ymin=-Inf, ymax=Inf), fill='#efefef'))
}

# high_chrom function for _wrap plot ####
high_chrom = function(chrom, hasX=T){
  if(hasX){
    chrom = as.character(chrom)
    chrom[chrom == 'X'] = 0
    chrom = as.integer(chrom)
    chrom[is.na(chrom)] = 0
    chrom[chrom>11] = 23 - chrom[chrom>11]
    chrom = as.factor(chrom) #shifted from as.factor 
    levels(chrom)[1] = 'X'
    chrom = factor(chrom, levels=c(1:11, 'X'))
    return(chrom)
  } else {
    chrom = as.character(chrom)
    chrom = as.integer(chrom)
    chrom[chrom>11] = 23 - chrom[chrom>11]
    chrom = as.factor(chrom)
    return(chrom)
    
  }
}


# sort_chrom function to make the below work ####
sort_chroms <- function(chrom) +
  chrom <- factor(as.character(chrom), levels=c(1:22,"X", "Y", "mt"))

#read_binout function to make the load_bin_data function work ####

read_binout <- function(fname){
  COL = cols(
    chrom=readr::col_factor(),
    pos=col_integer(),
    id=col_integer(),
    viterbi=readr::col_factor(),
    n_snps=col_integer()
  )
  a <- read_csv(fname, col_types=COL) #%>%
    #mutate(chrom = sort_chroms(chrom))
}

# col_ functions, so the plotting works ####

#col_scale
col_scale <- function(){
  rr = col_vec()
  sc = scale_color_manual(values=rr, aesthetics = c("colour", "fill"))
}

#col_vec
col_vec <- function(){
  x = data.frame(yaml.load_file("colors.yaml", eval.expr=F)$colors)
  y = col2rgb(as.character(as.matrix(x)))/255
  
  lab_cols = apply(y, 2, convertColor, from="sRGB", to="Lab", clip=NA)
  z = names(x)
  n = length(z)
  
  res = c()
  for(i in 1:n){
    for(j in 1:n){
      s1 = z[i]
      s2 = z[j]
      pop = ifelse(s1==s2, s1, sprintf("%s%s", s1, s2))
      if( (pop %in% z) & s1 != s2){next}
      col = avg_cols(lab_cols[,i], lab_cols[,j])
      v <- c(pop, col)
      
      res <- rbind(res, v)
    }
  } 
  colnames(res) = c("id", "col")
  res = res %>% as_tibble %>% group_by(id) %>% summarize(col=first(col))
  rr = res$col
  names(rr) = res$id
  #print(rr)
  return(rr)
  
}
#avg_cols function
avg_cols <- function(c1, c2){
  col = convertColor((c1 + c2) / 2, from="Lab", to="sRGB")
  return(rgb(col))
}


# making the missing variables for below functions ####
# load_bin_data function 
load_bin_data <- function(data, name, widths=TRUE){
  a <- lapply(data, read_binout)
  names(a) <- name
  a <- bind_rows(a, .id="sample")
  a$sample = factor(a$sample, level=name)
  if(!widths) return(a)
  a %>% group_by(sample, chrom) %>%
    arrange(sample, chrom, pos, map)  %>%
    mutate( pwidth = diff(c(pos, max(pos)))) %>%
    mutate( bwidth = diff(c(map, max(map)))) %>%
    ungroup 
}
# for the plots to work for Peter - MUST USE THIS FUNCTION
# ALL DATA IS ~NOT~ LOADED WITH THIS FUNCTION
# the load_bin_data and read_binout functions now work as they are now. 
# argument of this is name= just either put F or T, I put as F and it worked. 

deni4_2_bin=load_bin_data("total_d4_bin.csv", name = T)

# the TRACK function ####
# to make this function work, we need a p_min and p_max probabilities. 
# these must be defined IN FUNCTION
# TRACK is a charac thing that must be defined, however, I'm not sure it worked.
# 

get_track <- function(bin_data, TRACK, p_min, p_max){
  if(!is.null(TRACK)){
    TRACK = strsplit(TRACK, "_")[[1]]
  } else{
    TRACK = NULL
  }
  v <- bin_data %>% 
    select(-1:-7) %>%
    summarize_all(.funs=mean)  %>% 
    unlist 
  TRACK <- names(v[ (v<p_max& v>p_min) |  str_length(names(v)) >4   ])                                                           
  return(TRACK)
}

# this now doesnt work??? why??

#bin_to_long function ####
bin_to_long <- function(data){
  b <- data %>% 
    gather(variable, value, -sample:-n_snps, -pwidth, -bwidth)
}
#bin_to_long for res? 
res_to_long <- function(data){
  b <- data %>% 
    gather(len, it, -start:-end, -state, -chrom)
}
#does work, but produces a frame far too big for R to handle. 

deni4_2_bin_long = bin_to_long(deni4_2_bin)

# an issue with this function is that the -pwidth, -bwitch, variable, value and sample
# are not defined. This means that the function to define these must GO EARLIER.
# this is the load_bin_data function. this function works. 

# defining d2; used in most plots here ####
# this must always sit just below the bin_to_long function, as the above uses it.
# can change this, but would need to change it all in the plot functions below

# for d2 to work must FIRST define TRACK

#deni4_22_bin=load_bin_data("deni4chr22example2.bin.xz", name = T)

TRACK = get_track(deni4_2_bin, TRACK = "DEN", p_max = 0.45, p_min = 0.2)

#d2 = bin_to_long(deni4_2_bin) %>% 
#  filter( variable %in% TRACK)  %>%
#  filter(value > 1e-3)
#IMPT: all df.s must be named d2 if the below is to work 

#bin_colplot_wrap ####

TRACK = get_track(deni4_22_bin, TRACK = "DEN", p_max = 0.45, p_min = 0.2)

#d2 = bin_to_long(deni4_22_bin) %>% 
 # filter( variable %in% TRACK)  %>%
  #filter(value > 1e-3)

#col_wrap function
deni_4 = load_bin_data("bound_deni8_bin.csv", name = T)
d2 = bin_to_long(deni4_2_bin) %>% 
  filter(variable %in% TRACK) %>% 
  filter(value > 1e-3)

bin_colplot_wrap <- function(d2, add_chrom=T, base_size=8, hasX=T){
  print(nrow(d2))
  d_wrap = d2 %>% mutate(c_wrap=high_chrom(chrom, hasX), 
                         m_wrap = ifelse(as.character(chrom)==as.character(c_wrap), map, 360 - map))
  
  if(hasX){
    d_label = data.frame(c_wrap=levels(d_wrap$c_wrap), 
                         lab=c(paste0(23-c(as.integer(levels(d_wrap$c_wrap)[1:11])), " "), NA))
    d_label$xintercept=c(rep(360, 11), 0)
  } else{
    d_label = data.frame(c_wrap=levels(d_wrap$c_wrap), 
                         lab=c(paste0(23-c(as.integer(levels(d_wrap$c_wrap)[1:11])))))
    d_label$xintercept=c(rep(360, 11))
  }
  P = d_wrap %>% ggplot() 
  if(add_chrom) P = P + bg_chrom_wrap(d_wrap, hasX=hasX)
  P +
    geom_col(mapping=aes(x=m_wrap, 
                         y=value, 
                         fill=variable,
                         width=bwidth * 1.001), #maybe if find out what this is, have a better idea about this
             lwd=0) + 
    facet_wrap(~c_wrap, ncol=1, strip='l') + 
    geom_text(aes(label=paste0(" ",c_wrap, " ")), x=-0, y=0.5, data=d_label, hjust=1, size=base_size / 3) + 
    geom_text(aes(label=lab), x=Inf, y=0.5, data=d_label, hjust=.5, size=base_size / 3) +
    geom_vline(aes(xintercept=xintercept), lwd=.33, color='black', data=d_label) + 
    geom_vline(xintercept=0, color='black', lwd=0.33) + 
    scale_y_continuous(name="Pr(Local Ancestry)\n", breaks=c(), expand=expand_scale(0,0)) +
    scale_x_continuous(name="Position (cM)", 
                       breaks=seq(0, 360, 40), expand=expand_scale(c(0,0.04),0.00)) +
    coord_cartesian(ylim=0:1, clip='off') +
    col_scale() + theme_classic(base_size) +
    theme(
      strip.background = element_blank(),
      
      strip.text = element_blank()
    )
}

deni8_plot = bin_colplot_wrap(d2)
deni8_plot
# somehow doesnt include data for CHR 1 or CHR22, and i hate it. 
# this is the plot that is really needed here. 'width' is an unknown aes, and geom_text has no input - maybe that creates the issue?

#below doesn't matter#####
# bin_colplot_pos function #### 
bin_colplot_pos <- function(d2, add_chrom=T){
  P = d2 %>% group_by(sample, pos, chrom) %>%
    mutate(value=cumsum(value)) %>%
    mutate(v0 = lag(value, default=0)) %>% 
    ggplot()
  if(add_chrom) P = P + bg_chrom(d2, map='pos')
  P + 
    geom_rect(mapping=aes(xmin=pos, xmax=pos+pwidth,
                          ymin=v0, ymax=value,
                          fill=variable,
                          #width=pwidth
    )) + 
    scale_x_continuous(expand=c(0,0), name=NULL, labels=function(x)x/1e6) + 
    scale_y_continuous(expand=c(0,0), name='Probability') +
    coord_cartesian(ylim=0:1, expand=c(0,0,0,0)) +
    col_scale()+ 
    THEME
}

#making a plot with the above function
plot2 = bin_colplot_pos(as.data.frame(d2))+  #this works! 
  facet_wrap(~chrom, ncol = 1, strip.position="left") 

plot1 + plot2 + plot3+plot4+plot5+plot7+plot8+plot9+plot10+
  plot11+plot13+plot14+plot15+plot16+plot17+plot18+plot19+plot20+plot22
# to make this all work with multiple chromosome files, you'll have to combine all the files. 
# my idea now is to use the patchwork plot function to add all the plots together, but im now going to have
# to do this with every CHR which is going to be a little bit of a trial. 


# bin_colplot_map ####
bin_colplot_map <- function(d2, add_chrom=T){
  P = d2 %>% ggplot() 
  if(add_chrom) P = P + bg_chrom(d2)
  P +
    geom_col(mapping=aes(x=map, 
                         y=value, 
                         fill=variable,
                         color=variable,
                         width=bwidth), position = "dodge") + 
    scale_x_continuous(expand=c(0,0), name='Position (cM)', labels=comma) + 
    scale_y_continuous(expand=c(0,0), name='Probability') +
    coord_cartesian(ylim=0:1) +
    col_scale() + THEME
}

plot_2 = bin_colplot_map(d2, add_chrom = T)
plot_2
# this plot does something that I'd already done in ggplot in the initial_work script with a scatter
# admittedly, it does it more professionally. And nicer to look at. again, must coalesce the CHR. 

#rle_plot_map function - does kinda work ####

d2_rle = read.csv("deni4chr2example2.rle.xz")

rle_plot_map <- function(data, minlen=0.1, maxlen=1){
  data %>%
    filter(map_len > minlen) %>%
    ggplot() +
    bg_chrom(data) + 
    geom_tile(aes(x =(map +map_end)/ 2, width = map_end - map, 
                  y=0.5, height=1, fill=target )) + 
    facet_wrap(~chrom, ncol=1, strip='left') + 
    THEME + 
    col_scale() +
    scale_alpha_continuous(range=c(0.3,1), limits=c(minlen, maxlen), name='Length(cM)') + 
    scale_x_continuous(expand=c(0,0), name='Position (cM)') + 
    scale_y_discrete(expand=c(0,0), name='State') + 
    theme(strip.text.y = element_text(angle=180))
}

plot_rle_2 = rle_plot_map(d2_rle)
plot_rle_2
#this works, and it produces axis, but doesn't really seem to produce any data to go
#it DOES produce data, but something strange; small lines on the positioning
#not sure if this is what it's meant to produce but it does WORK. 

#read_rle function ####

read_rle <- function(fname){
  read_csv(fname, col_types=cols(chrom=readr::col_factor())) %>%
    mutate(pos = as.integer(pos), 
          #chrom = sort_chroms(chrom), #for more than one chr, only one? # it out
           pos_end = as.integer(pos_end),
           len = as.integer(len),
           type=as.factor(type),
           target=as.factor(target))
}

#runs.R #####
#rle plotting?

R = read_rle("deni4chr1example2.rle.xz") %>% 
  filter(type=="state")

v = R %>% 
  group_by(target, type) %>% 
  summarize(1=sum(map_len)) %>% 
  filter(type=='state') %>% # error: object 'type' isnt found; but exists. nothing else it could be
  ungroup() 
# mutate(1=1/sum(1))
# the above doesn't work; mutate() may be for multiple chr; unsure issue with filter

states = v %>%
  filter(1>pmin, 1<pmax) %>% #pmin/pmax are already functions in base; don't know what to define them as. may be able to just define
  select(target) %>% 
  unlist()

P= R %>% 
  filter(target %in% states) %>% #v needs to be defined for both states and this to work
  rle_plot_map(minlen=lmin, maxlen=lmax) #lmin/lmax undefined
