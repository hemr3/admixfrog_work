#creates Fig 6

library(tidyverse)
library(ggrepel)
#doing linear regression to estimate heterozygosities

het = read_csv("~/analyses/admixfrog/het/linear_regression.csv")
lowhet = read_csv("~/analyses/admixfrog/het/low_linear regression.csv")

fit = lm(het$Total_High_het ~ het$LowCov_HetEst)

fitplot = ggplot(het, aes(x = het$LowCov_HetEst, y = het$Total_High_het))+
  geom_point()+
#  geom_point(data = lowhet, aes(color = "blue"))+
#  geom_text(aes(label=het$X1), hjust=1.1, vjust=0.5)+
  stat_smooth(method = "lm", col = "red")+
  labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5), 
                       ", Intercept =",signif(fit$coef[[1]],5 ), 
                       ", Slope =",signif(fit$coef[[2]], 5), 
                       ", P =",signif(summary(fit)$coef[2,4], 5)))+
  ylab("Estimated heterozygosity from high coverage file")+
  xlab("Estimated heterozygosity from low coverage file")+
  theme_minimal()

fitplot = fitplot +
  geom_label_repel(aes(label = het$X1),
                   box.padding = 0.35,
                   point.padding = 0.5,
                   segment.color = "grey50")+
  theme_minimal()

ggsave(plot = fitplot, 
       filename = "~/Pictures/Visualisations/admixfrog/linear_regression.png",
       height = 8,
       width = 8)
  
