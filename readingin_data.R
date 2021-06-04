library(tidyverse)

#altai1 reading in ####
altai1=read_csv("altaichr1example1.snp.xz")
altai2=read.csv("altaichr2example1.snp.xz")
altai3=read.csv("altaichr3example1.snp.xz")
altai4=read.csv("altaichr4example1.snp.xz")
altai5=read.csv("altaichr5example1.snp.xz")
altai6=read.csv("altaichr6example1.snp.xz")
altai7=read.csv("altaichr7example1.snp.xz")
altai8=read.csv("altaichr8example1.snp.xz")
altai9=read.csv("altaichr9example1.snp.xz")
altai10=read.csv("altaichr10example1.snp.xz")
altai11=read.csv("altaichr11example1.snp.xz")
altai12=read.csv("altaichr12example1.snp.xz")
altai13=read.csv("altaichr13example1.snp.xz")
altai14=read.csv("altaichr14example1.snp.xz")
altai15=read.csv("altaichr15example1.snp.xz")
altai16=read.csv("altaichr16example1.snp.xz")
altai17=read.csv("altaichr17example1.snp.xz")
altai18=read.csv("altaichr18example1.snp.xz")
altai19=read.csv("altaichr19example1.snp.xz")
altai20=read.csv("altaichr20example1.snp.xz")
altai21=read.csv("altaichr21example1.snp.xz")
altai22=read.csv("altaichr22example1.snp.xz")

bound_alt1_snp = rbind.data.frame(altai1,altai2,altai3,altai4,altai5,altai6,
                                  altai7,altai8,altai9,altai10,altai11,altai12,
                                  altai13,altai14,altai15,altai16,altai17,altai18,
                                  altai19,altai20,altai21,altai22, make.row.names = T)
write_csv(bound_alt1_snp, 'alt-1_snp.csv')            

altai1=read.csv("altaichr2example1.res.xz")


altai1=read.csv("altaichr1example1.rle.xz")
altai2=read.csv("altaichr2example1.rle.xz")
altai3=read.csv("altaichr3example1.rle.xz")
altai4=read.csv("altaichr4example1.rle.xz")
altai5=read.csv("altaichr5example1.rle.xz")
altai6=read.csv("altaichr6example1.rle.xz")
altai7=read.csv("altaichr7example1.rle.xz")
altai8=read.csv("altaichr8example1.rle.xz")
altai9=read.csv("altaichr9example1.rle.xz")
altai10=read.csv("altaichr10example1.rle.xz")
altai11=read.csv("altaichr11example1.rle.xz")
altai12=read.csv("altaichr12example1.rle.xz")
altai13=read.csv("altaichr13example1.rle.xz")
altai14=read.csv("altaichr14example1.rle.xz")
altai15=read.csv("altaichr15example1.rle.xz")
altai16=read.csv("altaichr16example1.rle.xz")
altai17=read.csv("altaichr17example1.rle.xz")
altai18=read.csv("altaichr18example1.rle.xz")
altai19=read.csv("altaichr19example1.rle.xz")
altai20=read.csv("altaichr20example1.rle.xz")
altai21=read.csv("altaichr21example1.rle.xz")
altai22=read.csv("altaichr22example1.rle.xz")

bound_alt1_rle = rbind.data.frame(altai1,altai2,altai3,altai4,altai5,altai6,
                                  altai7,altai8,altai9,altai10,altai11,altai12,
                                  altai13,altai14,altai15,altai16,altai17,altai18,
                                  altai19,altai20,altai21,altai22, make.row.names = T)
write_csv(bound_alt1_rle, 'bound_alt-1_rle.csv') 

#altai2 reading in ####
altai1=read.csv("altaichr1example2.bin.xz")
altai2=read.csv("altaichr2example2.bin.xz")
altai3=read.csv("altaichr3example2.bin.xz")
altai4=read.csv("altaichr4example2.bin.xz")
altai5=read.csv("altaichr5example2.bin.xz")
altai6=read.csv("altaichr6example2.bin.xz")
altai7=read.csv("altaichr7example2.bin.xz")
altai8=read.csv("altaichr8example2.bin.xz")
altai9=read.csv("altaichr9example2.bin.xz")
altai10=read.csv("altaichr10example2.bin.xz")
altai11=read.csv("altaichr11example2.bin.xz")
altai12=read.csv("altaichr12example2.bin.xz")
altai13=read.csv("altaichr13example2.bin.xz") 
altai14=read.csv("altaichr14example2.bin.xz")
altai15=read.csv("altaichr15example2.bin.xz")
altai16=read.csv("altaichr16example2.bin.xz")
altai17=read.csv("altaichr17example2.bin.xz")
altai18=read.csv("altaichr18example2.bin.xz")
altai19=read.csv("altaichr19example2.bin.xz")
altai20=read.csv("altaichr20example2.bin.xz")
altai21=read.csv("altaichr21example2.bin.xz")
altai22=read.csv("altaichr22example2.bin.xz")

