#making graphs for the rle dataframes ####
library(VGAM)
library(tidyverse)

#fit the observed run length to both a lomax and exponential ####
#@param data: dframe to fit, needs map_len column, grouped by sample
#@param trunc runs shorted than trunc are removed 

d4_chr1 = read_rle("deni4chr1example2.rle.xz")

rle_fit_pars <- function(data, trunc=0.05){
  df <- data %>% group_by(chrom) #dataf must be renamed each time you wanna use this function
  rle_fit_grp(df, trunc) #there isnt a sample column, think this set will work when collating multiple samples
}                        #but does work when joining by chrom. 


d4_chr1_pars = rle_fit_pars(d4_chr1, trunc = 0.05)
#next issue is that map_len column doesnt exist in the created data-set. 

#creating R, which is a VECTOR as it turns out####
R = rle_fit_pars(d4_chr1, trunc) %>%
  left_join(ages) %>%
  mutate(age=replace_na(age, 0)) %>%
  mutate(sage=age / SCALING) %>%
  mutate(semean = emean + age / SCALING, 
         slmean = lmean + age / SCALING) %>%
  arrange(semean) %>% 
  mutate(sample=factor(sample, levels=unique(sample)))
#commenting out the n = n[l>=trunc] makes the functions work. 
#however that adds to the issue that there is no object 'ages' what is thos object?
#ages seems to be something in snakemake - from hmm_rle.R. Ask Guy about it .

#fit distance ####
#@param df_grp: grouped data frame

rle_fit_grp <- function(df_grp, trunc=0.05){
  if(! 'n' %in% names(df_grp)) df_grp$n <- 1
  df = df_grp
  
  x1 = df %>% do( p2=fit_exp_rep(.$map_len, .$n, trunc=trunc)) %>% 
    unnest(p2) %>%
    mutate(emean=rate)
  x2 = df %>% do( p2=fit_lomax_rep(.$map_len, .$n, trunc=trunc)) %>% 
    unnest(p2) %>%
    mutate(lmean=(shape-1)/scale)
  
  return(inner_join(x1, x2) %>% mutate(delta_ll = ll_lomax - ll_exp) %>%
           mutate(pval = pchisq(2 * delta_ll, 1, lower.tail=F)/2) )
}
#argument 'by' doesn't exist but it also won't work with it. 

#to make the functions above and below work ####
pred_dlomax <- function(data, pars, trunc=0.05){
  s = seq(trunc, max(data$map_len), .01)
  lpred = pars %>% rowwise %>% 
    do(l = data.frame(map_len=s, 
                      lomax=dlomax(s, shape=.$shape, scale=.$scale)/
                        plomax(trunc, shape=.$shape, scale=.$scale, lower=F)))
}

pred_dexp <- function(data, pars, trunc=0.05){
  s = seq(trunc, max(data$map_len), .01)
  lpred = pars %>% rowwise %>% 
    do(l = data.frame(map_len=s, 
                      exp=dexp(s, .$rate)/
                        pexp(trunc, .$rate, lower=F)))
}


#rle plot ####
rle_fit_plot <- function(data, R, trunc=0.049, xmax=6){
  data2 = data %>% filter(map_len > trunc)
  P = data2 %>%
    ggplot(aes(x=map_len, group=sample)) +
    geom_point(aes(y=1-..y..), stat='ecdf', pad=F) +
    scale_y_log10(expand=expand_scale(0,0), name='Quantile') +
    scale_x_continuous(expand=expand_scale(0,0), name = "Length (cM)") +
    coord_cartesian(xlim=c(trunc, xmax), ylim=c(1e-5, 1)) +
    facet_wrap(~sample, scale='free') 
  
  s = seq(trunc, max(data$map_len), .01)
  lpred = R %>% rowwise %>% 
    do(l = data.frame(lengths=s, 
                      lomax=plomax(s, shape=.$shape, scale=.$scale, lower=F)/
                        plomax(trunc, shape=.$shape, scale=.$scale, lower=F)))
  epred = R %>% rowwise %>% 
    do(e = data.frame(lengths=s, 
                      exp=exp(-(s - trunc) * .$rate)))
  
  pred = inner_join(unnest(bind_cols(R, lpred)), unnest(bind_cols(R, epred))) %>%
    select(lengths, sample, lomax, exp) %>%
    gather(k, v, lomax, exp)
  
  
  P + geom_step(data=pred, mapping=aes(color=k, x=lengths, y=v, group=k))
}
#R has been defined in lib.R; however, now there's an issue with rep_len; idk where that is tho
#'cannot replicate NULL to a non-zero length
rle_fit_plot(d4_chr1, R)

#fit exponential distribution with repeated obs####
#
#' @param l lengths
#' @param n number of repeats
fit_exp_rep=function(l, n=1, trunc=4){
  if(length(n) == 1) n = rep(1, length(l))
  #n = n[l>=trunc] #NEW PROBLEM = these two won't work as comparison (5) is possible only for atomic and list types
  #l = l[l>=trunc]
  
  try({
    f = function(par) -sum(n * dtexp(l, exp(par[1]), trunc=trunc))
    res = optim(c(-1), f, method="L-BFGS-B")
    par =exp(res$par)
    return(data.frame(rate=par, ll_exp = -res$value))
  }, silent=T)
  return(data.frame(rate=NA, ll_exp=NA))
}

#fit lomax distribution####
fit_lomax_rep=function(l, n, trunc=0.01){
  #n = n[l>=trunc] #NEW PROBLEM = these two won't work as comparison (5) is possible only for atomic and list types
  #l = l[l>=trunc]
  try({
    f = function(par)-sum(n * dtlomax(l, scale=par[1], shape=par[2], trunc=trunc))
    res = optim(c(4, 3), f, method="L-BFGS-B", lower=c(1e-5, 1))
    pars = res$par
    return(data.frame(scale=pars[1], shape=pars[2], ll_lomax=-res$value))
  }, silent=T)
  return(data.frame(scale=NA, shape=NA, ll_lomax=NA))
}

#truncated lomax density####
dtlomax <- function(x, scale, shape, trunc, log=T){
  if(log){
    k <- VGAM::dlomax(x, scale=scale, shape=shape, log=T) - 
      VGAM::plomax(trunc, scale=scale, shape=shape, lower=F, log=T)
    return(k)
  } else {
    print("lomax normal")
    k <- VGAM::dlomax(x, scale=scale, shape=shape, log=F) / 
      VGAM::plomax(trunc, scale=scale, shape=shape, lower=F, log=F)
    return(k)
  }
}

#truncated exponential density####
dtexp <- function(x, rate=1, trunc=0, log=T){
  if(log){
    dexp(x, rate, log=T) - pexp(trunc, rate, lower=F, log=T)
  } else {
    dexp(x, rate, log=F) / pexp(trunc, rate, lower=F, log=F)
  }
}
