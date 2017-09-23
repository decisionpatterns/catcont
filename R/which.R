#: METHOD: which

#' @return 
#' 
#' `which_cat` and `which.cont` report which variables in an object
#' are categorical and continuous.  By default, interger indices are
#' return.  If `names=TRUE`, the names of the variables are returned
#' instead.
#'
#' @examples
#'   which_cat(iris)
#'   which_cat( iris, names=TRUE )
#'
#'   which_cont(iris)
#'   which_cont( iris, names=TRUE )
#'
#' @aliases which_cat which_cont
#' @md
#' @rdname catcont
#' @export
which_cat  <- function(x, ..., names = FALSE )
{
  ret <- which( unlist( lapply( x, is_cat, ... ) ) )
  return( if( names ) names(ret) else ret  )
}


#' @rdname catcont
#' @export
which_cont  <- function(x, ..., names = FALSE )
{
  ret <- which( unlist( lapply( x, is_cont, ... ) ) )
  return( if( names ) names(ret) else ret  )
}
