#################LAB 1 WARIANT 12###################

#Zad A
a <- 12/exp(12)
b <- a*2
max(a,b)

#Zad B
?sqrt()

#Zad C
a <- c(80:90)
sum(a^2)

#Zad D
??max
apropos("max", mode = "function")

#Zad E
setwd("D:/Users/User1/Documents/R Studio")
a <- "smartfon Motorola"
write(a, file='pkt_e.csv')
rm(a)
a
a <- read.csv(file = 'pkt_e.csv', sep = ',')
a

#Zad F
install.packages("gridExtra")
library("gridExtra")
d <- head(Titanic, 10)
g <- tableGrob(d)
grid.arrange(g)

#Zad G
a <- seq(400,320,-8)
a

#Zad H
a <- c(60:40)
b <- c(40:50)
d <- c(b, a)
d

#Zad I
nazwy <- c('Moto G8 Power','Moto G7 Power','Moto E6 Plus','One Action','E5 Play','One Vision','One Zoom','Moto Z','Moto X4','Moto Z3 Play')
wyswietlacz <- c('6.4"', '6.2"','6.1"','6.34"','5.3"','6.3"','6.4"','5.5"','5.2"','6"')
pamiê_RAM <- c('4 gb','4 gb','4 gb','4 gb','1 gb','4 gb','4 gb','4 gb','3 gb','4 gb')
pamiê_wbudowana <- c('64 gb','64 gb','64 gb','128 gb','16 gb','128 gb','128 gb','32 gb','32 gb','64 gb')
aparat_foto <- c('16 Mpix','12 Mpix','13 Mpix','12 Mpix','8 Mpix','48 Mpix','48 Mpix','16 Mpix','12 Mpix','12 Mpix')
cena <- c(999,698,599,799,299,969,1599,549,649,950)
liczba_opinii <- c(7,492,19,24,22,168,25,66,7,5)
smartfony <- data.frame(nazwy, wyswietlacz,pamiê_RAM,pamiê_wbudowana,aparat_foto,cena,liczba_opinii)
mean(smartfony$cena)

#Zad J
newRow <- data.frame(nazwy = 'Moto C+', wyswietlacz = '5"', pamiê_RAM = '1 gb', pamiê_wbudowana = '16 gb', aparat_foto = '8 Mpix', cena = 299, liczba_opinii = 50)
smartfony <- rbind(smartfony, newRow)
mean(smartfony$cena)

#Zad K
smartfony$ocena <- c('5','5','5','5','5','5','5','5','5','5','5')
aggregate(smartfony$cena, list(smartfony$ocena), mean)

#Zad L
newRow <- data.frame(nazwy = 'Moto Z Play', wyswietlacz = '5.5"', pamiê_RAM = '3 gb', pamiê_wbudowana = '32 gb', aparat_foto = '16 Mpix', cena = 1275, liczba_opinii = 70, ocena = '5')
smartfony <- rbind(smartfony, newRow)
newRow <- data.frame(nazwy = 'Moto Z2 Play', wyswietlacz = '5.5"', pamiê_RAM = '4 gb', pamiê_wbudowana = '64 gb', aparat_foto = '12 Mpix', cena = 1020, liczba_opinii = 9, ocena = '5')
smartfony <- rbind(smartfony, newRow)
newRow <- data.frame(nazwy = 'Moto G6 Play', wyswietlacz = '5.7"', pamiê_RAM = '3 gb', pamiê_wbudowana = '32 gb', aparat_foto = '13 Mpix', cena = 499, liczba_opinii = 581, ocena = '5')
smartfony <- rbind(smartfony, newRow)
newRow <- data.frame(nazwy = 'Moto E6 Plus', wyswietlacz = '6.1"', pamiê_RAM = '4 gb', pamiê_wbudowana = '64 gb', aparat_foto = '13 Mpix', cena = 599, liczba_opinii = 26, ocena = '4.5')
smartfony <- rbind(smartfony, newRow)

install.packages("plotrix")
library(plotrix)
dane <- aggregate(smartfony$liczba_opinii, list(smartfony$ocena), sum)
barp(dane[,2], names.arg = dane[,1], main = 'Liczebnoœæ reprezentantów kazdej z ocen')

#Zad M

#################WYKRES KO£OWY###################
percentage <- table(smartfony$ocena)/length(smartfony$ocena)
pie(percentage)

###############WYKRES WACHLARZOWY################
percentage <- table(smartfony$ocena)/length(smartfony$ocena)
fan.plot(percentage, edges=100, radius=1,labels = names(percentage), main = "Procentowy udzial oceny", align="left")

#Zad N
n_column <- ifelse(smartfony$liczba_opinii>100,'wiecej 100 opinii', ifelse(smartfony$liczba_opinii>=50, '50-100 opinii', ifelse(smartfony$liczba_opinii>0, 'mniej 50 opinii', 'nie ma')))
smartfony['status_opinii'] <- factor(n_column)

#################WYKRES KO£OWY###################
percentage <-table(smartfony$status_opinii)/length(smartfony$status_opinii)
pie(percentage)

#Zad O
for (i in 1:length(smartfony$nazwy)){
  print(paste(smartfony$nazwy[i], 'ma ocenê klientów', smartfony$ocena[i], 'bo ma liczbê opinii', smartfony$liczba_opinii[i]))
}

#Zad P
write.csv(smartfony, 'smartfony.csv')
dane <- read.csv('smartfony.csv')
