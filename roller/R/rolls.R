library(devtools)
library(roxygen2)
library(testthat)
library(knitr)


#' @title Roll
#' @description returns the result of "rolling" a device object a certain number of times
#' @param device a device object
#' @param times the number of times device is rolled
#' @return a list containing vectors with the outputs of the rolls, the sides of the "device" object, and the probabilities of the sides, as well as the total number of rolls
#' @export
#' @examples
#' #example 1: default device and 7 rolls
#' roll1 <- roll(device(), 7)
#'
#'
#' #example 2: non-default device and 16 rolls
#' roll2 <- roll(device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)), 16)

roll <- function(device, times){
  if(check_times(times)==FALSE){
    stop("times needs to be a positive integer.")
  }
  if(class(device)!="device"){
    stop("The device parameter must be a device object.")
  }
  rolls <- sample(device$sides, times, replace = TRUE, prob = device$prob)
  sides <- device$sides
  prob <- device$prob
  total <- times
  object <- list(rolls,sides,prob,total)
  names(object) <- c("rolls","sides","prob","total")
  class(object) <- "rolls"
  return(object)
}

#private function to check times value
check_times <- function(times){
  if(((is.numeric(times)) & (times > 0)) & (floor(times)==times)){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @export
print.rolls <- function(x, ...){
  #cat('object ','"', class(x),'"', '\n\n', sep = "")
  #cat("$rolls","\n")
  cat('object ','"', class(x),'"', '\n\n', "$rolls", "\n", sep = "")
  print(x$rolls)
  invisible(x)
}

#-------------------------------------------------
#------------------------------------------------------

#function created for print function
#' @export
summary.rolls <- function(x){
  side_count <- rep(0,length(x$sides))
  for(i in 1:length(x$sides)){
    side_count[i] <- sum(x$rolls==x$sides[i])
  }
  rolls_table <- data.frame(
    side = x$sides,
    count = side_count,
    prop = side_count/x$total
  )
  rolls_list <- list(freqs = rolls_table)
  class(rolls_list) <- "summary.rolls"
  return(rolls_list)
}

#' @export
print.summary.rolls <- function(x){
  cat('summary ', '"', substring(class(x),9:nchar(class(x)),9:nchar(class(x))), '"\n\n', sep = "")
  print(x$freqs)
  invisible(x)
}
#--------------------------------------------
#--------------------------------------------

#' @title Plot of side frequencies
#' @description plots a bar graph of the side frequencies in a certain number of rolls of a device object
#' @param x a "rolls" object
#' @export
#' @examples
#' #plotting the side frequencies in 7 rolls of a default device object
#' roll1 <- roll(device(), 7)
#' plot(roll1)
#'
#' #plotting the side frequencies in 16 rolls of a non-default device object
#' roll2 <- roll(device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)), 16)
#' plot(roll2)

plot.rolls <- function(x){
  main_title <- paste0("Relative Frequencies in a series ", sum(summary(x)$freqs$count), " rolls")
  barplot(summary(x)$freqs$prop, names.arg = summary(x)$freqs$side,main = main_title,
          xlab = "sides of device", ylab = "relative frequencies", las = 1, border=NA)
}

#-----------------------------------------------------
#-----------------------------------------------------

#' @title Extraction Method for rolls
#' @description extracts the side of a "device" object that was rolled on a specific roll corresponding to the inputted index
#' @param x a "rolls" object
#' @param rolls_index an index "i" corresponding to the ith roll of the device object
#' @export
#' @examples
#' #example 1: We have a roll object with the default device (the sides are 1 and 2 with probabilities 0.5 and 0.5) and times = 7 (7 rolls) as the parameters.
#' roll1 <- roll(device(),7)
#' The output of roll1[4] is the side rolled on the fourth roll.
#'
#' #example 2: We have a roll object with device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)) and times = 16 as the parameters.
#' roll2 <- roll(device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)),times = 16)
#' The output of roll2[12] is the side rolled on the twelfth roll.

"[.rolls" <- function(x,rolls_index){
  if(!((1<=rolls_index) & (rolls_index<=length(x$rolls)))){
    stop("Please use a rolls_index from 1 to the number of rolls (times).")
  }
  return(x$rolls[rolls_index])
}

#' @title Replacement Method for rolls
#' @description replaces the side of a "device" object that was rolled on a specific roll corresponding to the inputted index with another side of the same device object.
#' @param x a "rolls" object
#' @param rolls_index an index "i" corresponding to the ith roll of the device object
#' @param value the new side that you want to replace the old side with
#' @export
#' @examples
#' #example 1: We have a roll object with the default device (the sides are 1 and 2 with probabilities 0.5 and 0.5) and times = 7 (7 rolls) as the parameters.
#' roll1 <- roll(device(),7)
#' Let's say that the side rolled on the 4th roll is 2 (hence, roll1[4] has a value of 2).
#' After executing the line roll1[4] <- 1, the side rolled on the fourth roll is changed from 2 to 1.
#'
#' #example 2: We have a roll object with device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)) and times = 16 as the parameters.
#' roll2 <- roll(device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)),times = 16)
#' Let's say that the side on the 12th roll is 1.
#' After executing the line roll2[12] <- 3, the side rolled on the twelfth roll is changed from 1 to 3.

"[<-.rolls" <- function(x, rolls_index, value){
  if(!((1<=rolls_index) & (rolls_index<=length(x$rolls)))){
    stop("Please use a rolls_index from 1 to the number of rolls (times).")
  }
  if(!(value %in% x$sides)){
    stop("new_rolls_val must be a value on one of the sides of the device object parameter for the roll function.")
  }
  x$rolls[rolls_index] <- value
  return(x)
}

#' @title Addition Method for rolls
#' @description adds new rolls to a "rolls" object
#' @param x a "rolls" object
#' @param incr the number of new rolls you want to add
#' @export
#' @examples
#' #example 1: We have a roll object with the default device (the sides are 1 and 2 with probabilities 0.5 and 0.5) and times = 7 (7 rolls) as the parameters.
#' roll1 <- roll(device(),7)
#' The output of roll1 + 10 will be a "rolls" object with 10 additional rolls.
#' So, if the output of roll1 is c(1,1,2,1,2,2,1), then the output of roll1 + 10 could be c(1,1,2,1,2,2,1,1,2,1,1,2,1,2,1,2,2).
#'
#' #example 2: We have a roll object with device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)) and times = 16 as the parameters.
#' roll2 <- roll(device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)),times = 16)
#' The output of roll2 + 5 will be a "rolls" object with 5 additional rolls.
#' So, if the output of roll2 is c(1,2,1,3,2,3,2,1,1,3,2,2,3,1,2,3), then the output of roll1 + 10 could be c(1,2,1,3,2,3,2,1,1,3,2,2,3,1,2,3,3,1,2,3,3).

"+.rolls" <- function(x,incr){
  if(!((length(incr)==1) & (incr>0))){
    stop("The incr parameter needs to be greater than 0 in value and have a length equal to 1.")
  }
  more_rolls <- sample(x$sides,incr,replace = TRUE,prob = x$prob)
  x$rolls <- c(x$rolls,more_rolls)
  x$total <- x$total + incr
  return(x)
}


