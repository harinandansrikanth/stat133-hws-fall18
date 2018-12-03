## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(devtools)
library(dplyr)
library(roller)

## ------------------------------------------------------------------------
#default device object
dev1 <- device()
dev1

#non-default object
dev2 <- device(sides = c('q','w','e'), prob = c((1/4),(1/2),(1/4)))
dev2

## ------------------------------------------------------------------------
#rolls object
rolls1 <- roll(dev1,5)
rolls1

#rolls object
rolls2 <- roll(dev2,12)
rolls2

## ------------------------------------------------------------------------
#is.device()
is.device(device(c("a","b"),c(0.4,0.6)))
is.device(c(0.5,0.5))

#device()
device_example <- device(sides = c("g","h","j"), prob = c(0.3,0.5,0.2))
device_example
print(device_example)

#roll() (class of object is `rolls`, not roll)
set.seed(123)
rolls_example <- roll(device(sides = c(1,2,3,4), prob = c(0.1, 0.2, 0.4, 0.3)), times = 25)
rolls_example

#summary of rolls object
summary(rolls_example)

#plot
plot(rolls_example)

#extraction
rolls_example[14]

#replacement
rolls_example[14] <- 2

#rolls_example #The new rolls_example after replacement
rolls_example[14]

#addition
rolls_example + 15

