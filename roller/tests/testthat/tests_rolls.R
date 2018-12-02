library(testthat)

source("C:/Users/Harinandan/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 3/roller/R/rolls.R")
source("C:/Users/Harinandan/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 3/roller/R/device.R")

context("Check rolls.R")

set.seed(123)
r1 <- roll(device(), times=50)

set.seed(123)
r2 <- roll(device(sides = 1:6, prob = rep(1/6, 6)), times=50)

test_that("elements of rolls r1 and r2 and names function applied on r1 and r2 return correct vectors",{
  r1_list <- list(
    rolls = c(2,1,2,1,1,2,1,1,1,2,1,2,1,1,2,1,2,2,2,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1),
    sides = c(1, 2),
    prob = c(0.5, 0.5),
    total = 50
  )
  class(r1_list) = 'rolls'

  expect_identical(r1, r1_list)

  expect_identical(names(r1),c("rolls","sides","prob","total"))
  expect_identical(r1$rolls,c(2,1,2,1,1,2,1,1,1,2,1,2,1,1,2,1,2,2,2,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,2,2,1,2,2,2,2,2,2,2,2,2,2,2,2,1))
  expect_identical(r1$sides,c(1,2))
  expect_identical(r1$prob,c(0.5,0.5))
  expect_identical(r1$total,50)

  r2_list <- list(
    rolls = c(3,6,4,1,1,2,5,1,5,4,1,4,6,5,2,1,3,2,3,1,1,6,5,1,5,6,5,5,3,2,1,1,6,6,2,4,6,3,3,3,2,4,4,4,2,2,3,4,3,1),
    sides = 1:6,
    prob = rep(1/6, 6),
    total = 50
  )
  class(r2_list) = 'rolls'

  expect_equal(r2, r2_list)
})

set.seed(123)
b <- roll(device(sides = c('a', 'b', 'c', 'd', 'e', 'f'), prob = c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)), times = 20)

test_that("elements of roll 'b' and names function applied on device return correct vectors",{
  expect_identical(names(b),c("rolls","sides","prob","total"))
  expect_identical(b$rolls, c("f","c","e","b","a","f","e","b","d","e","a","e","d","d","f","b","f","f","f","a"))

})

set.seed(123)
c <- roll(device(sides = 1:6, prob = rep(1/6, 6)), times = 50)
c_sum <- summary(c)

test_that("class and names functions applied on summary 'c' return correct vectors",{
  expect_identical(class(c_sum),"summary.rolls")
  expect_identical(names(c_sum),"freqs")
})

side_count_c <- rep(0,length(c$sides))
for(i in 1:length(c$sides)){
  side_count_c[i] <- sum(c$rolls==c$sides[i])
}

dat_c <- data.frame(
  side = c$sides,
  count = side_count_c,
  prop = side_count_c/c$total
)

dat_c_comp <- data.frame(side=c(1,2,3,4,5,6),count=c(11,8,9,8,7,7),prop=c(0.22,0.16,0.18,0.16,0.14,0.14))

class(dat_c) <- "summary_df"
class(dat_c_comp) <- "summary_df"

test_that("element 'freqs' of 'c' returns correct data frame",{
  expect_equal(dat_c, dat_c_comp)
})

set.seed(123)
d <- roll(device(sides = letters[1:8], prob = rep(1/8, 8)), times = 500)


side_count_d <- rep(0,length(d$sides))
for(i in 1:length(d$sides)){
  side_count_d[i] <- sum(d$rolls==d$sides[i])
}

dat_d <- data.frame(
  side = d$sides,
  count = side_count_d,
  prop = side_count_d/d$total
)

dat_d_comp <- data.frame(side=c('a','b','c','d','e','f','g','h'),count=c(63,54,73,69,69,51,65,56),prop=c(0.126,0.108,0.146,0.138,0.138,0.102,0.130,0.112))

class(dat_d) <- "summary_df"
class(dat_d_comp) <- "summary_df"

test_that("element 'freqs' of 'd' returns correct data frame",{
  expect_equal(dat_d, dat_d_comp)
})

test_that("The last roll in roll 'd' is successfully extracted",{
  expect_identical(d[500],"h")
})

d[500] <- "a"
side_count_d2 <- rep(0,length(d$sides))
for(i in 1:length(d$sides)){
  side_count_d2[i] <- sum(d$rolls==d$sides[i])
}

dat_d2 <- data.frame(
  side = d$sides,
  count = side_count_d2,
  prop = side_count_d2/d$total
)

dat_d2_comp <- data.frame(side=c('a','b','c','d','e','f','g','h'),count=c(64,54,73,69,69,51,65,55),prop=c(0.128,0.108,0.146,0.138,0.138,0.102,0.130,0.110))

class(dat_c) <- "summary_df"
class(dat_c_comp) <- "summary_df"
test_that("The last roll in roll 'd' is successfully replaced",{
  expect_identical(d[500],"a")
  expect_identical(dat_d2, dat_d2_comp)
})

e <- d + 100
side_count_e <- rep(0,length(e$sides))
for(i in 1:length(e$sides)){
  side_count_e[i] <- sum(e$rolls==e$sides[i])
}

dat_e <- data.frame(
  side = e$sides,
  count = side_count_e,
  prop = side_count_e/e$total
)

dat_e_comp <- data.frame(side=c('a','b','c','d','e','f','g','h'),count=c(79,69,78,85,78,67,74,70),prop=c((79/600),(69/600),(78/600),(85/600),(78/600),(67/600),(74/600),(70/600)))

class(dat_e) <- "summary_df"
class(dat_e_comp) <- "summary_df"

test_that("element 'freqs' of 'e' returns correct data frame",{
  expect_identical(dat_e, dat_e_comp)
})

test_that("sides parameter of device fails check_sides",{
  expect_true(check_times(5))
  expect_false(check_times(5.2))
  expect_true(check_times(6))
  expect_false(check_times(6.7))
})



