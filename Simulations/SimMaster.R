# libraries
library(MASS)
# Part 1 - Initial Conditions
# Part 2 - Construct function "stats"
# Part 3a - Generate Random Values
# Part 3b - Construct Data Frame

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
Sigma = diag( 37.4 * c(1,upsilon) )
Sigma[1,2] = Sigma[2,1] = gamma * sqrt(Sigma[1,1] * Sigma[2,2])
Z = cbind(rep(c(1,0),2), rep(c(0,1),2))

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
tab = c(Fstar, pf(Fstar, df1=2, df2=(n-2), lower.tail = FALSE))
fit.coef = summary(fit)$coefficients
tab = cbind(tab, rbind((fit.coef[,3])^2, fit.coef[,4]))
ttest = t.test(d)
tab = cbind(tab, c(ttest$statistic, ttest$p.value))
tab = round(tab, 4)
dimnames(tab) = NULL
tab
}

#########################################################################

# Part 3a - Generate Random Values

set.seed(1234); b = mvrnorm(n, mu = rep(0,2), Sigma = Sigma)
set.seed(1234); e = c(t(mvrnorm(2*n, mu = rep(0,2), Sigma = Sigma)))
set.seed(1234); bias = runif(1,0,maxbias)

# Part 3b - Construct Data Frame

Y = rep(c(100,100+bias),2*n) + c(Z%*% t(b)) + e

dat = data.frame(Y, Subject= rep(seq(10),each=nrep)), Method= rep(c("Standard","New"),2*n)), Replication = rep(rep(seq(nrep),each=nrep),n))
x = unlist(subset(dat, subset= Method == "Standard", select = Y))
y = unlist(subset(dat, subset= Method == "New", select = Y))

############################################################################
