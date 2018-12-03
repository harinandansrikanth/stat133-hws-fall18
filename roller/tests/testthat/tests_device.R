library(testthat)

source("C:/Users/Harinandan/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 3/roller/R/device.R")

context("Check device.R")
#list(sides = sides, prob = prob)
test_that("device returns correct list corresponding to parameters",{
  dev_default_comp <- list(sides = c(1,2), prob = c(0.5,0.5))
  class(dev_default_comp) <- "device"
  expect_identical(device(),dev_default_comp)

  dev_comp_2 <- list(sides = c('i','ii','iii','iv'), prob = rep(1/4, 4))
  class(dev_comp_2) <- "device"
  expect_identical(device(sides=c('i','ii','iii','iv'),prob=rep(1/4, 4)),dev_comp_2)

  dev_comp_3 <- list(sides = 1:6, prob = c(0.075,0.1,0.125,0.15,0.20,0.35))
  class(dev_comp_3) <- "device"
  expect_identical(device(sides=1:6,prob=c(0.075,0.1,0.125,0.15,0.20,0.35)),dev_comp_3)
})

test_that("parameter is a device object",{
  expect_true(is.device(device(sides = c('i','ii','iii','iv'),prob = rep(1/4, 4))))
  expect_true(is.device(device(sides = 1:6,prob = c(0.075,0.1,0.125,0.15,0.20,0.35))))
  expect_false(is.device(c(1,2,3)))
})

test_that("sides parameter of device fails check_sides",{
  expect_true(check_sides(c('a','b')))
  expect_false(check_sides(c('a')))
  expect_false(check_sides(c('heads','heads')))
})

test_that("prob parameter of device fails check_prob",{
  expect_false(check_prob(c(0.2,0.1)))
  expect_true(check_prob(c(0.2,0.8)))
})

test_that("prob parameter of device fails check_prob",{
  expect_error(device(sides = c("a","b"), prob = c(0.2,0.1)),"prob must a numeric vector with length greater than 1, all elements summing to 1, and no element being less than 0 or greater than 1.")
  expect_error(device(sides = c('heads','heads'), prob = c(0.2,0.8)),"sides must be a vector with length greater than 1 and no repeated elements.")
})
