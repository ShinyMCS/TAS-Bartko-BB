# libraries
library(MASS)
# Part 1 - Initial Conditions
# Part 2 - Construct function "stats"
# Part 3a - Generate Random Values
# Part 3b - Construct Data Frame
# Part 3c - combiningin parts 3a and 3b as a function called "makeData"
# Part 4 - "OutputType" Function
# Part 5 - FOR loop

######################################################################

# Part 1- Initital Conditions

# Currently only works for nrep = 1

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

# Initial Conditions for FOR loops
M = 5000

###########################################################################

# Part 2 -construct function "stats"

stats = function(x,y) {
n = length(x)
d = x-y
s = x+y
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

tab
}

#########################################################################

# Part 3a - Generate Random Values

set.seed(1234); b = mvrnorm(n, mu = rep(0,2), Sigma = Sigma)
set.seed(1234); e = c(t(mvrnorm(2*n, mu = rep(0,2), Sigma = Sigma)))
set.seed(1234); bias = runif(1,0,maxbias)

# Part 3b - Construct Data Frame

Y = rep(c(100,100+bias),2*n) + c(Z%*% t(b)) + e

dat = data.frame(Y, Subject= rep(seq(10),each=nrep), Method= rep(c("Standard","New"),2*n), Replication = rep(rep(seq(nrep),each=nrep),n))
x = unlist(subset(dat, subset= Method == "Standard", select = Y))
y = unlist(subset(dat, subset= Method == "New", select = Y))


# Part 3c - parts 3a and 3b combined as a function

makeData = function(n=10,nrep=1,bias=0,Sigma = diag(rep(n,1+nrep))){
set.seed(1234); b = mvrnorm(n, mu = rep(0,2), Sigma = Sigma)
set.seed(1234); e = c(t(mvrnorm(2*n, mu = rep(0,2), Sigma = Sigma)))
set.seed(1234); bias = runif(1,0,maxbias)
Y = rep(c(100,100+bias),2*n) + c(Z%*% t(b)) + e
dat = data.frame(Y, Subject= rep(seq(n),each=nrep), Method= rep(c("Standard","New"),2*n), Replication = rep(rep(seq(nrep),each=nrep),n))
x = unlist(subset(dat, subset= Method == "Standard", select = Y))
y = unlist(subset(dat, subset= Method == "New", select = Y))
}
############################################################################
# Part 4 - OutputType Function
outputType = function(tab=matrix(rep(0,12),ncol=3)){
     sum(tab[,3] *c(1,2,4,8))
     }
     
############################################################################
# Part 5
M=200
OutDat = numeric(M)
for ( i in 1:M){
  set.seed(1234); b = mvrnorm(n, mu = rep(0,2), Sigma = Sigma)
  set.seed(1234); e = c(t(mvrnorm(2*n, mu = rep(0,2), Sigma = Sigma)))
  set.seed(1234); bias = runif(1,0,maxbias)
  Y = rep(c(100,100+bias),2*n) + c(Z%*% t(b)) + e
  dat = data.frame(Y, Subject= rep(seq(n),each=nrep), Method= rep(c("Standard","New"),2*n), Replication = rep(rep(seq(nrep),each=nrep),n))
  x = unlist(subset(dat, subset= Method == "Standard", select = Y))
  y = unlist(subset(dat, subset= Method == "New", select = Y))
  tab=stats(x,y);
  OutDat  = c(OutDat ,outputType(tab))
  }
###########################################################################
 


