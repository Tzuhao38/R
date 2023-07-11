£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

analytic

#Make Model 1

LogModel1 <- glm(CHOHGRP ~ EATDAILY + EATWEEKLY, data = analytic, family = "binomial")
summary(LogModel1)

library (devtools)
library (broom)

Tidy_LogModel1 <- tidy(LogModel1)
Tidy_LogModel1

Tidy_LogModel1$OR <- exp(Tidy_LogModel1$estimate)
Tidy_LogModel1$LL <- exp(Tidy_LogModel1$estimate - (1.96 * Tidy_LogModel1$std.error))
Tidy_LogModel1$UL <- exp(Tidy_LogModel1$estimate + (1.96 * Tidy_LogModel1$std.error))
Tidy_LogModel1

write.csv(Tidy_LogModel1, file = "LogisticRegressionModel1.csv")

coefplot(LogModel1)

LogModel2 <- glm(CHOHGRP ~ EATDAILY + EATWEEKLY + MALE + CNCRINT + EXERGRP, data = analytic, family = "binomial")
summary(LogModel2)

library (devtools)
library (broom)

Tidy_LogModel2 <- tidy(LogModel2)
Tidy_LogModel2

Tidy_LogModel2$OR <- exp(Tidy_LogModel2$estimate)
Tidy_LogModel2$LL <- exp(Tidy_LogModel2$estimate - (1.96 * Tidy_LogModel2$std.error))
Tidy_LogModel2$UL <- exp(Tidy_LogModel2$estimate + (1.96 * Tidy_LogModel2$std.error))
Tidy_LogModel2

write.csv(Tidy_LogModel2, file = "LogisticRegressionModel2.csv")
coefplot(LogModel2)
