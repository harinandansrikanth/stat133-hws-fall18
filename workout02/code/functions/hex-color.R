#' @title Valid non-alpha color
#' @description checks whether an input string is a valid hex color without an alpha transparency value
#' @param str_input an input string
#' @return TRUE if str_input is a valid hex color without an alpha transperency value, FALSE if it isn't
is_hex <- function(str_input) {
  if(is.character(str_input)==TRUE) {
    hex_vec <- c('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','a','b','c','d','e','f')
    split_str <- substring(str_input,1:nchar(str_input),1:nchar(str_input))
    count <- 0
    for(i in 2:length(split_str)) {
      if(!(split_str[i] %in% hex_vec)) {
        count <- count + 1
      }
    }
    if(((split_str[1]!="#") | (length(split_str)!=7)) | (count!=0)) {
      return(FALSE)
    } else {
      return(TRUE)
    }
  } else {
    stop("Give Character String Only", call. = TRUE)
  }
}


#' @title Valid alpha color
#' @description checks whether an input string is a valid hex color with an alpha transparency value
#' @param str_input an input string
#' @return TRUE if str_input is a valid hex color with an alpha transparency value, FALSE if it isn't
is_hex_alpha <- function(str_input) {
  if(is.character(str_input)==TRUE) {
    hex_vec <- c('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','a','b','c','d','e','f')
    split_str <- substring(str_input,1:nchar(str_input),1:nchar(str_input))
    count <- 0
    for(i in 2:length(split_str)) {
      if(!(split_str[i] %in% hex_vec)) {
        count <- count + 1
      }
    }
    
    if(((split_str[1]!="#") | (length(split_str)!=9)) | (count!=0)) {
      return(FALSE)
    } else {
      return(TRUE)
    }
  } else {
    stop("Give Character String Only", call. = TRUE)
  }
}