bound_alt2_bin = rbind.data.frame(altai1,altai2,altai3,altai4,altai5,altai6,
                                  altai7,altai8,altai9,altai10,altai11,altai12,
                                  altai13,altai14,altai15,altai16,altai17,altai18,
                                  altai19,altai20,altai21,altai22, make.row.names = T)
write_csv(bound_alt2_bin, 'bound_alt-2_bin.csv')            


altai1=read.csv("altaichr1example2.res.xz")
altai2=read.csv("altaichr2example2.res.xz")
altai3=read.csv("altaichr3example2.res.xz")
altai4=read.csv("altaichr4example2.res.xz")
altai5=read.csv("altaichr5example2.res.xz")
altai6=read.csv("altaichr6example2.res.xz")
altai7=read.csv("altaichr7example2.res.xz")
altai8=read.csv("altaichr8example2.res.xz")
altai9=read.csv("altaichr9example2.res.xz")
altai10=read.csv("altaichr10example2.res.xz")
altai11=read.csv("altaichr11example2.res.xz")
altai12=read.csv("altaichr12example2.res.xz")
altai13=read.csv("altaichr13example2.res.xz") 
altai14=read.csv("altaichr14example2.res.xz")
altai15=read.csv("altaichr15example2.res.xz")
altai16=read.csv("altaichr16example2.res.xz")
altai17=read.csv("altaichr17example2.res.xz")
altai18=read.csv("altaichr18example2.res.xz")
altai19=read.csv("altaichr19example2.res.xz")
altai20=read.csv("altaichr20example2.res.xz")
altai21=read.csv("altaichr21example2.res.xz")
altai22=read.csv("altaichr22example2.res.xz")

bound_alt2_res = rbind.data.frame(altai1,altai2,altai3,altai4,altai5,altai6,
                                  altai7,altai8,altai9,altai10,altai11,altai12,
                                  altai13,altai14,altai15,altai16,altai17,altai18,
                                  altai19,altai20,altai21,altai22, make.row.names = T)
write_csv(bound_alt2_res, 'bound_alt-2_res.csv')            

#chag reading in ####
chag1 = read_csv("chagchr1example1.rle.xz")
chag2 = read_csv("chagchr2example1.bin.xz")
chag3 = read_csv("chagchr3example1.bin.xz")
chag4 = read_csv("chagchr4example1.bin.xz")
chag5 = read_csv("chagchr5example1.bin.xz")
chag6 = read_csv("chagchr6example1.bin.xz")
chag7 = read_csv("chagchr7example1.bin.xz")
chag8 = read_csv("chagchr8example1.bin.xz")
chag9 = read_csv("chagchr9example1.bin.xz")
chag10 = read_csv("chagchr10example1.snp.xz") #this is loading in snp!
chag11 = read_csv("chagchr11example1.bin.xz")
chag12 = read_csv("chagchr12example1.bin.xz")
chag13 = read_csv("chagchr13example1.bin.xz")
chag14 = read_csv("chagchr14example1.bin.xz")
chag15 = read_csv("chagchr15example1.bin.xz")
chag16 = read_csv("chagchr16example1.bin.xz")
chag17 = read_csv("chagchr17example1.bin.xz")
chag18 = read_csv("chagchr18example1.bin.xz")
chag19 = read_csv("chagchr19example1.bin.xz")
chag20 = read_csv("chagchr20example1.bin.xz")
chag21 = read_csv("chagchr21example1.bin.xz")
chag22 = read_csv("chagchr22example1.bin.xz")

bound_chag_bin = rbind.data.frame(chag1,chag2,chag3,chag4,chag5,chag6,chag7,
                                  chag8,chag9,chag10,chag11,chag12,chag13,
                                  chag14,chag15,chag16,chag17,chag18,chag19,
                                  chag20,chag21,chag22, make.row.names = T)
