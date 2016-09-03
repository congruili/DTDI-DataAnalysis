install.packages("rgl")
library(rgl)
rm(list = ls())

rocks[is.na(rocks)] <- 0
n <- ncol(rocks)
distances <- data.frame(matrix(ncol = n, nrow = n))
diff <- data.frame(matrix(ncol = n, nrow = n))
minerals <- colnames(rocks)
row.names(distances) <- minerals
colnames(distances) <- minerals
sums <- vector(mode="integer", length=n)

for (i in 1:n) {
  sums[i] = sum(as.numeric(rocks[, i]))
}

for (i in 1:n) {
  for (j in i:n) {
    diff[i, j] = sum(ifelse(rocks[, i] == rocks[, j], 0, 1))
  }
}

for (i in 1:n) {
  for (j in i:n) {
    distances[i, j] = 1 - ((sums[i] + sums[j] - diff[i, j]) / (2 * min(sums[i], sums[j])))
  }
}

for (i in 2:n) {
  for (j in 1:(i - 1)) {
    distances[i, j] = distances[j, i]
  }
}

color.code <-color[,2]

fit <- cmdscale(distances, k=2)
x <- fit[,1]
y <- fit[,2]
plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2", 
     main="2D rocks MDS",	type="p", col="black", pch=21,  bg=color.code, cex=1.5)
text(x-0.003, y, labels = row.names(distances), pos=4, cex=.7)

fit <- cmdscale(distances, k=3)
x <- fit[, 1]
y <- fit[, 2]
z <- fit[, 3]
plot3d(x, y, z, xlab="Coordinate 1", ylab="Coordinate 2", zlab="Coordinate 3",
     main="3D rocks MDS",	type="s", col=color.code, size=1, lwd=2)
text3d(x, y, z+0.03, row.names(distances), fontweight="bold", cex=.7)

s = spin3d(axis = c(0,0,1), rpm=5)
play3d(s, duration=100)