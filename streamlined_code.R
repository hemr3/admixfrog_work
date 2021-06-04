library(tidyverse)
library(scales)
library(yaml)
library(dplyr)
library(ggplot2)
library(readr)
library(patchwork)
library(reprex)
#this code below will only work IF all the lib.R commands have been read in.

#bin.xz plotting (remember to include binding all)####
#peter's unless otherwise stated. 
#deni8 plots ####

#deni8 bin plots#
deni8_bin = load_bin_data("~/analyses/admixfrog/res/deni8_res/bound_deni8bin_eg2.csv", name = T)

TRACK = get_track(deni8_bin, TRACK = "NEA", p_max = 0.45, p_min = 0.2)

d2 = bin_to_long(deni8_bin) %>% 
  filter(variable %in% TRACK) %>% 
  filter(value > 1e-3)

deni8_plot = bin_colplot_wrap(d2, hasX = F)
deni8_plot
  #produces a very strange vis-might want to find another one to represent this (anc across CHR)

  deni8_plot2 = bin_colplot_map(d2, add_chrom = T)
deni8_plot2
  #one ancestry (NEADEN) overlays the others, so its impossible to see it all 

deni8_plot3 = bin_colplot_pos(d2, add_chrom = T)
deni8_plot3
  #same sort of issue here/ 
#deni8 rle plots##
deni8_rle = read_rle('~/analyses/admixfrog/res/deni8_res/bound_deni8_rle_eg2.csv')

deni8_plot4 = rle_plot_map(deni8_rle)
deni8_plot4
  #much nicer plot that actually works. Unsure whether it shows what its meant to tho

deni8_plot5 = ggplot(deni8_rle, aes(x=target, y=nscore, color=target)) +
  geom_boxplot(notch = T, outlier.color = "black")+
  xlab("Ancestry")+
  ylab("Confidence")+
  theme_minimal()+
  ggtitle("Denisova 8")
deni8_plot5
  #nice little boxplot, only use it for high-coverage samples though (as its clearer)

#chagyrskaya plots ####
#chag bin plots ##
chag_bin = load_bin_data("~/analyses/admixfrog/res/chag_res/Chagyrskaya/chag_bin_eg2.csv", name = T)

TRACK = get_track(chag_bin, TRACK = "DEN", p_max = 0.45, p_min = 0.2)

d2 = bin_to_long(chag_bin) %>% 
  filter(variable %in% TRACK) %>% 
  filter(value > 1e-3)

chag_plot = bin_colplot_wrap(d2, add_chrom = T, hasX = F)
chag_plot

chag_plot2 = bin_colplot_map(d2, add_chrom = T)
chag_plot2

chag_plot3 = bin_colplot_pos(d2, add_chrom = T)
chag_plot3

#chag rle plot ##
chag_rle = read_rle("chag_rle_eg2.csv")

chag_plot4 = rle_plot_map(chag_rle)
chag_plot4

chag_plot5 = ggplot(chag_rle, aes(x=target, y=nscore, color=target)) +
  geom_boxplot(notch = F, outlier.color = "black")+
  theme_minimal() +
  ggtitle("Chagyrskaya 8")

#another chag bin plot (NOT peter's)
chag_bin %>% 
  gather(k, v, -chrom:-n_snps) %>%
  filter(k!="AFR", v>.1) %>%
  ggplot(aes(x=map, y=v, fill=k)) + 
  geom_col()+
  facet_wrap(~chrom, ncol=1) #doesn't really work; too big

#vindija plots ####
#vind bin plots ###

#vind rle plots ###
vind_rle = read_rle("vind_rle_eg2.csv")

vind_plot4 = rle_plot_map(vind_rle)
vind_plot4

vind_plot5 = ggplot(vind_rle, aes(x=target, y=nscore, color=target)) +
  geom_boxplot(notch = F, outlier.color = "black")+
  theme_minimal() +
  ggtitle("Vindija 33")

#mesmaiskaya 1 plots####
#mesmai1 bin plots###

#mesmai1 res plots###
mes_rle = read_rle("mes_rle_eg2.csv")

mes_plot4 = rle_plot_map(mes_rle)
mes_plot4

mes_plot5 = ggplot(mes_rle, aes(x=target, y=nscore, color=target)) +
  geom_boxplot(notch = F, outlier.color = "black")+
  theme_minimal() +
  ggtitle("Mezmaiskaya 1")

