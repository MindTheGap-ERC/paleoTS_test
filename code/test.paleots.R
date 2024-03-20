##This script was compiled to see how poorly model selection performed for simulated data 
#using just functions from the paleoTS package 0.5.3
#Original script by Melanie J Hopkins 2/26/24.
# Modified by Niklas Hohmann

compile<-array(dim = c(4,100,9))

#### Parameters for simulation ####
# Chosen to match those in "Identification of the Mode of Evolution in Incomplete Carbonate Successions" by Hohmann et al. 2023
# https://doi.org/10.1101/2023.12.18.572098 
# Code available under https://doi.org/10.5281/zenodo.10390267
ns<-c(5,10,15,20,25,35,50,100,200) # time series length
specimens_per_sample = 100 # no of specimens collected per sampling station
intra_pop_var = 0.1 # variance of trait values of pupulation around mean trait value
stasis_var = 1 #variance of stasis model
no_of_specimens = 100 # specimens found at each sampling location
grw_step_var = 0.1 # variance for GRW model

cat("Running stasis simulations \n")
for (j in 1:9){
  print(j)
  for (i in 1:100){
    
    test<-paleoTS::sim.Stasis(ns=ns[j],
                             theta = 0,
                             omega = 0.5,
                             vp = intra_pop_var,
                             nn = rep(no_of_specimens, ns[j]))
    fts<-paleoTS::fitSimple(test,model = 'Stasis')
    fto<-paleoTS::fitSimple(test,model = 'OU')
    ftb<-paleoTS::fitSimple(test,model = 'URW')
    ftt<-paleoTS::fitSimple(test,model = 'GRW')
    compile[,i,j]<-paleoTS::compareModels(fts,fto,ftb,ftt,silent = TRUE)$modelFits$Akaike.wt
  }
}


compile.group<-data.frame(
  x=matrix(compile,ncol=1),
  y=c(rep(c('Stasis','OU','URW','GRW'),900)),
  z=c(rep(5,400),rep(10,400),rep(15,400),rep(20,400),rep(25,400),
                    rep(35,400),rep(50,400),rep(100,400),rep(200,400)),
  stringsAsFactors = FALSE
)
compile.group$y<-ordered(compile.group$y,levels=c('Stasis','OU','URW','GRW'))
jpeg("figs/test_stasis.jpeg")
boxplot(x~y+z,data = compile.group,
        col=c('lightgreen','darkgoldenrod2','dodgerblue3','firebrick3'),
        xaxt = 'n',
        xlab = 'Time Series Length',
        main = "AICc weight under simulated stasis",
        'AICc weight'
)
axis(1,at=c(2.5,6.5,10.5,14.5,18.5,22.5,26.5,30.5,34.5),
     labels = c(5,10,15,20,25,35,50,100,200))
mtext('green = stasis, yellow = OU, blue = URW, red = GRW',side=3)
dev.off()


cat("Running URW simulations \n")
for (j in 1:9){
  print(j)
  for (i in 1:100){
    
    test = paleoTS::sim.GRW(ns = ns[j], # time series length
                             ms = 0, # mean step, set to 0 for URW model
                             vs = grw_step_var, # step variance
                             vp = intra_pop_var, # intrapopulation variance
                             nn = rep(no_of_specimens, ns[j]))
    fts<-paleoTS::fitSimple(test,model = 'Stasis')
    fto<-paleoTS::fitSimple(test,model = 'OU')
    ftb<-paleoTS::fitSimple(test,model = 'URW')
    ftt<-paleoTS::fitSimple(test,model = 'GRW')
    compile[,i,j]<-paleoTS::compareModels(fts,fto,ftb,ftt,silent = TRUE)$modelFits$Akaike.wt
  }
}

compile.group<-data.frame(
  x=matrix(compile,ncol=1),
  y=c(rep(c('Stasis','OU','URW','GRW'),900)),
  z=c(rep(5,400),rep(10,400),rep(15,400),rep(20,400),rep(25,400),
      rep(35,400),rep(50,400),rep(100,400),rep(200,400)),
  stringsAsFactors = FALSE
)
compile.group$y<-ordered(compile.group$y,levels=c('Stasis','OU','URW','GRW'))

jpeg("figs/test_urw.jpeg")
boxplot(x~y+z,data = compile.group,
        col=c('lightgreen','darkgoldenrod2','dodgerblue3','firebrick3'),
        xaxt = 'n',
        xlab = 'Time Series Length',
        main = "AICc weight under simulated GRW",
        'AICc weight'
)
axis(1,at=c(2.5,6.5,10.5,14.5,18.5,22.5,26.5,30.5,34.5),
     labels = c(5,10,15,20,25,35,50,100,200))
mtext('green = stasis, yellow = OU, blue = URW, red = GRW',side=3)
dev.off()
cat("Done! Results are in figs/")
