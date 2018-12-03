library(devtools)
library(roxygen2)
library(testthat)
library(knitr)

# roll fair die 50 times
fair_die <- device()
set.seed(123)
fair50 <- roll(fair_die, times = 50)
fair50

# roll fair die 50 times
fair_die <- device(sides = 1:6, prob = rep(1/6, 6))

# roll 50 times
set.seed(123)
fair_50rolls <- roll(fair_die, times = 50)

# print
fair_50rolls

# what's in fair50?
names(fair50)

fair50$rolls

fair50$sides

fair50$prob

fair50$total

# string die
str_die <- device(
  sides = c('a', 'b', 'c', 'd', 'e', 'f'),
  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
# roll 20 times
set.seed(123)
str_rolls <- roll(str_die, times = 20)
names(str_rolls)

str_rolls
#--------------------------------------------------
#------------------------------------------------------
set.seed(123)
fair_50rolls <- roll(fair_die, times = 50)
fair50_sum <- summary(fair_50rolls)
fair50_sum

# class
class(fair50_sum)

# what's in the summary
names(fair50_sum)

fair50_sum$freqs
#-----------------------------------------
#-----------------------------------------

# plot method
plot(fair_50rolls)

#-----------------------------------------
#-----------------------------------------
# roll fair 8-sided die
set.seed(123)
fair_dev <- device(sides = letters[1:8], prob = rep(1/8, 8))
class(fair_dev)
fair500 <- roll(fair_dev, times = 500)
# summary method
summary(fair500)

# extracting roll in position 500
#fair500[500]
fair500[499]

# replacing last roll
fair500[500] <- 'a'
fair500[500]

summary(fair500)

# adding 100 rolls
fair600 <- fair500 + 100

summary(fair600)

# plot method
#plot(fair500, 500)
plot(fair500)

rolls_example <- roll(device(sides = c(1,2,3,4), prob = c(0.1, 0.2, 0.4, 0.3)), times = 25)
rolls_example[14]
summary(rolls_example)


