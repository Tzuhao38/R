£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")


£ lood MASS library

library(MASS)

£make table

FruitTbl = table(analytic$CHOHGRP, analytic$FRUITGRP)

£test
chisq.test(FruitTbl)

£make macro

library(gtools)

ChiTest <- defmacro(VarName, TblName, expr={TalName = table(analytic$CHOHGRP, analytic$VarName);
chisq.test(TblName)})

ChiTest(FRUITGRP, FruitTbl)
ChiTest(X_SEX, SexTbl)
ChiTest(EXERGRP, ExerTbl)
ChiTest(MARGRP, MaritalTbl)
ChiTest(EDGOUP, EdTbl)
ChiTest(INCOME3, IncomeTbl)