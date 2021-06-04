library(tidyverse)

#joining chromosomes together. 

deni1=read_csv("deni8chr1example1.bin.xz")
deni2=read_csv("deni8chr2example1.bin.xz")
deni3=read_csv("deni8chr3example1.bin.xz")
deni4=read_csv("deni8chr4example1.bin.xz")
deni5=read_csv("deni8chr5example1.bin.xz")
deni6=read_csv("deni8chr6example1.bin.xz")
deni7=read_csv("deni8chr7example1.bin.xz")
deni8=read_csv("deni8chr8example1.bin.xz")
deni9=read_csv("deni8chr9example1.bin.xz")
deni10=read_csv("deni8chr10example1.bin.xz")
deni11=read_csv("deni8chr11example1.bin.xz")
deni12=read_csv("deni8chr12example1.bin.xz")
deni13=read_csv("deni8chr13example1.bin.xz")
deni14=read_csv("deni8chr14example1.bin.xz")
deni15=read_csv("deni8chr15example1.bin.xz")
deni16=read_csv("deni8chr16example1.bin.xz")
deni17=read_csv("deni8chr17example1.bin.xz")
deni18=read_csv("deni8chr18example1.bin.xz")
deni19=read_csv("deni8chr19example1.bin.xz")
deni20=read_csv("deni8chr20example1.bin.xz")
deni22=read_csv("deni8chr22example1.bin.xz")
# reading in the data in prep for binding. 

bound_deni4_bin=rbind.data.frame(deni1, deni2, deni3, deni4, deni5, deni6, deni7, deni8, deni9, deni10, deni11, deni12, deni13, 
          deni14, deni15, deni16, deni17, deni18, deni19, deni20, deni22, 
          make.row.names = T)

write_csv(bound_deni8_bin, "bound_deni8_bin.csv")  
#writes out to a csv file, which i think can be transformed into an .xz file if needed


