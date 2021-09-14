library(admixtools)
library(tidyverse)

#first must read in all the .snp data for the individuals I want to include ####
#reading in the .snp data for deni 4 ####
denisnp1=read_csv("deni4chr1example2.snp.xz")
denisnp2=read_csv("deni4chr2example2.snp.xz")
denisnp3=read_csv("deni4chr3example2.snp.xz")            
denisnp4=read_csv("deni4chr4example2.snp.xz")
denisnp5=read_csv("deni4chr5example2.snp.xz")
denisnp6=read_csv("deni4chr6example2.snp.xz")
denisnp7=read_csv("deni4chr7example2.snp.xz")
denisnp8=read_csv("deni4chr8example2.snp.xz")
denisnp9=read_csv("deni4chr9example2.snp.xz")
denisnp10=read_csv("deni4chr10example2.snp.xz")
denisnp11=read_csv("deni4chr11example2.snp.xz")
denisnp12=read_csv("deni4chr12example2.snp.xz")
denisnp13=read_csv("deni4chr13example2.snp.xz")
denisnp14=read_csv("deni4chr14example2.snp.xz")
denisnp15=read_csv("deni4chr15example2.snp.xz")
denisnp16=read_csv("deni4chr16example2.snp.xz")
denisnp17=read_csv("deni4chr17example2.snp.xz")
denisnp18=read_csv("deni4chr18example2.snp.xz")
denisnp19=read_csv("deni4chr19example2.snp.xz")
denisnp20=read_csv("deni4chr20example2.snp.xz")
denisnp21=read_csv("deni4chr21example2.snp.xz")
denisnp22=read_csv("deni4chr22example2.snp.xz")

bound_deni4_snp=rbind.data.frame(denisnp1, denisnp2, denisnp3, denisnp4, denisnp5, 
                                 denisnp6, denisnp7, denisnp8, denisnp9,
                                 denisnp10, denisnp11, denisnp12, denisnp13, 
                                 denisnp14, denisnp15, denisnp16, denisnp17, 
                                 denisnp18, denisnp19, denisnp20, denisnp22, 
                                 make.row.names = T)
write_csv(bound_deni4_snp, "bound_deni4_snp.csv")

#reading in and binding deni8 ####
deni8snp1=read_csv("deni8chr1example1.snp.xz")
deni8snp2=read_csv("deni8chr2example1.snp.xz")
deni8snp3=read_csv("deni8chr3example1.snp.xz")
deni8snp4=read_csv("deni8chr4example1.snp.xz")
deni8snp5=read_csv("deni8chr5example1.snp.xz")
deni8snp6=read_csv("deni8chr6example1.snp.xz")
deni8snp7=read_csv("deni8chr7example1.snp.xz")
deni8snp8=read_csv("deni8chr8example1.snp.xz")
deni8snp9=read_csv("deni8chr9example1.snp.xz")
deni8snp10=read_csv("deni8chr10example1.snp.xz")
deni8snp11=read_csv("deni8chr11example1.snp.xz")
deni8snp12=read_csv("deni8chr12example1.snp.xz")
deni8snp13=read_csv("deni8chr13example1.snp.xz")
deni8snp14=read_csv("deni8chr14example1.snp.xz")
deni8snp15=read_csv("deni8chr15example1.snp.xz")
deni8snp16=read_csv("deni8chr16example1.snp.xz")
deni8snp17=read_csv("deni8chr17example1.snp.xz")
deni8snp18=read_csv("deni8chr18example1.snp.xz")
deni8snp19=read_csv("deni8chr19example1.snp.xz")
deni8snp20=read_csv("deni8chr20example1.snp.xz")
deni8snp21=read_csv("deni8chr21example1.snp.xz")
deni8snp22=read_csv("deni8chr22example1.snp.xz")

bound_deni8_snp=rbind.data.frame(deni8snp1, deni8snp2, deni8snp3, deni8snp4, deni8snp5, 
                                 deni8snp6, deni8snp7, deni8snp8, deni8snp9,
                                 deni8snp10, deni8snp11, deni8snp12, deni8snp13, 
                                 deni8snp14, deni8snp15, deni8snp16, deni8snp17, 
                                 deni8snp18, deni8snp19, deni8snp20, deni8snp22, 
                                 make.row.names = T)
write_csv(bound_deni8_snp, "bound_deni8_snp.csv")

#reading in and binding chagyrskaya ####
chagsnp1=read_csv("chagchr1example1.snp.xz")
chagsnp2=read_csv("chagchr2example1.snp.xz")
chagsnp3=read_csv("chagchr3example1.snp.xz")
chagsnp4=read_csv("chagchr4example1.snp.xz")
chagsnp5=read_csv("chagchr5example1.snp.xz")
chagsnp6=read_csv("chagchr6example1.snp.xz")
chagsnp7=read_csv("chagchr7example1.snp.xz")
chagsnp8=read_csv("chagchr8example1.snp.xz")
chagsnp9=read_csv("chagchr9example1.snp.xz")
chagsnp10=read_csv("chagchr10example1.snp.xz")
chagsnp11=read_csv("chagchr11example1.snp.xz")
chagsnp12=read_csv("chagchr12example1.snp.xz")
chagsnp13=read_csv("chagchr13example1.snp.xz")
chagsnp14=read_csv("chagchr14example1.snp.xz")
chagsnp15=read_csv("chagchr15example1.snp.xz")
chagsnp16=read_csv("chagchr16example1.snp.xz")
chagsnp17=read_csv("chagchr17example1.snp.xz")
chagsnp18=read_csv("chagchr18example1.snp.xz")
chagsnp19=read_csv("chagchr19example1.snp.xz")
chagsnp20=read_csv("chagchr20example1.snp.xz")
chagsnp21=read_csv("chagchr21example1.snp.xz")
chagsnp22=read_csv("chagchr22example1.snp.xz")

