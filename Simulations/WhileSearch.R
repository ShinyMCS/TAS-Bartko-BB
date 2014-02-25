
S1 = rnorm(1,5) 
S2 = rnorm(1,5)

Y1 = rnorm(15,100,S1)
Y2 = rnorm(15,100,S2)

Ds = Y1-Y2
Ss = Y1+Y2
Smc = Ss - mean(Ss)

MCfit = lm(Ds ~Smc)
VAR = as.numeric(var.test(Y1,Y2)$p.value<0.05)
PAIR = as.numeric(t.test(Y1,Y2,paired=T)$p.value<0.05)
MCR = as.numeric(summary(MCfit)$coefficients[1,4]<0.05)

SPECVAL = 0
 
while( SPECVAL != 1 )
{
S1 = rnorm(1,5) 
S2 = rnorm(1,5)

Y1 = rnorm(20,100,S1)
Y2 = rnorm(20,100,S2)

Ds = Y1-Y2
Ss = Y1+Y2
Smc = Ss - mean(Ss)

MCfit = lm(Ds ~Smc)
VAR = as.numeric(var.test(Y1,Y2)$p.value<0.05)
PAIR = as.numeric(t.test(Y1,Y2,paired=T)$p.value<0.0525)
MCR = as.numeric(summary(MCfit)$coefficients[1,4]<0.0475)
Sum= PAIR + MCR

SPECVAL = (4*VAR) + (2*PAIR) + MCR

}

var.test(Y1,Y2)
t.test(Y1,Y2,paired=T)
summary(MCfit)$coefficients
