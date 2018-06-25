#' select_cat, select_cont
#'
#' Select columns by type
#'
#' @param .data table
#'
#' @details
#'
#' select_cat() and select_cont() return only the categorical and continuous
#' types respectively. This is closely mirrors the dplyr function select but
#' works with non-table values as well.
#'
#' @return
#' Returns a table-like object of the same class as data unless there are no
#' columns in which case `NULL` is returned
#'
#' @examples
#'
#'   data(iris)
#'   select_cat(iris)
#'   select_cont(iris)
#'
#' \dontrun{
#'   setDT(iris)
#'   select_cat(iris)
#'   select_cont(iris)
#' }
#' @export


select_cat <- function(.data) UseMethod('select_cat')


  #' @rdname select_cat
  #' @export

  select_cat.default <- function(.data) {
    ret <- .data[ , which_cat(.data), drop=FALSE ]
    if( ncol(ret)== 0 ) ret <- NULL
    ret
  }

  #' @rdname select_cat
  #' @export

  select_cat.data.table <- function(.data) {
    ret <- .data[ , which_cat(.data), with=FALSE, drop=FALSE ]
    if( ncol(ret)== 0 ) ret <- NULL
    ret
  }



#' @rdname select_cat
#' @export

select_cont <- function(.data) UseMethod('select_cont')

  #' @rdname select_cat
  #' @export

  select_cont.default <- function(.data) {
    ret <- .data[ , which_cont(.data), drop=FALSE ]
    if( ncol(ret)== 0 ) ret <- NULL
    ret
  }

  #' @rdname select_cat
  #' @export

  select_cont.data.table <- function(.data) {
    ret <- .data[ , which_cont(.data), with=FALSE, drop=FALSE ]
    if( ncol(ret)== 0 ) ret <- NULL
    ret
  }
