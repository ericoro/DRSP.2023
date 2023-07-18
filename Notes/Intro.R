2 + 2
number <- 5
number +1 
number <- number +1


# this is a comment
number <- 10 # set number to 10

# R Objects ####
ls() # print the names of all the objects in our environment
decimal <- 1.5
word <- "hello"
logic <- TRUE
logic2 <- F

#types of variables 
# there are 3 main classes: numeric, character, and logical
class(number)
class(decimal) #numeric 

class(letter)
class(word) # character

class(logical) #logical


## we can change the type of an object
as.character(number)
as.integer(number)


## how to round numbers 
round(decimal) # less than 0.5, rounds down, greater or equal to 0.5, rounds up
round(22/7)
round(22/7, 3) #3 values after decimal
?round

ceiling(22/7) # ceiling always rounds up
floor(22/7) # floor always rounds down

Name <- "Erika"
# illegal naming characters start with number, underscore, operators, conditionals

#good naming conventions 
camelCase <- "start with capital letter"
snake_case <- "underscore between words"


name 
paste("erika", "Corona", "is" , "awesome")
paste0("erika","Corona")


?grep
# True or False
food <- "watermelon"
grepl("me", food)

#substituting words
sub("me","you",food)
sub("me","", food)

#remove an object
rm("number")


# make a vector of numerics 
numbers <- c(1,2,3,4,5)
range_of_vals <- 1:5
seq(2,10,2) #from 2 to 10 by 2's
rep(3,5)
rep(c(1,2),5)

#values between 1 and 5 by 0.5
seq(from = 1, to = 5, by =0.5)

# to get [111222]
rep(c(1,2), each =3)

#random numbers between 1 and 20 
numbers <- 1:20
five_nums <- sample(numbers, 5)
fifteen_nums <- sort(fifteen_nums)


paste("a","b","c")
letters <- c("a","b", "c")
letters <- c("x",letters,"w")

# Datasets ####
mtcars
View(mtcars) # view entire data set in a new tab
summary(mtcars)
str(mtcars)# preview structure of data set 

names(mtcars) # names of variables 
head(mtcars)

#Pul out individual variables as vectors 
mpg <- mtcars[,1]# blank means "all" , first column

# first 3 columns 
mtcars[,1:3]
mean(first5)
#use names to pull out columns 
mtcars[,c("gear","mpg")]

iris
first5 <- iris$Sepal.Length[1:5]
mean(iris$Sepal.Length)
median(first5)
median(iris$Sepal.Length)
