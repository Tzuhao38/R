£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")



£ttests for Table1

t.test(analytic$MENTHGRP~analytic$CHOHGRP)
t.test(analytic$MENTHGRP~analytic$X_SEX)