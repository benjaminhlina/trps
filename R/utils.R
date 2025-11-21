#' Error functions
#'
#' @param bp value of `TRUE` or `FALSE` or it errors.
#'
#' @name error_functions
#' @keywords internal

check_bp <- function(bp) {
  if (!(is.logical(bp))) {
    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }
}

#' @param x prior to check
#'
#' @name error_functions
#' @keywords internal

check_column_names <- function(x) {
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

check_data_frame <- function(x) {
  if (!(inherits(data, c("data.frame", "tibble", "data.table")))) {
    cli::cli_abort(c(
      "`{x}` must be a data.frame, tibble, or data.table",
      "i" = "Please provide data.frame"
    ))
  }
}

#' @param x prior to check
#'
#' @name error_functions
#' @keywords internal

check_logical <- function(x) {
  if (!(is.logical(x))) {
    cli::cli_abort(c(
      "`{x}` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }
}

#' @param x prior to check
#'
#' @name error_functions
check_prior_params <- function(x) {

  if (!is.numeric(x) || length(x) != 1) {
    cli::cli_abort(c(
      "`{x}` argument must be a numerical value.",
      "i" = "Please provide a numerical value as a piror."
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

