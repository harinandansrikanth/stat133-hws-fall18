% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rolls.R
\name{[<-.rolls}
\alias{[<-.rolls}
\title{Replacement Method for rolls}
\usage{
\method{[}{rolls}(x, rolls_index) <- value
}
\arguments{
\item{x}{a "rolls" object}

\item{rolls_index}{an index "i" corresponding to the ith roll of the device object}

\item{value}{the new side that you want to replace the old side with}
}
\description{
replaces the side of a "device" object that was rolled on a specific roll corresponding to the inputted index with another side of the same device object.
}
\examples{
#example 1: We have a roll object with the default device (the sides are 1 and 2 with probabilities 0.5 and 0.5) and times = 7 (7 rolls) as the parameters.
roll1 <- roll(device(),7)
Let's say that the side rolled on the 4th roll is 2 (hence, roll1[4] has a value of 2).
After executing the line roll1[4] <- 1, the side rolled on the fourth roll is changed from 2 to 1.

#example 2: We have a roll object with device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)) and times = 16 as the parameters.
roll2 <- roll(device(sides = c(1,2,3), prob = c(0.1,0.3,0.6)),times = 16)
Let's say that the side on the 12th roll is 1.
After executing the line roll2[12] <- 3, the side rolled on the twelfth roll is changed from 1 to 3.
}
