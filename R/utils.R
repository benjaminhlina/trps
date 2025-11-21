#' Error functions
#' @param x prior to check
#'
#' @name error_functions
#' @keywords internal

check_column_names <- function(x,
                               arg_name = NULL) {

  if (is.null(arg_name)) {
    arg_name <- rlang::as_label(rlang::enexpr(x))
  }

  rv <- c("d13c", "c1", "c2")

  if (!all(rv %in% names(x))) {
    mv <- setdiff(rv, names(x))

    cli::cli_abort(c(
      "The `{x}` is missing: {mv}",
      "i" = "Please provide {mv}"
    ))
  }
}

#' @param x prior to check
#'
#' @name error_functions
#' @keywords internal

check_data_frame <- function(x,
                             arg_name = NULL) {

  if (is.null(arg_name)) {
    arg_name <- rlang::as_label(rlang::enexpr(x))
  }

  if (!(inherits(x, c("data.frame", "tibble", "data.table")))) {
    cli::cli_abort(c(
      "`{arg_name}` must be a data.frame, tibble, or data.table",
      "i" = "Please provide data.frame"
    ))
  }
}

#' @param x prior to check
#' @param arg_name the name of the argument to check.
#'
#' @name error_functions
#' @keywords internal

check_logical <- function(x, arg_name = NULL) {

  if (is.null(arg_name)) {
    arg_name <- rlang::as_label(rlang::enexpr(x))
  }

  if (!(is.logical(x))) {
    cli::cli_abort(c(
      "`{arg_name}` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }
}

#' @param x prior to check
#'  @param arg_name the name of the argument to check.
#'
#' @name error_functions
check_numerical <- function(x, arg_name = NULL) {

  if (is.null(arg_name)) {
    arg_name <- rlang::as_label(rlang::enexpr(x))
  }

  if (!is.numeric(x) || length(x) != 1) {
    cli::cli_abort(c(
      "`{arg_name}` argument must be a numerical value.",
      "i" = "Please provide a numerical value"
    ))
  }
}




# args <- list(...)
#
# for (arg_name in names(args)) {
#   value <- args[[arg_name]]
#
#   # Skip NULLs if allowed
#   if (.allow_null && is.null(value)) {
#     next
#   }
#
#   # Check numeric scalar
#   if (!is.numeric(value) || length(value) != 1) {
#     cli::cli_abort(c(
#       "`{arg_name}` must be a numeric value of length 1.",
#       "i" = "Please provide a numeric scalar as a prior."
#     ))
#   }
# }

