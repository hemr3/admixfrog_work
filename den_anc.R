#code to create Fig 11 

library(tidyverse)

den_anc = read_csv("~/analyses/admixfrog/percent_denanc_perchr.csv")

den_anc_graph = ggplot(den_anc, aes(x = den_anc$CHR, y = den_anc$Chagyrskaya))+
   geom_point()+
  geom_point(aes(y = den_anc$Altai), shape = 16, size = 2)+
  geom_point(aes(y = den_anc$Mezmaiskaya), shape = 8, size = 2)+
  geom_point(aes(y = den_anc$Vindija), shape = 4, size = 2)+
#  geom_point(aes(y = den_anc$`Denisova 4`), shape = 15, size = 2)+
#  geom_point(aes(y = den_anc$`Denisova 8`), shape = 17, size = 2)+
  
  scale_x_continuous(name = "Chromosome Number", limits = c(1,22), 
                     breaks = round(seq(min(den_anc$CHR), max(den_anc$CHR), by = 1),1))+
  scale_y_continuous(name = "Proportion of Denisovan Ancestry", limits = c(0,0.1), 
                     breaks = round(seq(min(0), max(1), by = 0.1),1))+
  theme_minimal()+
  theme(legend.title = element_blank())
#  scale_shape_manual(values = c(16, 19, 15, 17, 8, 4))+
#  scale_color_manual(values = c("Altai Neanderthal", "Chagyrskaya 8", "Denisova 4", "Denisova 8",
#                                "Mezmaiskaya 1", "Vindija 33.19"))
#  scale_shape_manual(values = c("Altai Neanderthal" = 16, "Mezmaiskaya 1" = 8,
#                                "Vindija 33.19" = 4, "Chagyrskaya 8" = 19,
#                                "Denisova 4" = 15, "Denisova 8" = 17))
  
ggsave("~/Pictures/Visualisations/percent_den_anc_FINAL.png", plot = den_anc_graph, height = 5,
       width = 10)
