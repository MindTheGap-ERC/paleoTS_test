##This script was compiled to see how poorly model selection performed for simulated data 
#using just functions from the paleoTS package 0.5.3
#Melanie J Hopkins 2/26/24.

compile<-array(dim = c(4,100,9))
ns<-c(5,10,15,20,25,35,50,100,200)

for (j in 1:9){
for (i in 1:100){
test<-sim.Stasis(ns=ns[j],omega = 0.5)
fts<-fitSimple(test,model = 'Stasis')
fto<-fitSimple(test,model = 'OU')
ftb<-fitSimple(test,model = 'URW')
ftt<-fitSimple(test,model = 'GRW')
compile[,i,j]<-compareModels(fts,fto,ftb,ftt,silent = TRUE)$modelFits$Akaike.wt
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

boxplot(x~y+z,data = compile.group,
        col=c('lightgreen','darkgoldenrod2','dodgerblue3','firebrick3'),
        xaxt = 'n',
        xlab = 'Time Series Length',
        'AICc weight'
)
axis(1,at=c(2.5,6.5,10.5,14.5,18.5,22.5,26.5,30.5,34.5),
     labels = c(5,10,15,20,25,35,50,100,200))
mtext('green = stasis, yellow = OU, blue = URW, red = GRW',side=3)


