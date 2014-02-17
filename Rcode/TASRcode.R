# Make Sigma.D

n = 7
rho = 0.6
sigma.D = 2.2
ones = matrix(1, nrow= n)
Sigma.D = diag(n) - (rho^2) * (diag(n) - (1/n)*ones %*% t(ones)) 
Sigma.D = Sigma.D * sigma.D^2




# Sigma.D inverse

solve(Sigma.D)
(1/sigma.D^2) * (n- rho^2) / (n* (1-rho^2))		#diagonal elements
(1/sigma.D^2) * (rho^2) / (n* (1-rho^2))		#off diagonal elements




# determinant Sigma.D

det(Sigma.D)
(sigma.D^(2*n)) *((1-rho^2)^(n-1))




#Quadratic forms

x = rnorm(n)
matrix(x,nrow=1) %*% solve(Sigma.D) %*% matrix(x,ncol=1) 
sum( x * (x - (rho^2) * mean(x)) ) / (sigma.D^2 * (1-rho^2))





#Quadratic term in the log-likelihood function

y = rnorm(n)
d = x-y
s = x+y
s = s - mean(s)

sigma.S = 1.1
mu.D = 0.2

mu = mu.D + rho * (sigma.D / sigma.S) * s z = d - mu

matrix(z,nrow=1) %*% solve(Sigma.D) %*% matrix(z,ncol=1) 

(sum((d-(rho*sigma.D/sigma.S)*s)^2) + n*(mu.D)^2 -2*n*mean(d)*mu.D 
	- n*rho^2 * (mean(d)-mu.D)^2 ) / (sigma.D^2 *(1-rho^2))
