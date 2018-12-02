library(devtools)
library(roxygen2)
library(testthat)
library(knitr)

# default call: creates a coin device
fair_coin <- device()
fair_coin

# die with non-standard sides
weird_die <- device(
  sides = c('i', 'ii', 'iii', 'iv'),
  prob = rep(1/4, 4))
weird_die

is.device(weird_die)

# create a loaded die
loaded_die <- device(
  sides = 1:6,
  prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35))
loaded_die

is.device(loaded_die)

# bad sides (there must be at least 2-sides)
invalid_device <- device(sides = c('a'))

# bad sides (duplicated sides)
bad_coin <- device(sides = c('heads', 'heads'))

# bad probability values for prob
bad_coin <- device(
  sides = c('a', 'b'),
  prob = c(0.2, 0.1))

# sides and prob of different lengths
bad_example <- device(
  sides = c('a', 'b', 'c'),
  prob = c(0.2, 0.8))

# false device
is.device(c(1, 2, 3))
