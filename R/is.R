#' @title
#' categorical or continuous variables
#'
#' @description
#' These functions facilitate working with variables as categorical or continous
#' rather than logical, integer, numeric, factor, character, ..
#'
#' @param x object
#' @param names logical; whether to return the names of the variables instead of
#' their index?
#' @param ... arguments passed to other functions.
#'
#' @details
#'
#' These functions are used to test and identify which/if a variable or
#' variables are categorical or continuos.  `is_cat` and `is_cont`
#' take single variable arguments.
#'
#' Mostly, the categorical and continuos assessment is straight-
#' forward. Continuous variables are respresented by `integer`, `double`
#' or `complex` types. All other types are categorical. There are a few
#' opinionated exceptions:
#'   - **factors** are categorical (though typed 'integer')
#'   - **ordered** factors are (though typed 'integer')
#'   - **logical** are categorical
#'
#' For simplicity, it is assumed that a vector cannot be simultaneous
#' categorical and continous, though in some cases (e.g. ordered factors) this
#' may be the case.
#'
#' @seealso
#'  - [base::typeof()]
#'  - [base::is.numeric()] [methods::is()]
#'  - [base::which()]
#'
#' @return
#' `is_cat` and `is_cont` return `logical`.
#'
#' @examples
#'
#'   is_cat(letters)          # TRUE
#'   is_cat(factor(letters))  # TRUE
#'   is_cat(TRUE)             # TRUE
#'   is_cat(FALSE)            # TRUE
#'   is_cat(1:10)             # FALSE
#'   is_cat(rnorm(10))        # FALSE
#'   is_cat( Sys.Date() )     # FALSE
#'   is_cat( complex(1,2) )   # FALSE
#'
#'   is_cont(letters)         # FALSE
#'   is_cont(factor(letters)) # FALSE
#'   is_cont(TRUE)            # FALSE
#'   is_cont(FALSE)           # FALSE
#'   is_cont(1:10)            # TRUE
#'   is_cont(rnorm(10))       # TRUE
#'   is_cont( Sys.Date() )    # TRUE
#'   is_cont( complex(1,2) )  # TRUE
#'
#' @md
#' @aliases is_cat is_cont
#' @rdname catcont
#' @export

is_cat <- function(x) UseMethod('is_cat')


cont_types <- c( 'integer', 'double', 'complex' )

#' @rdname catcont
#' @export

is_cat.default  <- function(x)
  if( typeof(x) %in% cont_types ) FALSE else TRUE


#' @rdname catcont
#' @export
is_cat.ordered <- function(x) FALSE


#' @rdname catcont
#' @export
is_cat.factor <- function(x) TRUE


#' @rdname catcont
#' @export
is_cat.logical <- function(x) TRUE




# METHOD: is_cont

#' @rdname catcont
#' @export
is_cont <- function(x) UseMethod('is_cont')


#' @rdname catcont
#' @export
is_cont.default <- function(x)
  if( typeof(x) %in% cont_types ) TRUE else FALSE


#' @rdname catcont
#' @export
is_cont.logical <- function(x) FALSE

#' #' @rdname catcont
#' #' @export
#' is_cont.POSIXct <- function(x) TRUE


#' @rdname catcont
#' @export
is_cont.factor <- function(x) FALSE


#' @rdname catcont
#' @export
is_cont.ordered <- function(x) TRUE