write_csv(bound_chag_bin, "chag_bin.csv")

chag1 = read_csv("chagchr1example2.snp.xz")
chag2 = read_csv("chagchr2example2.snp.xz")
chag3 = read_csv("chagchr3example2.snp.xz")
chag4 = read_csv("chagchr4example2.snp.xz")
chag5 = read_csv("chagchr5example2.snp.xz")
chag6 = read_csv("chagchr6example2.snp.xz")
chag7 = read_csv("chagchr7example2.snp.xz")
chag8 = read_csv("chagchr8example2.snp.xz")
chag9 = read_csv("chagchr9example2.snp.xz")
chag10 = read_csv("chagchr10example2.snp.xz")
chag11 = read_csv("chagchr11example2.snp.xz")
chag12 = read_csv("chagchr12example2.snp.xz")
chag13 = read_csv("chagchr13example2.snp.xz")
chag14 = read_csv("chagchr14example2.snp.xz")
chag15 = read_csv("chagchr15example2.snp.xz")
chag16 = read_csv("chagchr16example2.snp.xz")
chag17 = read_csv("chagchr17example2.snp.xz")
chag18 = read_csv("chagchr18example2.snp.xz")
chag19 = read_csv("chagchr19example2.snp.xz")
chag20 = read_csv("chagchr20example2.snp.xz")
chag21 = read_csv("chagchr21example2.snp.xz")
chag22 = read_csv("chagchr22example2.snp.xz")

bound_chag_rle = rbind.data.frame(chag1,chag2,chag3,chag4,chag5,chag6,chag7,
                                  chag8,chag9,chag10,chag11,chag12,chag13,
                                  chag14,chag15,chag16,chag17,chag18,chag19,
                                  chag20,chag21,chag22, make.row.names = T)
write_csv(bound_chag_rle, "chag_snp_eg2.csv")

#vindija reading in ####

vind1 = read_csv("vindchr1example2.bin.xz")
vind2 = read_csv("vindchr2example2.bin.xz")
vind3 = read_csv("vindchr3example2.bin.xz")
vind4 = read_csv("vindchr4example2.bin.xz")
vind5 = read_csv("vindchr5example2.bin.xz")
vind6 = read_csv("vindchr6example2.bin.xz")
vind7 = read_csv("vindchr7example2.bin.xz")
vind8 = read_csv("vindchr8example2.bin.xz")
vind9 = read_csv("vindchr9example2.bin.xz")
vind10 = read_csv("vindchr10example2.bin.xz")
vind11 = read_csv("vindchr11example2.bin.xz")
vind12 = read_csv("vindchr12example2.bin.xz")
vind13 = read_csv("vindchr13example2.bin.xz")
vind14 = read_csv("vindchr14example2.bin.xz")
vind15 = read_csv("vindchr15example2.bin.xz")
vind16 = read_csv("vindchr16example2.bin.xz")
vind17 = read_csv("vindchr17example2.bin.xz")
vind18 = read_csv("vindchr18example2.bin.xz")
vind19 = read_csv("vindchr19example2.bin.xz")
vind20 = read_csv("vindchr20example2.bin.xz")
vind21 = read_csv("vindchr21example2.bin.xz")
vind22 = read_csv("vindchr22example2.bin.xz")

vind_bin = rbind.data.frame(vind1,vind2,vind3,vind4,vind5,vind6,vind7,vind8,vind9,
                            vind10,vind11,vind12,vind13,vind14,vind15,vind16,
                            vind17,vind18,vind19,vind20,vind21,vind22,
                            make.row.names = T)

write_csv(vind_bin,"vind_bin_eg2.csv")

