£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ subset dataset with only intestine cancer

cncrintonly <- subset (analytic, CNCRINT == 1)
table(cncrintonly$CNCINT)
nrow(cncrintonly)

IntestinecncrFreq <- table(cncrintonly$CNCINT)
IntestinecncrFreq
write.csv(IntestinecncrFreq, file = "Intestine.csv")

£ install package gtools
£ then call up libary

library(gtools)

£ use defmacro to define the macro

FreqTbl <- defmacro(OutputTable, InputVar, CSVTable,
expr = {	
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
})

FreqTbl (FruitFrreq, cncrintonly$FRUITGRP, "Fruit")
FreqTbl (SexFreq, cncrintonly$X_SeX, "Sex")
FreqTbl (ExerFreq, cncrintonly$EXERGRP, "Exer")
FreqTbl (MaritalFreq, cncrintonly$MARGRP, "Mar")
FreqTbl (EdFreq, cncrintonly$EDGOUP, "Ed")
FreqTbl (IncFreq, cncrintonly$INCOME3, "Inc")