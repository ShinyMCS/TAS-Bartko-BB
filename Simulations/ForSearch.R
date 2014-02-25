
M=10000
Sum=numeric(M)
S1s=numeric(M)
S2s=numeric(M)
VAR=numeric(M)
PAIR = numeric(M)
MCR = numeric(M)
for (i in 1: M)
{
S1 = rnorm(1,5) 
S2 = rnorm(1,5)

S1s[i] = S1
S2s[i] = S2

Y1 = rnorm(20,100,S1)
Y2 = rnorm(20,100,S2)

Ds = Y1-Y2
Ss = Y2+Y2
Smc = Ss - mean(Ss)
MCfit = lm(Ds ~Smc)
VAR[i] = as.numeric(var.test(Y1,Y2)$p.value<0.05)
PAIR[i] = as.numeric(t.test(Y1,Y2,paired=T)$p.value<0.05)
MCR[i] = as.numeric(summary(MCfit)$coefficients[1,4]<0.05)
Sum[i] = PAIR[i] + MCR[i] 

}
