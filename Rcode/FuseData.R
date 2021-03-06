### This Data set is the running times of 20 mechanical fuses measured 
### by operators stopping two independent clocks

Fuse <- 1:20
###Measuerement by first Instrument
Y1 <- c(4.85,4.93,4.75,4.77,4.67,4.87,4.67,4.94,4.85,4.75,4.83,4.92,4.74,4.99,4.88,4.95,4.95,4.93,4.92,4.89)

###Measuerement by second Instrument
Y2 <- c(5.09,5.04,4.95,5.02,4.90,5.05,4.90,5.15,5.08,4.98,5.04,5.12,4.95,5.23,5.07,5.23,5.16,5.11,5.11,5.08)

### summary statistics
mean(Y1);mean(Y2)
sd(Y1);sd(Y2)

#########################################################
# Kevin Hayes
# These data are used in the follow-on paper by Blackwood and Bradley 
# "An omnibus test for comparing two measurement devices" in Journal Quality Technology (1991).

# Grubbs (1983) presented data on the running times # of 20 fuses. 
# Two operators, acting independently, # measured these times for the fuses:


fuses = data.frame( 
 op1 = c(4.85, 4.93, 4.75, 4.77, 4.67, 4.87, 4.67, 4.94, 4.85, 4.75, 
         4.83, 4.92, 4.74, 4.99, 4.88, 4.95, 4.95, 4.93, 4.92, 4.89), 
 op2 = c(5.09, 5.04, 4.95, 5.02, 4.90, 5.05, 4.90, 5.15, 5.08, 4.98, 
         5.04, 5.12, 4.95, 5.23, 5.07, 5.23, 5.16, 5.11, 5.11, 5.08) 
         )



