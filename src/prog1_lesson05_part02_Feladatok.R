######################
# Feladatok          #
# Programozás I.     #
# 5. óra             #
# 2017-03-14         #
######################

#----II. feladat----------------------------------------------------------------
# 1. 200x100-as mátrix definiálása st. norm. eloszlásból
set.seed(567356)
m <- matrix(rnorm(20000), 200, 100)

# 2. oszlopok átlaga és standard eltérése for ciklussal
m_colmean <- vector()
m_colsd <- vector()
for (j in 1:ncol(m)) {
  m_colmean[j] <- mean(m[, j])
  m_colsd[j] <- sd(m[, j])
}
m_colmean
m_colsd

# 3. oszlopok átlaga és standard eltérése apply-jal
apply(m, 2, mean)
apply(m, 2, sd)

# 4. sorok átlaga és standard eltérése for ciklussal
m_rowmean <- vector()
m_rowsd <- vector()
for (i in 1:nrow(m)) {
  m_rowmean[i] <- mean(m[i, ])
  m_rowsd[i] <- sd(m[i, ])
}
m_rowmean
m_rowsd

# 5. sorok átlaga és standard eltérése apply-jal
apply(m, 1, mean)
apply(m, 1, sd)

# 6. mátrix értékeinek átlaga és standard eltérése
mean(m)
sd(m)

#----III. feladat---------------------------------------------------------------
# 1. data frame definiálása
df <- data.frame(cd = c("c", "d", "c"), ab = c("a", "b", "b"),
                 stringsAsFactors = FALSE)

# 2. értékek felülírása 0-val és 1-gyel for ciklussal
# egyik példamegoldás
for (i in 1:nrow(df)) {
  if (df$cd[i] == "c") df$cd[i] <- 1
  if (df$cd[i] == "d") df$cd[i] <- 0
  if (df$ab[i] == "a") df$ab[i] <- 1 
  if (df$ab[i] == "b") df$ab[i] <- 0
}
df

# másik példamegoldás
df <- data.frame(cd = c("c", "d", "c"), ab = c("a", "b", "b"),
                 stringsAsFactors = FALSE)

for (i in 1:nrow(df)) {
  for (j in 1:ncol(df)) {
    ifelse(df[i, j] == "c" | df[i, j] == "a", df[i, j] <- 1, df[i, j] <- 0)
  }
}
df

# 3. értékek felülírása 0-val és 1-gyel apply függvénnyel
df <- data.frame(cd = c("c", "d", "c"), ab = c("a", "b", "b"),
                 stringsAsFactors = FALSE)

as.data.frame(apply(df, 2, function(x) ifelse(x == "c" | x == "a", 1, 0)))


#----III. feladat---------------------------------------------------------------
# 1. data frame definiálása
set.seed(14254)
l <- list(rpois(50, 5), rpois(50, 9), rpois(50, 100))

# 2. utolsó elem kiszedése lapply-jal
# az output szintén lista
lapply(l, function(x) x[length(x)])

# 3. első 5 elem kiszedése sapply-jal
# az output egy mátrix
sapply(l, function(x) x[1:5])

