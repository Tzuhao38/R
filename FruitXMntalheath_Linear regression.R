£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ Make dataset with MENTHDAY only
analytic2 <- subset(analytic, MENTHDAY > 0)

summary(Model2)

# Start an new modle with only eating daliy

Model3 = lm(MENTHDAY ~ EATDAILY, data=analytic2) 
summary(Model3) 

# add cancer

Model4 = lm(MENTHDAY ~ EATDAILY + CNCRINT, data=analytic2) 
summary(Model4) 

# add Male

Model5 = lm(MENTHDAY ~ EATDAILY + CNCRINT + MALE, data=analytic2) 
summary(Model5) 

# take out male add exercise

Model6 = lm(MENTHDAY ~ EATDAILY + CNCRINT + EXERGRP, data=analytic2) 
summary(Model6) 

# add marital

Model7 = lm(MENTHDAY ~ EATDAILY + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR, data=analytic2) 
summary(Model7) 

# add education

Model8 = lm(MENTHDAY ~ EATDAILY + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR + LOWED + SOMECOLL, data=analytic2) 
summary(Model8) 

# take out come somecoll
# try income

Model9 = lm(MENTHDAY ~ EATDAILY + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR  + LOWED + INC1 + INC2 + INC3 + INC4 + INC5 + INC6 + INC7 + INC8 + INC9 + INC10 + INC11, data=analytic2) 
summary(Model9) 

#remove insignificat income variables (4,5,6)

Model10 = lm(MENTHDAY ~ EATDAILY + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR + LOWED + INC1 + INC2 + INC3 +  INC7 + INC8 + INC9 + INC10 + INC11, data=analytic2) 
summary(Model10) 


#add back male

Model11 = lm(MENTHDAY ~ EATDAILY + MALE + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR + LOWED + INC1 + INC2 + INC3 +  INC7 + INC8 + INC9 + INC10 + INC11, data=analytic2) 
summary(Model11) 

# keep male add back somecoll

Model12 = lm(MENTHDAY ~ EATDAILY + MALE + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR + LOWED + SOMECOLL + INC1 + INC2 + INC3 +  INC7 + INC8 + INC9 + INC10 + INC11, data=analytic2) 
summary(Model12) 

#take out somecoll
Model13 = lm(MENTHDAY ~ EATDAILY + EATWEEKLY + MALE + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR + LOWED + INC1 + INC2 + INC3 +  INC7 + INC8 + INC9 + INC10 + INC11, data=analytic2) 
summary(Model13) 

###FINAL MODEL

FinalLinearRegressionModel = lm(MENTHDAY ~ EATDAILY + EATWEEKLY + MALE + CNCRINT + EXERGRP + NEVERMAR + FORMERMAR + LOWED + INC1 + INC2 + INC3 +  INC7 + INC8 + INC9 + INC10 + INC11, data=analytic2)

summary(FinalLinearRegressionModel)

#coefficient plot

library(arm)

#default plot

coefplot(FinalLinearRegressionModel)

#Final model diagnostics

layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(FinalLinearRegressionModel, 
	main = "Final Linear Regression Model")

#Model fit diagnostics

library(gvlma)
gvmodel <- gvlma(FinalLinearRegressionModel) 
summary(gvmodel)

#visulsation

FinalLinearRegressionModel_fitted <- tibble(analytic2$FRUITGRP, 
                             fitted(FinalLinearRegressionModel))
colnames(FinalLinearRegressionModel_fitted) <- c("FruitFreq", "Group")

ggplot(col_origins, aes(x=FruitFreq, y = Days))  + 
  geom_point(color="red")  +  
  geom_line(data = FinalLinearRegressionModel_fitted, aes(x=FruitFreq, y=Days))
