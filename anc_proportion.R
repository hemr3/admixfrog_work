#calculates ancestry proportions from .rle.xz files of admixfrog 

#equation used: 

#(homNea * 2 + hetNea) / ((homNea * 2 + hetNea) + (homDeni * 2 + hetDeni))

perc = mes_rle %>% 
  filter(target == "DEN" & type == "homo") %>%  #changes based on ancestry inferred: "NEA", "NEADEN" ("homo", "het")
# filter(chrom == 22) #include if doing chr by chr ancestry proportions

sum(perc$pos_len)
