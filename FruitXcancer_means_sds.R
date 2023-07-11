£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

mentalday <- subset(analytic, MENTHDAY > 0) 
mean(mentalday$MENTHDAY)
sd(mentalday$MENTHDAY)

£load package plyr

library(plyr)

£example

ddply(mentalday, ~FRUITGRP, summarise, mean=mean(MENTHDAY), sd=sd(MENTHDAY))

£ Using Macros

library(gtools)

SumTbl <- defmacro(OutputTable, GroupVar, CSVTable,
expr={
OutputTable <-
	ddply(mentalday, ~GroupVar, summarise, mean=mean(MENTHDAY), sd=sd(MENTHDAY));
write.csv(OutputTable, file=paste0(CSVTable, ".csv"))
})

SumTbl (FruitGrpSum, mentalday$FRUITGRP, "Fruit")
SumTbl (SexSum, mentalday$X_SEX, "Sex")
SumTbl (ExerciseSum, mentalday$EXERGRP, "Exercise")
SumTbl (MaritalSum, mentalday$MARGRP, "Marital")
SumTbl (EdcationSum, mentalday$EDGOUP, "Ed")
SumTbl (IncSum, mentalday$INCOME3, "Income")


