#' @title a,e,i,o,u distribution
#' @description counts frequency of each type of vowel in a string
#' @param str_input an input string
#' @return numeric vector showing distribution of the count of each type of vowel in input string
count_vowels <- function(str_input) {
  
  if(is.character(str_input)==TRUE) {
    count_a <- 0
    count_e <- 0
    count_i <- 0
    count_o <- 0
    count_u <- 0
    
    str_input <- tolower(str_input)
    sub_input <- substring(str_input,1:nchar(str_input),1:nchar(str_input))
    for(i in 1:nchar(str_input)) {
      if(sub_input[i]=="a") {
        count_a <- count_a + 1
      }
      if(sub_input[i]=="e") {
        count_e <- count_e + 1
      }
      if(sub_input[i]=="i") {
        count_i <- count_i + 1
      }
      if(sub_input[i]=="o") {
        count_o <- count_o + 1
      }
      if(sub_input[i]=="u") {
        count_u <- count_u + 1
      }
    }
    vowel_freq <- c(a=count_a,e=count_e,i=count_i,o=count_o,u=count_u)
    
    return(vowel_freq)
  
  } else {
    stop("input must be a character string", call. = TRUE)
  }
}