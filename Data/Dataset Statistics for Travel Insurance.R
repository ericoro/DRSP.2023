#### Imports ####
install.packages("tidyverse")
library(tidyverse)

data <- read.csv("data/travel insurance.csv")
glimpse(data)
summary(data)
mean("data/travel insurance.csv")

#### Raw Data ####
data <- read.csv("data/travel insurance.csv")
mean(data$Duration)
median(data$Duration)
max(data$Duration)- min(data$Duration)
var(data$Duration)
sd(data$Duration)
quantile(data$Duration, 0.75) - quantile(data$Duration, 0.25) 

## Outliers
data <- read.csv("data/travel insurance.csv")
sl <- data$Duration
lower <- mean(sl)- 3*sd(sl)
upper <- mean(sl)+ 3*sd(sl)
Outliers = data$Duration[data$Duration < lower | data$Duration > upper]
plot(data$Duration)
Q1 <- quantile(data$Duration, 0.25)
Q3 <- quantile(data$Duration, 0.75)
IQR <- IQR(data$Duration)
cleaned_data2 <- subset(data, data$Duration > (Q1 - 1.5* IQR) & data$Duration < (Q3 + 1.5*IQR))
mean(data2$Duration2)
median(data2$Duration2)
