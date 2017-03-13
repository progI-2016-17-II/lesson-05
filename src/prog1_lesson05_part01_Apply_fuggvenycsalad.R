########################
# Apply függvénycsalád #
# Programozás I.       #
# 5. óra               #
# 2017-03-14           #
########################

#----apply függvény-------------------------------------------------------------
# 5x6-os mátrix st. normális elo-ból vett értékekkel
X <- matrix(rnorm(30), nrow = 5, ncol = 6)
X

# értékek összegének lekérése minden oszlopra
# eddig for ciklussal így csináltuk volna
# vektort szeretnénk kapni, ezért definiálunk egyet
X_colsum <- NA
for (j in 1:ncol(X)) {
  X_colsum[j] <- sum(X[, j])
}
X_colsum

# értékek összegének lekérése minden oszlopra
apply(X, 2, sum)

# értékek összegének lekérése minden sorra
apply(X, 1, sum)

# értékek átlagának lekérése minden sorra
apply(X, 1, mean)

# data frame definiálása
df <- data.frame(sex = c("F", "F", "M", "M", "F", "M"), 
                 age = c(12, 34, 52, 34, 45, 56),
                 height = c(150, 165, 187, 190, 172, 178),
                 class = c("A", "B", "A", "B", "B", "B"))
df

# age és height oszlopok átlaga
# vektorrá alakítja
apply(df[, 2:3], 2, mean)

# sex és class oszlopokhoz karakter hozzáfűzése
# mátrixszá alakítja
apply(df[, c(1, 4)], 2, function(x) paste0(x, "_paste"))

# as.data.frame függvénnyel data frame-et kapunk vissza
as.data.frame(apply(df[, c(1, 4)], 2, function(x) paste0(x, "_paste")))


#----lapply függvény------------------------------------------------------------
# 3 mátrix definiálása, majd összefűzése egy listába
A <- matrix(1:9, 3, 3)
B <- matrix(4:15, 4, 3)
C <- matrix(8:10, 3, 2)
MyList <- list(A, B, C)

# minden második oszlop kiszedése a mátrixok listájából
# ezt for-ral eddig így csináltuk volna
MyList_secondcols <- list()
for (i in 1:length(MyList)) {
  MyList_secondcols[[i]] <- MyList[[i]][, 2] 
}
MyList_secondcols

# minden második oszlop kiszedése a mátrixok listájából
lapply(MyList, "[", , 2)
# vagy
lapply(MyList, function(x) x[, 2])

# minden első sor kiszedése a mátrixok listájából
lapply(MyList, "[", 1, )
# vagy
lapply(MyList, function(x) x[1, ])

# minden első sor 3. elem kiszedése a mátrixok listájából
lapply(MyList, "[", 1, 2)
# vagy
lapply(MyList, function(x) x[1, 2])

# mátrixok minden elemének összege
lapply(MyList, sum)

# mátrixok első sorainak összege
lapply(MyList, function(x) sum(x[1, ]))


#----sapply függvény------------------------------------------------------------
# minden második oszlop kiszedése a mátrixok listájából
# nincs egyszerűbb adatstruktúra a listánál, ezért listával tér vissza
sapply(MyList, function(x) x[, 2])

# minden első sor 3. elem kiszedése a mátrixok listájából
# leegyszerűsíti az adatstruktúrát vektorra
sapply(MyList, "[", 1, 2)
# vagy
sapply(MyList, function(x) x[1, 2])

# mátrixok minden elemének összege
sapply(MyList, sum)

# mátrixok első sorainak összege
sapply(MyList, function(x) sum(x[1, ]))


#----mapply függvény------------------------------------------------------------
# 4x4-es mátrix, amit a rep függvény többszörös használátával hozunk létre
# a rep függvénnyel létrejövő vektorokat a c függvénnyel kapcsoljuk össze
m <- matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)), 4, 4)
m

# mapply segítségével
m <- mapply(rep, 1:4, 4)
m


#----aggregate függvény---------------------------------------------------------
# apply függvénynél használt data frame
df

# életkor nemenként - by argumentummal
aggregate(df$age, by = list(sex = df$sex), mean)

# életkor, magasság nemenként - by argumentummal
aggregate(df[, 2:3], by = list(sex = df$sex), mean)

# életkor nem és osztály szerinti bontásban - by argumentummal
aggregate(df$age, by = list(sex = df$sex, class = df$class), mean)

# életkor nemenként - formula argumentummal
aggregate(age ~ sex, data = df, mean)

# életkor, magasság nemenként - formula argumentummal
aggregate(cbind(age, height) ~ sex, data = df, mean)

# életkor nem és osztály szerinti bontásban - formula argumentummal
aggregate(age ~ sex + class, data = df, mean)

