#Compare the mass of male and female human star wars characters?
#Null hypothesis: Average mass of male and female star wars characters is the same 
#Alternative Hypothesis: Avg mass of male and female star wars characters is different 
swHumans <- starwars |> filter(species == "Human", mass> 0)
males <- swHumans |> filter(sex == "male")
females <- swHumans |> filter(sex == "female")

library(tidyr)

t.test(males$mass, females$mass, paired = F)
# P value is 0.06
#not significant, failed to reject null hypothesis 

##ANOVA
iris
View(iris)
anova_results <- aov(Sepal.Length ~ Species, iris)

## Are any groups different from each other?
summary(anova_results)

##Which ones?
TukeyHSD(anova_results)

## Significant difference in the mean petal lengths or petal widths by species
anova_results <- aov(Petal.Length ~ Species, iris)
summary(anova_results)
TukeyHSD(anova_results)



### Starwars
library(tidyr)
library(janitor)
library(dplyr)
head(starwars)
unique(starwars$species)

## 5 species are the most common
top3species <- starwars |>
  summarise(.by = species, 
            count = n()) |>
  slice_max(count, n= 3)

top3species

starwars_top3species <- starwars |>
  filter(species %in% top3species$species)

starwars_top3species

##Significant difference in the mass of each of the top 3 species 
a <- aov(mass ~ species, starwars_top3species) 
summary(a)
TukeyHSD(a)


## Chi-Squared ####
starwars_clean <- starwars |>
  filter(is.na(species)),
  !is.na(homeworld))


t <- table(starwars$species, starwars$homeworld)
chisq.test(t) # not enough data

library(ggplot2)
mpg
table(mpg$cyl, mpg$displ)

## Contingency table of year and drv?
t <- table(mpg$year, mpg$drv)

chisq_result <- chisq.test(t)
chisq_result
chisq_result$p.value
chisq_result$residuals


install.packages("corrplot")
library(corrplot)

corrplot(chisq_result$residuals)


## chi-squared full analysis 
heroes <- read.csv("Data/heroes_information-heroes_information.csv")
