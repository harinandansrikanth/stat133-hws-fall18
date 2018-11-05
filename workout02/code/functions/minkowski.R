#' @title Minkowski distance of order p
#' @description computes Minkowski distance between two points (each having the same number of coordinates) for a specific order p
#' @param x numeric vector for one point
#' @param y numeric vector for the other point
#' @param p either a numeric value greater than or equal to 1, or a character string "max" (p will have a numeric value of 1 by default)
#' @return Minkowski distance between pointx and point y for an order p

minkowski <- function(x,y,p=1) {
  if(length(x)!=length(y)) {
    stop("x and y have different lengths")
  }
  if((is.numeric(p)==TRUE) & (p<1)) {
    stop("p cannot be less than 1")
  }
  if((is.character(p)==TRUE) & (p!="max")) {
    stop("invalid character value for p")
  }
  
  summation <- 0
  inf_vec <- -1
  if(is.numeric(p)==TRUE) {
    for(i in 1:length(x)) {
      summation <- summation + ((abs(x[i]-y[i]))^p)
    }
    return(summation^(1/p))
  } else {
    for(i in 1:length(x)) {
      if(inf_vec < abs(x[i]-y[i])) {
        inf_vec <- c(abs(x[i]-y[i]))
      }
    }
    return(inf_vec[1])
  }

}
