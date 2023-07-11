library(foreign)

BRFSS_a <- read.xport("~/Documents/Analytic/Data/LLCP2021.XPT ")

colnames(BRFSS_a)

BRFSSVarList <- c( "X_AGEG5YR",
				"FRUIT2",
				"CNCRTYP1",
	 			"TOLDHI3",
				"X_SEX",
				"EXERANY2",
				"MENTHLTH",
				"MARITAL",
				"EDUCA",
				"INCOME3")
					
BRFSS_b <- BRFSS_a[BRFSSVarList]

colnames(BRFSS_b)

nrow(BRFSS_b)

£ clean up the data ( remove unknow )					
					
nrow(BRFSS_b)

£ over 50 years old

BRFSS_c <- subset(BRFSS_b, X_AGEG5YR > 6)

BRFSS_c$X_AGEG5YR

£ exclude unknown

BRFSS_d <- subset(BRFSS_c, X_AGEG5YR < 14) 

BRFSS_d$X_AGEG5YR

BRFSS_e <- subset(BRFSS_d, FRUIT2 < 777)

BRFSS_e$FRUIT2

BRFSS_f <- subset(BRFSS_e, CNCRTYP1 < 77)

BRFSS_f$CNCRTYP1

BRFSS_g <- subset(BRFSS_f, TOLDHI3 < 7)

BRFSS_g$TOLDHI3

£remove mental unknow

BRFSS_h <- subset(BRFSS_g, MENTHLTH <99 & MENTHLTH !=77)

BRFSS_h$MENTHLTH

£ Add Fruit variable indicator of pepple over 50

BRFSS_i <- BRFSS_h


£ set all data as 0 first (never eat fruit)
BRFSS_i$FRUITGRP <- 0

£ Update according to the daya dictionary
BRFSS_i$FRUITGRP[BRFSS_i$FRUIT2 <200] <-3
BRFSS_i$FRUITGRP[BRFSS_i$FRUIT2 >200 & BRFSS_i$FRUIT2 <300] <-2
BRFSS_i$FRUITGRP[BRFSS_i$FRUIT2 >299 & BRFSS_i$FRUIT2 <555] <-1
BRFSS_i$FRUITGRP[BRFSS_i$FRUIT2 == 555] <-0

table(BRFSS_i$FRUITGRP, BRFSS_i$FRUIT2)

£ Add flag
BRFSS_i$EATWEEKLY <- 0
BRFSS_i$EATWEEKLY[BRFSS_i$FRUITGRP == 2] <- 1

table(BRFSS_i$FRUITGRP, BRFSS_i$EATWEEKLY)

BRFSS_i$EATDAILY <- 0
BRFSS_i$EATDAILY[BRFSS_i$FRUITGRP == 3] <- 1

table(BRFSS_i$FRUITGRP, BRFSS_i$EATDAILY)

£ Add outcome variables (cancer/high cholesterol)

BRFSS_j <- BRFSS_i
BRFSS_j$CNCRINT <- 0
BRFSS_j$CNCRINT[BRFSS_j$CNCRTYP1 == 14 | BRFSS_j$CNCRTYP1 == 10] <-1
table(BRFSS_j$CNCRTYP1, BRFSS_j$CNCRINT)

£ Make a copy of the dataset

BRFSS_k <-BRFSS_j

BRFSS_k$CHOHGRP <- 0
BRFSS_k$CHOHGRP[BRFSS_k$TOLDHI3 == 1] <- 1

table(BRFSS_k$TOLDHI3, BRFSS_k$CHOHGRP) 

BRFSS_l <- BRFSS_k

BRFSS_l$MENTHGRP <-0
BRFSS_l$MENTHGRP[BRFSS_l$MENTHLTH < 31] <- 1
BRFSS_l$MENTHGRP[BRFSS_l$MENTHLTH == 88] <- 0

table(BRFSS_l$MENTHLTH, BRFSS_l$MENTHGRP)

BRFSS_l$MENTHDAY <- BRFSS_l$MENTHLTH
BRFSS_l$MENTHDAY[BRFSS_l$MENTHLTH == 88] <- 0

table(BRFSS_l$MENTHLTH, BRFSS_l$MENTHDAY)
