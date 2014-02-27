# libraries
library(MASS)

######################################################################

# Initital Conditions
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

#########################################################################


set.seed(1234); b = mvrnorm(n, mu = rep(0,2), Sigma = Sigma)
set.seed(1234); e = c(t(mvrnorm(2*n, mu = rep(0,2), Sigma = Sigma)))
set.seed(1234); bias = runif(1,0,maxbias)


Y = rep(c(100,100+bias),2*n) + c(Z%*% t(b)) + e

dat = data.frame(Y, Subject= rep(seq(10),each=nrep)),
 Method= rep(c("Standard","New"),2*n), Replication = rep(rep(seq(nrep),each=nrep),n))
x = unlist(subset(dat, subset= Method == "Standard", select = Y))
y = unlist(subset(dat, subset= Method == "New", select = Y))

############################################################################
