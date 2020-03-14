nazwa <- c('iPhone 11 Pro 512GB', 'iPhone 11 Pro 256GB','iPhone 11 Pro 64GB',
           'iPhone 11 256GB', 'iPhone 11 64GB', 'iPhone X 64GB',
           'iPhone 8 256GB', 'iPhone 8 64GB', 'iPhone 7 128GB',
           'iPhone 7 32GB')
wyswietlacz <- c('5.8"', '5.8"', '5.8"', '6.1"', '6.1"', '5.8"', '4.7"', '4.7"', '4.7"', '4.7"')
pamięć_RAM <- c('4 GB', '4 GB', '4 GB', '4 GB', '4 GB', '3 GB', '2 GB', '2 GB', '2 GB', '2 GB')
pamięć_wbudowana <- c('512 GB', '256 GB', '64 GB', '256 GB', '64 GB', '64 GB', '256 GB', '64 GB', '128 GB', '32 GB')
aparat_foto <- c('12Mpix', '12Mpix', '12Mpix', '12Mpix', '12Mpix', '12Mpix', '12Mpix', '12Mpix', '12Mpix', '12Mpix') 
cena <- c(6949, 5999, 5099, 4349, 3649, 3899, 2999, 2349, 2369, 1549)
smartfony <- data.frame(nazwa, wyswietlacz, pamięć_RAM, pamięć_wbudowana, aparat_foto, cena)

smartfony$ocena <- c('5', '5', '5', '4.5', '4.5', '5', '4', '5', '4', '4')

setwd("D:/Users/User1/Documents/R Studio")
write.csv(smartfony, 'smartfony_apple.csv')

install.packages("C50")
library("C50")

dane <- read.csv('smartfony_apple.csv')

dane$ocena <- factor(dane$ocena)
head(dane)
treeModel <- C5.0(x=dane[,-6], y=dane$ocena)
treeModel
summary(treeModel)
plot(treeModel)
