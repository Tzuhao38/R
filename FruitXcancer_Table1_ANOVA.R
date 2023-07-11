£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£example ANOVA

analytic2 <- subset (analytic, MENTHDAY > 0)

FruitANOVA <- lm(formula = MENTHDAY ~ FRUITGRP, data = analytic2)
summary(FruitANOVA)

£make macro

library(gtools)

ANOVATest <- defmacro(VarName, TblName, expr={
TblName<- lm(formula = MENTHDAY ~ VarName, data = analytic2);
summary(TblName)})

ANOVATest(FRUITGRP, FruitANOVA)
ANOVATest(X_SEX, SexANOVA)
ANOVATest(EXERGRP, ExerANOVA)
ANOVATest(MARGRP, MaritalANOVA)
ANOVATest(EDGOUP, EdANOVA)
ANOVATest(INCOME3, IncomeANOVA)
