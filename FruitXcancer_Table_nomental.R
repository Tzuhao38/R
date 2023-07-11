£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ subset dataset with mental only

nomentalonly <- subset (analytic, MENTHGRP == 0) 
table(nomentalonly$MENTHGRP)
nrow(nomentalonly)

noMentalhealthFreq <- table(nomentalonly$MENTHDAY)
noMentalhealthFreq
write.csv(noMentalhealthFreq, file = "noMentalhealth.csv")

£ install package gtools
£ then call up libary

library(gtools)

£ use defmacro to define the macro

FreqTbl <- defmacro(OutputTable, InputVar, CSVTable,
expr = {	
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
})

FreqTbl (FruitFrreq, nomentalonly $FRUITGRP, "Fruit")
FreqTbl (SexFreq, nomentalonly $X_SEX, "Sex")
FreqTbl (ExerFreq, nomentalonly $EXERGRP, "Exer")
FreqTbl (MaritalFreq, nomentalonly $MARGRP, "Mar")
FreqTbl (EdFreq, nomentalonly $EDGOUP, "Ed")
FreqTbl (IncFreq, nomentalonly $INCOME3, "Inc")