install.packages("neuralnet")
library("neuralnet")

wynik <- as.data.frame(runif(50, min = 1, max = 10))
dane_wejscia <- 1/sqrt(wynik)

trainingData <- cbind(dane_wejscia, wynik)
colnames(trainingData) <- c("Wejście", "Wynik")

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

maxmindf<- as.data.frame(lapply(trainingData, normalize))

net.price <- neuralnet(Wynik~Wejście, maxmindf, hidden = c(4, 5, 3), threshold = 0.01)

plot(net.price)
