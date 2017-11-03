#' select_cat, select_cont
#'
#' Select columns by role
#'
#' @param data
#'
#' @details
#'
#' select_cat() and select_cont() return only the
#'
#' @return
#' Always returns a table object
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


select_cat <- function(data) UseMethod('select_cat')


  #' @rdname select_cat
  #' @export

  select_cat.default <- function(data)
    data[ , which_cat(data), drop=FALSE ]

  #' @rdname select_cat
  #' @export

  select_cat.data.table <- function(data)
    data[ , which_cat(data), with=FALSE, drop=FALSE ]




#' @rdname select_cat
#' @export

select_cont <- function(data) UseMethod('select_cont')

  #' @rdname select_cat
  #' @export

  select_cont.default <- function(data)
    data[ , which_cont(data), drop=FALSE ]

  #' @rdname select_cat
  #' @export

  select_cont.data.table <- function(data)
    data[ , which_cont(data), with=FALSE, drop=FALSE ]
