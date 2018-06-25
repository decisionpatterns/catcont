#' mutate_if_cat, mutate_if_cont
#'
#' mutates only categorical|continuous columns
#'
#' @param .tbl table
#' @param .funs functions see [dplyr::mutate_if()]
#' @param ... additional parameters
#'
#' @details
#'
#' Mutates categorical or continuous columns.
#'
#' The data.table variants do this as
#'
#' @return
#'
#' An object of class `.tbl` in with columns mutated according to `.funs`
#'
#' @examples
#'
#'  data(iris)
#'
#' \dontrun{
#'   iris %>% mutate_if_cat( as.character )
#'
#'   library(data.table)
#'   setDT(iris)
#'   class(iris$Species)
#'   iris %>% mutate_if_cat( as.character )
#'   class(iris1$Species)  # character
#'   class(iris2)
#'
#'   iris %>% mutate_if_cont( add, 2 )
#' }
#'
#' @seealso
#'
#'  Similar to [dplyr::mutate_if()]
#'
#' @md
#' @import dplyr
#' @rdname mutate_if_cat
#' @export


mutate_if_cat <- function(.tbl, .funs, ... ) UseMethod('mutate_if_cat')


#' @export
#' @rdname mutate_if_cat
mutate_if_cat.default <- function( .tbl, .funs, ... ) {

  if( ! is.data.frame(.tbl) )
    stop( "mutate_if_cat only works for tables." )

  dplyr::mutate_if(.tbl, is_cat,.funs, ... )

}


#' @export
#' @rdname mutate_if_cat
mutate_if_cat.data.table <- function(.tbl, .funs, ... ) {

  requireNamespace("data.table", quietly = TRUE)

  wh <- which_cat(.tbl)
  data.table::set( .tbl, j=wh, value=lapply( .tbl[ , wh, with = FALSE, drop=FALSE ], .funs ) )

  invisible(.tbl)

}



## mutate_if_cont


#' @rdname  mutate_if_cat
#' @export
mutate_if_cont <- function(.tbl, .funs, ... ) UseMethod('mutate_if_cont')


#' @rdname  mutate_if_cat
#' @export
mutate_if_cont.default <- function( .tbl, .funs, ... ) {

  if( ! is.data.frame(.tbl) )
    stop( "mutate_if_cont only works for tables." )

  dplyr::mutate_if(.tbl, is_cont,.funs, ... )

}


#' @export
#' @rdname mutate_if_cat
mutate_if_cont.data.table <- function(.tbl, .funs, ... ) {

  requireNamespace("data.table", quietly = TRUE)

  wh <- which_cont(.tbl)
  data.table::set( .tbl, j=wh, value=lapply( .tbl[ , wh, with = FALSE, drop=FALSE ], .funs ) )

  invisible(.tbl)

}
