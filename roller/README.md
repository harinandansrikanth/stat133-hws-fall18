## Overview
 
"roller" is a R package that utilizes several functions in order to 
simulate rolling an object with distinct sides.
- device() creates an object belonging to the "device" class that has 
sides and probabilties associated with those sides
- roll() creates an object belonging to the "rolls" class that rolls a 
"device" a certain number of times according to its sides and 
probabilities
- is.device() tests whether an object belongs to the "device" class
- print.device() prints a "device" object as a data frame with a header
- summary.rolls() returns a summary of a "rolls" object that includes 
the sides of its "device" parameter, the number of times each side was 
rolled, and the proportions of the rolls on which each side was rolled.
- plot.rolls() takes a "rolls" object and displays a barplot of the 
frequencies of the "device" parameter's sides in the rolls.
- The extraction method "[" returns the "device" side rolled on a 
specific roll corresponding to an index.
- The replacement method "[<-" replaces the "device" side rolled on 
a specific roll corresponding to an index with another "device" side
- The addition method "+" adds new rolls to a "rolls" object

## Installation

Use one of these functions to install "roller" version from GitHub 
(with or without vignette). Install "devtools" package if needed.

install.packages("devtools")
devtools::install_github("harinandansrikanth/stat133-hws-fall18/roller")
devtools::install_github("harinandansrikanth/stat133-hws-fall18/roller", build_vignettes = TRUE)

## Usage

knitr::opts_chunk$set(collapse = T, comment = "#>")
library(dplyr)
library(roller)

\#default device object
dev1 <- device()
dev1
\#> object "device"
\#> 
\#>   side prob
\#> 1    1  0.5
\#> 2    2  0.5

\#non-default object
dev2 <- device(sides = c('q','w','e'), prob = c((1/4),(1/2),(1/4)))
dev2
\#> object "device"
\#> 
\#>   side prob
\#> 1    q 0.25
\#> 2    w 0.50
\#> 3    e 0.25

\#rolls object
rolls1 <- roll(dev1,5)
rolls1
\#> object "rolls"
\#> 
\#> $rolls
\#> [1] 1 1 1 1 2

\#rolls object
rolls2 <- roll(dev2,12)
rolls2
\#> object "rolls"
\#> 
\#> $rolls
\#>  [1] "w" "w" "e" "q" "q" "w" "e" "q" "e" "w" "w" "w"

\#is.device()
is.device(device(c("a","b"),c(0.4,0.6)))
\#> [1] TRUE
is.device(c(0.5,0.5))
\#> [1] FALSE

\#device()
device_example <- device(sides = c("g","h","j"), prob = 
c(0.3,0.5,0.2))
device_example
\#> object "device"
\#> 
\#>   side prob
\#> 1    g  0.3
\#> 2    h  0.5
\#> 3    j  0.2
print(device_example)
\#> object "device"
\#> 
\#>   side prob
\#> 1    g  0.3
\#> 2    h  0.5
\#> 3    j  0.2

\#roll() (class of object is `rolls`, not roll)
set.seed(123)
rolls_example <- roll(device(sides = c(1,2,3,4), prob = c(0.1, 0.2, 
0.4, 0.3)), times = 25)
rolls_example
\#> object "rolls"
\#> 
\#> $rolls
\#>  [1] 3 2 4 2 1 3 4 2 4 4 1 4 4 4 3 2 3 3 3 1 2 4 4 1 4
summary(rolls_example)
\#>       Length Class  Mode   
\#> rolls 25     -none- numeric
\#> sides  4     -none- numeric
\#> prob   4     -none- numeric
\#> total  1     -none- numeric

\#plot
plot(rolls_example)

\#extraction
rolls_example[14]
\#> [1] 4

\#replacement
rolls_example[14] <- 2

\#rolls_example #The new rolls_example after replacement
rolls_example[14]
\#> [1] 2

\#addition
rolls_example + 15
\#> object "rolls"
\#> 
\#> $rolls
\#>  [1] 3 2 4 2 1 3 4 2 4 4 1 4 4 2 3 2 3 3 3 1 2 4 4 1 4 2 4 4 3 3 
1 1 4 2 3
\#> [36] 4 2 3 3 3
