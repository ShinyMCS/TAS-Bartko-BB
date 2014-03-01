library(MASS)

set.seed(66734)
N = 10000
rho = 0.6
dat = list()
for(i in 1:N) dat[[i]] = mvrnorm(10, mu=c(10,11), Sigma= matrix(c(1,rho,rho,1),ncol=2))

o = stats(dat[[1]][,1], dat[[1]][,2])[2,]
for(i in 2:N) o = rbind(o, stats(dat[[i]][,1], dat[[i]][,2])[2,])

hits = ((o[,1] < 0.05) & (o[,2] > 0.05)) & ((o[,3] < 0.05) != (o[,4] < 0.05)) 
o[hits, ]

w = which(hits)

par(ask=TRUE)
for(i in 1:length(w)) {
x = dat[[w[i]]][,1]
y = dat[[w[i]]][,2]
plot(x+y,x-y)
}




