£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ subset dataset with mental only

mentalonly <- subset (analytic, MENTHGRP == 1) 
table(mentalonly$MENTHGRP)
nrow(mentalonly)

MentalhealthFreq <- table(mentalonly$MENTHDAY)
MentalhealthFreq
write.csv(MentalhealthFreq, file = "Mentalhealth.csv")

£ install package gtools
£ then call up libary

library(gtools)

£ use defmacro to define the macro

FreqTbl <- defmacro(OutputTable, InputVar, CSVTable,
expr = {	
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
})

FreqTbl (FruitFrreq, mentalonly $FRUITGRP, "Fruit")
FreqTbl (SexFreq, mentalonly $X_SEX, "Sex")
FreqTbl (ExerFreq, mentalonly $EXERGRP, "Exer")
FreqTbl (MaritalFreq, mentalonly $MARGRP, "Mar")
FreqTbl (EdFreq, mentalonly $EDGOUP, "Ed")
FreqTbl (IncFreq, mentalonly $INCOME3, "Inc")