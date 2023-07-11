£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ Make dataset with MENTHDAY only
analytic2 <- subset(analytic, MENTHDAY > 0)

£Normal probability plot
£ make linear model using grouping variable

FruitMentaldayRegression = lm(MENTHDAY ~ FRUITGRP, data=analytic2 )

FruitMentaldayRegression

summary(FruitMentaldayRegression)

£Make diagnostic plots 4plots and 2 row 2 columns/ main = "title"

layout(matrix(c(1,2,3,4),2,2)) 
plot(FruitMentaldayRegression,
	main = "Fruit by MentalDays")