 library(MASS)


M=10000
OutDat1=numeric()
pValDat=numeric()

##################################################
for (i in 1: M)
{
    dat = mvrnorm(10, mu=c(10,11), Sigma= matrix(c(1,rho,rho,1),ncol=2))
    Y1 = dat[,1]
    Y2 = dat[,2]
  
    d = Y1-Y2
    s = Y1+Y2
    z = s - mean(s)
    fit = lm(d~z)
    sse = anova(fit)[[2]][2]
    Fstar = ((sum(d^2)-sse)/2)/(sse/(n-2))

    #First Row: BB's Fstar
    tab = t(c(Fstar, pf(Fstar, df1=2, df2=(n-2), lower.tail = FALSE)))
    fit.coef = summary(fit)$coefficients
    #Second Row: Mean Centered Fit
    tab = rbind(tab, cbind((fit.coef[,3])^2, fit.coef[,4]))

    #Fourth Row: t.test on differences (Equilvanent to paired T)
    ttest = t.test(d)
    tab = rbind(tab, t(c(ttest$statistic, ttest$p.value)))
    tab = round(tab, 4)
    tab = cbind(tab, as.numeric(tab[,2]<0.05))
    colnames(tab)=c("TestStat","pVal","Sig? (<0.05)")
    rownames(tab) =c("Fstar (BB)","Mean Centered Intercept","Variance","Paired T")

    Type = sum(tab[,3] *c(1,2,4,8))
    if((Type == 3)|(Type==9)){break}
    if (i%%500==0){print(i);flush.console()}
    OutDat=c(OutDat,Type)
}

