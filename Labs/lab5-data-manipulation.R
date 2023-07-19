## Filter Observations 
data <- read.csv("data/travel insurance.csv")
head(data)
View(data)

# Filter for rows with Airlines as Agency Type
filter(data, Agency.Type == "Airlines" )
Airlines <- filter(data,Agency.Type == "Airlines" )

## Smaller Data set
select(data, -Claim, -Distribution.Channel, )
Airlines <- select(data, -Claim, -Distribution.Channel, )

##New Columns Added
mutate(data, duration_destination = mean(Duration), .by=Destination)
mutate(data, age_gender =mean(Age), .by=Age)

## Grouping
summarise(data,
          mean_duration= mean(Duration, na.rm =T),
          .by=Agency.Type)
mean_duration <- summarise(data,
                           mean_duration= mean(Duration, na.rm =T),
                           .by=Agency.Type)
summarise(data,
          mean_duration= mean(Duration, na.rm =T),
          .by=Destination)
mean_duration2 <-summarise(data,
                           mean_duration= mean(Duration, na.rm =T),
                           .by=Destination)


##Data Table 
library(ggplot2)
ggplot(mean_duration, aes(x=Agency.Type, y=mean_duration))+
  geom_boxplot(width=0.2,color="green")+
  labs(title="Travel Insurance by Agency Type and Average Duration", xlab= "Agency Type", ylab= "Duration")

ggplot(mean_duration2, aes(x=Destination, y=mean_duration))+
  geom_boxplot(width=0.2,color="green")+
  labs(title="Travel Insurance by Agency Type and Duration", xlab= "Agency Type", ylab= "Duration")

