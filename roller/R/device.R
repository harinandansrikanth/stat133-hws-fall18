library(devtools)
library(roxygen2)
library(testthat)
library(knitr)

#' @title Device
#' @description returns a "device" object which has a certain number of sides and a distribution of probabilities for landing on those sides
#' @param sides a vector containing the side numbers of the object, which are always positive integers with 1 being the minimum
#' @param prob a vector containing the corresponding probabilities of the sides of the object
#' @return a "device" object
#' @export
#' @examples
#' #default
#' device1 <- device(sides = c(1,2), prob = c(0.5,0.5))
#'
#' #another example
#' device2 <- device(side = c(1,2,3), prob = c(0.1,0.3,0.6))

device <- function(sides = c(1,2), prob = c(0.5,0.5)) {
  if(check_sides(sides)==FALSE){
    stop("sides must be a vector with length greater than 1 and no repeated elements.")
  }
  if(check_prob(prob)==FALSE){
    stop("prob must a numeric vector with length greater than 1, all elements summing to 1, and no element being less than 0 or greater than 1.")
  }
  if(!(length(sides)==length(prob))){
    stop("sides and prob must be of equal length.")
  }

  object <- list(sides = sides, prob = prob)
  class(object) <- "device"
  return(object)
}

#private function to check sides vector
check_sides <- function(sides){
  if(((is.vector(sides)) & (length(sides) > 1)) & (sum(duplicated(sides))==0)){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#private function to check prob vector
check_prob <- function(prob){
  if(((((is.vector(prob)) & (is.numeric(prob))) & (length(prob) > 1)))){
    total_prob <-sum(prob)
    values_lt_0 <- sum(prob<0)
    values_gt_1 <- sum(prob>1)
    if ((total_prob == 1) & (values_lt_0 == 0) & (values_gt_1 == 0)){
      return(TRUE)
    } else {
      return(FALSE)
    }
  } else {
    return(FALSE)
  }
}

#optional summary function
summary.device <- function(x, ...){
  device_table <- data.frame(
    side = x$sides,
    prob = x$prob
  )
  dev_list <- list(device_table = device_table)
  return(dev_list)
}

#' @export
print.device <- function(x, ...){
  #cat('object ', '"', substring(class(x),9:nchar(class(x)),9:nchar(class(x))), '"\n\n', sep = "")
  cat('object ', '"', class(x), '"\n\n', sep = "")
  device_table <- data.frame(
    side = x$sides,
    prob = x$prob
  )
  print(device_table)
  invisible(x)
}

#' @rdname device
#' @param x an object in R
#' @export
is.device <- function(x){
  inherits(x, "device")
}

#device()

#coin1 <- device(c("lions","monkeys"),c(0.6,0.4))
#coin1

#dice1 <- device(c("1","2","3","4","5","6"),c(1/6,1/6,1/6,1/6,1/6,1/6))
#summary(dice1)

#dice2 <- device(c("1","2","3","4","5","6"),c(1/6,1/6,1/6,1/6,1/6,1/7))

#dice3 <- device(c("1","1","3","4","5","6"),c(1/6,1/6,1/6,1/6,1/6,1/7))

