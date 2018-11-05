#' @title Reverse string
#' @description Reverses an input string by characters
#' @param str_input an input string
#' @return reverse of input string by characters
reverse_chars <- function(str_input) {
  sub_input <- substring(str_input,1:nchar(str_input),1:nchar(str_input))
  reverse <- sub_input[length(sub_input)]
  for(i in 2:nchar(str_input)) {
    reverse <- paste(reverse,sub_input[length(sub_input)-(i-1)],sep="")
  }
  return(reverse)
}
