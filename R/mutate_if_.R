#' mutate_if_cat, mutate_if_cont
#'
#' mutates only types of objects
#'
#' @param .tbl table
#' @param .funs
#'
#' @details
#'
#' These are just wrappers around `mutate_if` where the `.predicate` is `is_cat`
#' and `is_cont`.
#'
#' @return
#'
#' An object of class `.tbl` in with columns mutated according to whe
#'
#' @examples
#'
#'   data(iris)
#'   class(iris$Species)
#'   iris2 <- iris %>% mutate_if_cat( as.character )
#'   class(iris2$Species)  # character
#'
#'   iris %>% mutate_if_cont( add, 2 )
#'
#' @seealso
#'
#'  [dplyr::mutate_if()]
#'
#' @md
#' @import dplyr
#' @export


mutate_if_cat <- function(.tbl, .funs, ... ) {

  dplyr::mutate_if(.tbl, is_cat, .funs, ... )

}


#' @rdname  mutate_if_cat
#' @export
#'
mutate_if_cont <- function( .tbl, .funs, ... ) {

  dplyr::mutate_if(.tbl, is_cont,.funs, ... )

}
