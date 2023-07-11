£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ subset dataset with only cholesterol

chohonly <- subset (analytic, CHOHGRP == 1) 
table(chohonly$CHOHGRP)
nrow(chohonly)

CholesterolFreq <- table(chohonly$CHOHGRP)
CholesterolFreq
write.csv(CholesterolFreq, file = "Cholesterol.csv")

£ install package gtools
£ then call up libary

library(gtools)

£ use defmacro to define the macro

FreqTbl <- defmacro(OutputTable, InputVar, CSVTable,
expr = {	
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
})

FreqTbl (FruitFrreq, chohonly $FRUITGRP, "Fruit")
FreqTbl (SexFreq, chohonly $X_SEX, "Sex")
FreqTbl (ExerFreq, chohonly $EXERGRP, "Exer")
FreqTbl (MaritalFreq, chohonly $MARGRP, "Mar")
FreqTbl (EdFreq, chohonly $EDGOUP, "Ed")
FreqTbl (IncFreq, chohonly $INCOME3, "Inc")