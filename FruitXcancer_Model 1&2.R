£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ Make dataset with MENTHDAY only
analytic2 <- subset(analytic, MENTHDAY > 0)

£make Model1

Model1 = lm(MENTHDAY ~ EATDAILY + EATWEEKLY , data = analytic2)

summary(Model1)

library(devtools)
library (broom)

Tidy_Model1 <- tidy(Model1)
write.csv(Tidy_Model1, file = "LinearRegressionModel1.csv")

£make Model2

Model2 = lm(MENTHDAY ~ EATWEEKLY + EATDAILY + MALE, data = analytic2)

Tidy_Model2 <- tidy(Model2)
write.csv(Tidy_Model2, file = "LinearRegressionModel2.csv")