#altai eg.2 bin plots ####
alt2_bin = load_bin_data("bound_alt-2_bin.csv", name = T)

TRACK = get_track(alt2_bin, TRACK = "DEN", p_max = 0.45, p_min = 0.2)

d2 = bin_to_long(alt2_bin) %>% 
  filter(variable %in% TRACK) %>% 
  filter(value > 1e-3)

alt2_plot = bin_colplot_wrap(d2, add_chrom = T, hasX = F)
alt2_plot

alt2_plot2 = bin_colplot_map(d2, add_chrom = T)
alt2_plot2

alt2_plot3 = bin_colplot_pos(d2, add_chrom = T)
alt2_plot3

#since the above are useless, will try with some of the initial work plots 
#for alt-2 
alt2_bin %>% 
  gather(k, v, -chrom:-n_snps) %>%
  filter(k!="AFR", v>.1) %>%
  ggplot(aes(x=map, y=v, fill=k)) + 
  geom_col()+
  facet_wrap(~chrom, ncol=1)

#making tables +simple barplots for stats tests####
#deni4 tables
d4_rle = read_rle("d4_rle.csv")

d4rle_target = as.data.frame(table(d4_rle$target))
d4rle_type = as.data.frame(table(d4_rle$type))

#deni8 tables 2
d8rle_target = as.data.frame(table(deni8_rle$target))

deni8_plot6 = ggplot(d8rle_target, aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat = "identity")+
  geom_text(aes(label=Freq), vjust=-0.6, color="black", size=3.5)+
  theme_minimal() +
  ggtitle("Denisova 8") +
  labs(x = 'Ancestry', y = 'Number of Positions') +
  guides(fill=guide_legend(title = NULL))
deni8_plot6

d8rle_type = as.data.frame(table(d8_rle$type))

d8bin_vit = as.data.frame(table(deni8_bin$viterbi)) 
  colnames(d8bin_vit) = c('Ancestry', 'Denisova 8')

#altai tables 
#(alt ref file used for below)
alt1 = bound_alt1_rle

alt1_target = as.data.frame(table(alt1$target))
alt1_type = as.data.frame(table(alt1$type))

#chag tables
#look above for rles being read in.
chagrle_target = as.data.frame(table(chag_rle$target))

chag_plot6 = ggplot(chagrle_target, aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat = "identity")+
  geom_text(aes(label=Freq), vjust=-0.6, color="black", size=3.5)+
  theme_minimal() +
  ggtitle("Chagyrskaya 8") +
  labs(x = 'Ancestry', y = 'Count') +
  guides(fill=guide_legend(title = NULL))
chag_plot6

chagrle_type = as.data.frame(table(chag_rle$type))


chagbin_vit = as.data.frame(table(chag_bin$viterbi))
colnames(chagbin_vit) = c('Ancestry', 'Chagyrskaya')

#vind tables
#look above for rles being read in.
vindrle_target = as.data.frame(table(vind_rle$target))

vind_plot6 = ggplot(vindrle_target, aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat = "identity")+
  geom_text(aes(label=Freq), vjust=-0.6, color="black", size=3.5)+
  theme_minimal() +
  ggtitle("Vindija 33") +
  labs(x = 'Ancestry', y = 'Number of Positions') +
  guides(fill=guide_legend(title = NULL))
vind_plot6

vindrle_type = as.data.frame(table(vind_rle$type))

vindbin_vit = as.data.frame(table(vind_bin$viterbi))
colnames(vindbin_vit) = c('Ancestry', 'Vindija')

#mesmai tables
#look above for rles being read in.
mesrle_target = as.data.frame(table(mes_rle$target))

mes_plot6 = 
  ggplot(mesrle_target, aes(x=Var1, y=Freq, fill=Var1))+
  geom_bar(stat = "identity")+
  geom_text(aes(label=Freq), vjust=-0.6, color="black", size=3.5)+
  theme_gray() +
  ggtitle("Mezmaiskaya 1") +
  labs(x = 'Ancestry', y = 'Number of Positions') +
  guides(fill=guide_legend(title = NULL))
mes_plot6

mesrle_type = as.data.frame(table(mes_rle$type))


mesbin_vit = as.data.frame(table(mes_bin$viterbi))
colnames(mesbin_vit) = c('Ancestry', 'Mezmaiskaya')

# joining all the plot_6 together to make a little vis ####
deni8_plot6 + chag_plot6 + vind_plot6 + mes_plot6
