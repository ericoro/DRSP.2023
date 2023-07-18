?ifalse()
case_when()

library(dplyr)
library(tidyr)
library(janitor)
library(ggplot2)

x<- 7
x <- c(1,3,5,7,9)

head(iris)
mean(iris$Petal.Width)
iris_new <- iris

## add categorical column
iris_new <- mutate(iris_new, 
                   petal_size =ifelse(Petal.Width > 1, "big", "small"))


iris_new <- mutate(iris_new, 
                       petal_size = case_when(
                       Petal.Width < 1 ~ "small",
                        Petal.Width < 2 ~ "medium",
                        TRUE ~ "big" ))

ggplot(iris, aes(x= Sepal.Length, y= Sepal.Width)) +
  geom_point()