# attempt to make a chromoplot of local ancestry ####
library(karyoploteR)
library(regioneR)

d3snp = read.csv("deni4chr3example1.snp.xz") # have to read this in using base, otherwise is a tibble
d3rle = read.csv("deni4chr3example1.rle.xz")
d2rle = read.csv("deni4chr2example1.rle.xz")

# work out how to join the snp talt and tref columns to the rle file. 

d3rle_long <- rbind(d3rle, d3snp[, c("tref", "talt")]) # creates a fatal error 

d4rle_long <- rbind(d3rle, d2rle) #binding two rles together to try and create a proper rainfall. 
#if this works, it'd be a good idea to try and do it for the entirety of deni4. 

#this plot type needs a start and an end - unfortunately none of the dfs are equally matched
#used the rle data frame and it worked??? I'm not sure this is entirely correct but
#am willing to try and make a plot with it before I check 

# making a rainfall plot for a single chromosome. [without talt and tref] ####
#impt: note that "score" might not be necessary for this 

d4rle_long$target <- as.character(d3rle$target)
d4rle_long$type <- as.character(d3rle$type)


d4rle_gr <- toGRanges(d4rle_long[,c("chrom", "start", "end", "target", "type")])

seqlevelsStyle(d4rle_gr) <- "UCSC"

head(d3rle_gr)


variant.colors <- getVariantsColors(d4rle_gr$target, d4rle_gr$type) # this variant color thing isnt working
kp <- plotKaryotype(plot.type = 4)
kpPlotRainfall(kp, data = d4rle_gr, col=d4rle_gr$target)

#this genome is low coverage, so the graph that's produced isn't exactly as informative as one for 
#a high coverage sequence; but the fact that this even works! is pretty good
#a next step is to bind all the deni4 rle files so each works in concert to produce an
#entire rainfall

# trying plotting snp array raw data ####
#must make the target as.numeric , but that introduces NAs by coercion
#not sure how this plot can help here. 

d4rle_long$target <- as.numeric(d4rle_long$target)
d4snp.data <- toGRanges(d4rle_long[,c("chrom","start","end", "pos", "target", "score")])
head(d4snp.data)
kp <- plotKaryotype()
kpPoints(kp, data = d4snp.data, y=d4snp.data$score, r0=0.5, r1=1)


#creating a manhattan plot ####
#looks like a rainfall plot but is a little different, more like a pillar

d4rle_gr2 <- toGRanges(d4rle_long[,c("chrom", "start", "end","pos", "nscore")])

head(d4rle_gr2)

kp <- plotKaryotype(plot.type = 4)
kp <- kpPlotManhattan(kp, data = d4rle_gr2$pos)
