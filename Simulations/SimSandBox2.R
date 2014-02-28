# Function "stats" (Kevin Hayes)

stats = function(x,y) {
n = length(x)
d = x-y
s = x+y
z = s - mean(s)
fit = lm(d~z)
sse = anova(fit)[[2]][2]
Fstar = ((sum(d^2)-sse)/2)/(sse/(n-2))
tab = c(Fstar, pf(Fstar, df1=2, df2=(n-2), lower.tail = FALSE))
fit.coef = summary(fit)$coefficients
tab = cbind(tab, rbind((fit.coef[,3])^2, fit.coef[,4]))
ttest = t.test(d)
tab = cbind(tab, c(ttest$statistic, ttest$p.value))
tab = round(tab, 4)
dimnames(tab) = NULL
tab
}


#####################################################################
library(MASS)
set.seed(66734)
rho = 0.4
M=100

dat = list()

for(i in 1:M) dat[[i]] = mvrnorm(10, mu=c(10,11), Sigma= matrix(c(1,rho,rho,1),ncol=2))

o = stats(dat[[1]][,1], dat[[1]][,2])[2,]
for(i in 2:1000) o = rbind(o, stats(dat[[i]][,1], dat[[i]][,2])[2,])
sum(o[,3] > o[,4])

o[ (o[,3] > 0.05) * (o[,4] < 0.05) , ]


plot(o[,3],o[,4])
abline(c(0,1), col="red")
abline(v=0.05, col="grey")
abline(h=0.05, col="grey")

########################################################################
