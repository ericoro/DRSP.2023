##install required packages 
install.packages("janitor")
install.packages("tidyr")

##Load required packages 
library(tidyr)
library(janitor)
library(dplyr)

starwars
clean_names(starwars, case = "small_case")
new_starwars <- clean_names(starwars, case = "screaming_snake" )
clean_names(starwars, case = "upper_lower")

clean_names(new_starwars)

new_starwars <- rename(new_starwars, 'hair*color' = HAIR_COLOR)
clean_names(new_starwars)

##All female star wars chraracters by age
StarWarsWomen <- select(arrange(filter(starwars, sex == "female"), birth_year), name, species)

StarWarsWomen <- filter(starwars, sex == "female")
StarWarsWomen <- arrange(StarWarsWomen, birth_year)
StarWarsWomen <- select(StarWarsWomen, name, species)

##Using Pipes
StarWarsWomen <- starwars |> 
  filter(sex == "female") |>
  arrange(birth_year)|>
  select(name, species)

## Slice Functions 

## 10 tallest Star Wars Characters
slice_max(starwars, height, n=10)
slice_max(starwars, height, n=2, by = species, with_ties = F )

##Tidy Data ####
##Pivot Longer
table4a

tidy_table4a <- pivot_longer(table4a,
             cols = c('1999', '2000'), 
             names_to = "year",
             values_to = "cases")

## table4b shows population data
# Pivot table4b
tidy_table4b <- pivot_longer(table4b,
             cols = c('1999', '2000'), 
             names_to = "year",
             values_to = "population")

##Pivot Wider 
table2

pivot_wider(table2,
            names_from = type, 
            values_from = count )

##Separate
table3

separate(table3,
          rate,
          into = c("cases", "population"),
          sep = "/")

##Unite 
table5
head(table5)

tidy_table5 <- unite(table5, 
      "year",
      c("century", "year"),
      sep = "")
separate(rate,
         into = c("cases", "population"),
         sep = "/")

## bind rows 
new_data <- data.frame(country = "USA", year = "1999", cases = "1042", population = "2000000")
bind_rows(tidy_table5, new_data)
