£ Read in analytic table

analytic <- read.csv(file="/Users/wangzihao/Documents/Analytic/Data/FRUITXCANCER2.csv", header=TRUE, sep=",")

£ Look at distribution of catergotical outcome cancer/cholesterol

CancerFreq <- table(analytic$CNCRINT)
write.csv(CancerFreq, file = "CancerFreq.csv")

£ Check cancer types distribution/ summary statistics

PropCancerINT <- 293/394980 

CancerINTFruitFreq <- table(analytic$CNCRINT, analytic$FRUITGRP)
CancerINTFruitFreq

CholestrolFruitFreq <- table(analytic$CHOHGRP, analytic$FRUITGRP)
CholestrolFruitFreq 

hist(analytic$MENTHDAY,
	main = "Histigram of MENTHDAY",
	xlab = "Class MENTHDAY",
	ylab = "Frequency",
	xlim = c(0,30),
	ylim = c(0,1000),
	border = "red",
	col = "yellow",
	las = 1,
	breaks =24
	)
	
boxplot(analytic$MENTHDAY, main = "Box Plot of MENTHDAY",
	xlab = "Totle File", ylab = "MENTHDAY")
	
boxplot(MENTHDAY~FRUITGRP, data=analytic, main = "Box Plot of MENTHDAY by FRUIT", xlab = "FRUITGRP", ylab = "MENTHDAY")