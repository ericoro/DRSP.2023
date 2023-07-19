data <- read.csv("data/travel insurance.csv")
head(data)
View(data)

library(tidyr)
library(janitor)
library(dplyr)
library(ggplot2)

## Compare the duration for C2B and JZI agencies
## Null Hypothesis: Average duration is greater for the C2B agency than the JZl agency
## Alternative Hypothesis: Average duration is less for the C2B agency than the JZl agency


ti_Airlines <- data |> filter(Agency.Type == "Airlines", "Duration" > 0)
C2B <- ti_Airlines |> filter(Agency == "C2B")
JZl <- ti_Airlines |> filter(Agency == "JZl")

t.test(as.integer(C2B$Duration, JZl$Duration, paired = F, alternative = "two.sided"))

## Compare commission values based on destinations
## Null Hypothesis: Average commission value is the greatest for Malaysia than Singapore and Japan
## Alternative Hypothesis: Average commission value is less for Malaysia than Singapore and Japan

ti_Destination <- data |>
  summarise(.by = Destination, 
            count = sum(!is.na(Destination))) |>
  slice_max(count, n= 3)

ti_Commission <-  data |>
  filter(Destination %in% ti_Destination$Destination)

Destination_Commission <- aov(data = ti_Commission, Commision..in.value. ~ Destination)
summary(Destination_Commission)
TukeyHSD(Destination_Commission)

##Association between Agency and Agency Type
travelinsurance_clean <- data |>
  filter(Agency != "-",
         Agency.Type != "-")

con_t <- table(travelinsurance_clean$Agency, travelinsurance_clean$Agency.Type)
chisq_rt <- chisq.test(con_t)
chisq_rt$p.value
chisq_rt$residuals
 

