£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ Start by making freqencies per category

CholestrolFreq <- table(analytic$CHOHGRP)
CholestrolFreq
write.csv(CholestrolFreq, file = "CholestrolFreq.csv")

FuritFreq <- table(analytic$FRUITGRP)
FuritFreq
write.csv(FuritFreq, file = "FuritFreq.csv")

MentalFreq <- subset (analytic, MENTHGRP <9)
MentalFreq1 <- table (MentalFreq$MENTHGRP)
write.csv(MentalFreq1, file = "MentalFreq.csv")
£ USING MACROS

£ install package gtools
£ then call up libary

library(gtools)

£ use defmacro to define the macro

FreqTbl <- defmacro(OutputTable, InputVar, CSVTable,
expr = {	
OutputTable <- table(InputVar);
write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
})

FreqTbl (FruitFrreq, analytic$FRUITGRP, "Fruit")
FreqTbl (SexFreq, analytic$X_SeX, "Sex")
FreqTbl (ExerFreq, analytic$EXERGRP, "Exer")
FreqTbl (MaritalFreq, analytic$MARGRP, "Mar")
FreqTbl (EdFreq, analytic$EDGOUP, "Ed")
FreqTbl (IncFreq, analytic$INCOME3, "Inc")