#mezmai reading in ####
mes1 = read_csv("mesmaichr1example2.bin.xz")
mes2 = read_csv("mesmaichr2example2.bin.xz")
mes3 = read_csv("mesmaichr3example2.bin.xz")
mes4 = read_csv("mesmaichr4example2.bin.xz")
mes5 = read_csv("mesmaichr5example2.bin.xz")
mes6 = read_csv("mesmaichr6example2.bin.xz")
mes7 = read_csv("mesmaichr7example2.bin.xz")
mes8 = read_csv("mesmaichr8example2.bin.xz")
mes9 = read_csv("mesmaichr9example2.bin.xz")
mes10 = read_csv("mesmaichr10example2.bin.xz")
mes11 = read_csv("mesmaichr11example2.bin.xz")
mes12 = read_csv("mesmaichr12example2.bin.xz")
mes13 = read_csv("mesmaichr13example2.bin.xz")
mes14 = read_csv("mesmaichr14example2.bin.xz")
mes15 = read_csv("mesmaichr15example2.bin.xz")
mes16 = read_csv("mesmaichr16example2.bin.xz")
mes17 = read_csv("mesmaichr17example2.bin.xz")
mes18 = read_csv("mesmaichr18example2.bin.xz")
mes19 = read_csv("mesmaichr19example2.bin.xz")
mes20 = read_csv("mesmaichr20example2.bin.xz")
mes21 = read_csv("mesmaichr21example2.bin.xz")
mes22 = read_csv("mesmaichr22example2.bin.xz")

mes_rle = rbind.data.frame(mes1,mes2,mes3,mes4,mes5,mes6,mes7,mes8,mes9,mes10,mes11,mes12,mes13,
                           mes14,mes15,mes16,mes17,mes18,mes19,mes20,mes21,mes22,
                           make.row.names = T)
write_csv(mes_rle, "mes_bin_eg2.csv")

#deni8 reading in ####
d8rle1 = read.csv("deni8chr1example2.snp.xz")
d8rle2 = read.csv("deni8chr2example2.snp.xz")
d8rle3 = read.csv("deni8chr3example2.snp.xz")
d8rle4 = read.csv("deni8chr4example2.snp.xz")
d8rle5 = read.csv("deni8chr5example2.snp.xz")
d8rle6 = read.csv("deni8chr6example2.snp.xz")
d8rle7 = read.csv("deni8chr7example2.snp.xz")
d8rle8 = read.csv("deni8chr8example2.snp.xz")
d8rle9 = read.csv("deni8chr9example2.snp.xz")
d8rle10 = read.csv("deni8chr10example2.snp.xz")
d8rle11 = read.csv("deni8chr11example2.snp.xz")
d8rle12 = read.csv("deni8chr12example2.snp.xz")
d8rle13 = read.csv("deni8chr13example2.snp.xz")
d8rle14 = read.csv("deni8chr14example2.snp.xz")
d8rle15 = read.csv("deni8chr15example2.snp.xz")
d8rle16 = read_csv("deni8chr16example2.snp.xz")
d8rle17 = read.csv("deni8chr17example2.snp.xz")
d8rle18 = read.csv("deni8chr18example2.snp.xz")
d8rle19 = read.csv("deni8chr19example2.snp.xz")
d8rle20 = read.csv("deni8chr20example2.snp.xz")
d8rle21 = read.csv("deni8chr21example2.snp.xz")
d8rle22 = read.csv("deni8chr22example2.snp.xz")

bound_d8_bin= rbind.data.frame(d8rle1, d8rle2,d8rle3,d8rle4,d8rle5,d8rle6,
                               d8rle7,d8rle8,d8rle9,d8rle10,d8rle11,d8rle12,
                               d8rle13,d8rle14,d8rle15,d8rle16,d8rle17,d8rle18,
                               d8rle19,d8rle20,d8rle21,d8rle22)
write_csv(bound_d8_bin, 'bound_deni8snp_eg2.csv') 

#deni 4 reading in ####
d4_10 = read_csv("deni4chr10example2.snp.xz")


# loading in total files ####

setwd("~/analyses/admixfrog/res/chag_res/Chagyrskaya")
chag_bin = read_binout("chag_bin_eg2.csv")
chag_rle = read_rle("chag_rle_eg2.csv")

setwd("~/analyses/admixfrog/res/deni8_res")
deni8_bin = read_binout("bound_deni8bin_eg2.csv")
deni8_rle = read_rle("bound_deni8_rle_eg2.csv")

setwd("~/analyses/admixfrog/res/mesmai1_res/mesmai1")
mes_bin = read_binout("mes_bin_eg2.csv")
mes_rle = read_rle("mes_rle_eg2.csv")

setwd("~/analyses/admixfrog/res/vind33_res/vindija")
vind_bin = read_binout("vind_bin_eg2.csv")
vind_rle = read_rle("vind_rle_eg2.csv")
