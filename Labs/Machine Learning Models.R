data <- read.csv("data/travel insurance.csv")
head(data)
View(data)
 
## Clean and process data 
ti_num <- select(data, -c(Agency, Agency.Type,Distribution.Channel, Product.Name, Claim,Destination, Gender))
ti_num

pcas <- prcomp(ti_num, scale. =T)
summary(pcas)
pcas$rotation
pcas$rotation^2

pca_vals <- as.data.frame(pcas$x)
pca_vals$Agency <- data$Agency
ggplot(pca_vals, aes(PC1, PC2, color =  data$Agency))+
  geom_point()+
  theme_minimal()

library(reshape2)
library(ggplot2)

TiAllNumeric <- mutate(data, 
                         Destination = as.integer(as.factor(Destination)))

TiAllNumeric

ggplot(TiAllNumeric, aes(x= Net.Sales, y = Duration)) +
  geom_point()+
  theme_minimal()

library(rsample)
reg_splitTi <- initial_split(TiAllNumeric, prop = .75)

reg_train <- training(reg_splitTi)
reg_test <- testing(reg_splitTi)

library(parsnip)

lm_fit <- linear_reg() |>
  set_engine("lm") |>
  set_mode("regression")|>
  fit(Duration ~ Net.Sales + Commision..in.value. + Age ,
      data = reg_train)

lm_fit$fit
summary(lm_fit$fit)

library(xgboost)
TIboost_reg_fit <- boost_tree()|>
  set_engine("xgboost")|>
  set_mode("regression")|>
  fit(Duration ~ ., data = reg_train)

TIboost_reg_fit$fit



