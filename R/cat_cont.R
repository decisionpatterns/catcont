
#' @return 
#' 
#' `cat_cont` returns a named character with values either "`cat`" or "`cont`". 
#' Names are the column names of `x`.
#' 
#' @examples 
#' 
#'   data(iris)
#'   cat_cont(iris)
#' 
#' @md
#' @rdname catcont
#' @export

cat_cont <- function(x) 
  ifelse( sapply(x, is_cat), "cat", "cont" )
