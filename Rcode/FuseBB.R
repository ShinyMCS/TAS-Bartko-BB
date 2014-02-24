### This Data set is the running times of 20 mechanical fuses measured 
### by operators stopping two independent clocks

Fuse <- 1:20
###Measuerement by first Instrument
Y1 <- c(4.85,4.93,4.75,4.77,4.67,4.87,4.67,4.94,4.85,4.75,4.83,4.92,4.74,4.99,4.88,4.95,4.95,4.93,4.92,4.89)

###Measuerement by second Instrument
Y2 <- c(5.09,5.04,4.95,5.02,4.90,5.05,4.90,5.15,5.08,4.98,5.04,5.12,4.95,5.23,5.07,5.23,5.16,5.11,5.11,5.08)

#############################################

Ds = Y2-Y1
Ss = Y2+Y1

mean(Ds)
sd(Ds)

#############################################

FitBB <- lm(Ds ~ Ss)

summary(FitBB)
#############################################

t.test(Y1,Y2,paired=T)
