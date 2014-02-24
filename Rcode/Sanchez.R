# Sanchez
###Measuerement by first Instrument
Y1=c(136	,267	,218	,169	,229	,227	,231	,278	,157	,186	,179	,215	,199	,242	,147	,225	,146	,162	,247	,267	,
188	,265	,166	,197	)

###Measuerement by second Instrument


Y2=c(160	,274	,214	,169	,240	,274	,222	,279	,
180	,191	,186	,235	,211	,241	,164	,240	,
144	,160	,243	,271	,200	,237	,170	,187	)
#############################################

Ds = Y2-Y1
Ss = Y2+Y1
Smc = Ss-mean(Ss) # Mean Centering

mean(Ds)
sd(Ds)

#############################################

FitBB <- lm(Ds ~ Ss)

summary(FitBB)

FitKH <- lm(Ds ~ Smc)

summary(FitKH)
#############################################

t.test(Y1,Y2,paired=T)

cor.test(Ds,Ss)
var.test(Y1,Y2)
