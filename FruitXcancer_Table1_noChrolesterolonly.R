£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ subset dataset with only cholesterol

nochohonly <- subset (analytic, CHOHGRP != 1) 
table(nochohonly$CHOHGRP)
nrow(nochohonly)

CholesterolFreq <- table(nochohonly$CHOHGRP)
CholesterolFreq
write.csv(CholesterolFreq, file = "noCholesterol.csv")

£ install package gtools
£ then call up libary

library(gtools)

£ use defmacro to define the macro

FreqTbl <- defmacro(OutputTable, InputVar, CSVTable,
expr = {	
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
})

FreqTbl (FruitFrreq, nochohonly $FRUITGRP, "Fruit")
FreqTbl (SexFreq, nochohonly $X_SEX, "Sex")
FreqTbl (ExerFreq, nochohonly $EXERGRP, "Exer")
FreqTbl (MaritalFreq, nochohonly $MARGRP, "Mar")
FreqTbl (EdFreq, nochohonly $EDGOUP, "Ed")
FreqTbl (IncFreq, nochohonly $INCOME3, "Inc")