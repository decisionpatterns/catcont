
#' @return
#'
#' `cat_cont` returns a named character with values either "`cat`" or "`cont`".
#' If `x` is a atomic vector, a single string is given. If `x` is recursive,
#' a "`cat`"/"`cont`" value is given for each element. Names correspond to the
#' names of the element.
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
  if( is.recursive(x) )
    ifelse( sapply(x, is_cat), "cat", "cont" ) else
    ifelse( is_cat(x), "cat", "cont" )
