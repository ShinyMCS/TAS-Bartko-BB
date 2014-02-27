M=10000

OutDat=numeric(M)

##################################################
for (i in 1: M)
{
    nrep = 1    # Single Replicater case 
    n    = 10   # number of cases
    maxbias = 5 # Maximum level of intermethod bias


    lambda = 1.05
    rho = 0.89
    Psi = diag(924 * c(1,lambda) )
    Psi[1,2] = Psi[2,1] = rho * sqrt(Psi[1,1] * Psi[2,2])
    upsilon = 1.22
    gamma = 0.3
    SetSigma = diag( 37.4 * c(1,upsilon) )
    SetSigma[1,2] = SetSigma[2,1] = gamma * sqrt(SetSigma[1,1] * SetSigma[2,2])
    Z = cbind(rep(c(1,0),2), rep(c(0,1),2))

    b = mvrnorm(n, mu = rep(0,2), Sigma = Sigma)
    e = c(t(mvrnorm(2*n, mu = rep(0,2), Sigma = Sigma)))
    bias = runif(1,0,maxbias)
    Y = rep(c(100,100+bias),2*n) + c(Z%*% t(b)) + e

    dat = data.frame(Y, Subject= rep(seq(10),each=nrep), Method= rep(c("Standard","New"),2*n), Replication = rep(rep(seq(nrep),each=nrep),n))
    Y1 = unlist(subset(dat, subset= Method == "Standard", select = Y))
    Y2 = unlist(subset(dat, subset= Method == "New", select = Y))


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
    # if(Type == 5){break}
    OutDat=c(OutDat,Type)
}