bound_chag_snp=rbind.data.frame(chagsnp1, chagsnp2, chagsnp3, chagsnp4, chagsnp5, 
                                chagsnp6, chagsnp7, chagsnp8, chagsnp9,
                                chagsnp10, chagsnp11, chagsnp12, chagsnp13, 
                                chagsnp14, chagsnp15, chagsnp16, chagsnp17, 
                                chagsnp18, chagsnp19, chagsnp20, chagsnp22, 
                                 make.row.names = T)
write_csv(bound_chag_snp, "bound_chag_snp.csv")

#reading in and binding vindija
vindsnp1=read_csv("vindchr1example1.snp.xz")
vindsnp2=read_csv("vindchr2example1.snp.xz")
vindsnp3=read_csv("vindchr3example1.snp.xz")
vindsnp4=read_csv("vindchr4example1.snp.xz")
vindsnp5=read_csv("vindchr5example1.snp.xz")
vindsnp6=read_csv("vindchr6example1.snp.xz")
vindsnp7=read_csv("vindchr7example1.snp.xz")
vindsnp8=read_csv("vindchr8example1.snp.xz")
vindsnp9=read_csv("vindchr9example1.snp.xz")
vindsnp10=read_csv("vindchr10example1.snp.xz")
vindsnp11=read_csv("vindchr11example1.snp.xz")
vindsnp12=read_csv("vindchr12example1.snp.xz")
vindsnp13=read_csv("vindchr13example1.snp.xz")
vindsnp14=read_csv("vindchr14example1.snp.xz")
vindsnp15=read_csv("vindchr15example1.snp.xz")
vindsnp16=read_csv("vindchr16example1.snp.xz")
vindsnp17=read_csv("vindchr17example1.snp.xz")
vindsnp18=read_csv("vindchr18example1.snp.xz")
vindsnp19=read_csv("vindchr19example1.snp.xz")
vindsnp20=read_csv("vindchr20example1.snp.xz")
vindsnp21=read_csv("vindchr21example1.snp.xz")
vindsnp22=read_csv("vindchr22example1.snp.xz")

bound_vind_snp=rbind.data.frame(vindsnp1, vindsnp2, vindsnp3, vindsnp4, vindsnp5, 
                                vindsnp6, vindsnp7, vindsnp8, vindsnp9,
                                vindsnp10, vindsnp11, vindsnp12, vindsnp13, 
                                vindsnp14, vindsnp15, vindsnp16, vindsnp17, 
                                vindsnp18, vindsnp19, vindsnp20, vindsnp22, 
                                make.row.names = T)
write_csv(bound_vind_snp, "bound_vind_snp.csv")

#reading and binding altai ####
altaisnp1=read_csv("altaichr1example1.snp.xz")
altaisnp2=read_csv("altaichr2example1.snp.xz")
altaisnp3=read_csv("altaichr3example1.snp.xz")
altaisnp4=read_csv("altaichr4example1.snp.xz")
altaisnp5=read_csv("altaichr5example1.snp.xz")
altaisnp6=read_csv("altaichr6example1.snp.xz")
altaisnp7=read_csv("altaichr7example1.snp.xz")
altaisnp8=read_csv("altaichr8example1.snp.xz")
altaisnp9=read_csv("altaichr9example1.snp.xz")
altaisnp10=read_csv("altaichr10example1.snp.xz")
altaisnp11=read_csv("altaichr11example1.snp.xz")
altaisnp12=read_csv("altaichr12example1.snp.xz")
altaisnp13=read_csv("altaichr13example1.snp.xz")
altaisnp14=read_csv("altaichr14example1.snp.xz")
altaisnp15=read_csv("altaichr15example1.snp.xz")
altaisnp16=read_csv("altaichr16example1.snp.xz")
altaisnp17=read_csv("altaichr17example1.snp.xz")
altaisnp18=read_csv("altaichr18example1.snp.xz")
altaisnp19=read_csv("altaichr19example1.snp.xz")
altaisnp20=read_csv("altaichr20example1.snp.xz")
altaisnp21=read_csv("altaichr21example1.snp.xz")
altaisnp22=read_csv("altaichr22example1.snp.xz")

bound_altai_snp=rbind.data.frame(altaisnp1, altaisnp2, altainp3, altaisnp4, altaisnp5, 
                                 altaisnp6, altaisnp7, altaisnp8, altaisnp9,
                                 altaisnp10, altaisnp11, altaisnp12, altaisnp13, 
                                 altaisnp14, altaisnp15, altaisnp16, altaisnp17, 
                                 altaisnp18, altaisnp19, altaisnp20, altaisnp22, 
                                make.row.names = T)
write_csv(bound_altai_snp, "bound_altai_snp.csv")

#ISSUE: R encounters a fatal error when trying to load all these frames. 
#likely due to small memory - might need to do it on the server. but have managed to do for 1 CHR apiece
#individuals are named by 'name' column at the end of the frames


