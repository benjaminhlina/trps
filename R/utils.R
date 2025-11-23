#' Error functions
#' @param x prior to check
#' @param arg_name the name of the argument to check.
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
      "`{arg_name}` is missing: {mv}",
      "i" = "Please provide {mv}"
    ))
  }
}

#' @param x prior to check
#' @param arg_name the name of the argument to check.
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
#' @name error_functions
#' @keywords internal
check_lambda <- function(x,
                         arg_name = NULL) {

  if (is.null(arg_name)) {
    arg_name <- rlang::as_label(rlang::enexpr(x))
  }

  if (!(is.numeric(x)) || !(x %in% c(1, 2))) {
    cli::cli_abort(c(
      "`{arg_name}` argument must be a numeric value and either `1` or `2`",
      "i" = "Please provide `1` or `2`"
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

#' Set default priors
#' @param model model type
#' @name set_priors
#' @keywords internal

default_priors <- function(model = c(
  "one_source",
  "two_source",
  "two_source_ar",
  "two_source_arc"
)) {

  model <- match.arg(model)

  base_defaults <- list(
    dn = 3.4,
    dn_sigma = 0.25,
    tp_lb = 2,
    tp_ub = 10,
    sigma_lb = 0,
    sigma_ub = 10
  )

  model_specific <- list(

    one_source = list(
      n1 = 9,
      n1_sigma = 1
    ),

    two_source = list(
      a = 1,
      b = 1,
      c1 = -21,
      c1_sigma = 1,
      c2 = -26,
      c2_sigma = 1,
      n1 = 8,
      n1_sigma = 1,
      n2 = 9.5,
      n2_sigma = 1
    ),

    two_source_ar = list(
      a = 1,
      b = 1,
      n1 = 8,
      n1_sigma = 1,
      n2 = 9.5,
      n2_sigma = 1
    ),

    two_source_arc = list(
      a = 1,
      b = 1,
      n1 = 8,
      n1_sigma = 1,
      n2 = 9.5,
      n2_sigma = 1,
      c1 = -21,
      c1_sigma = 1,
      c2 = -26,
      c2_sigma = 1
    )
  )

  # Merge: specific overrides base
  c(model_specific[[model]],
    base_defaults)
}

#' @param model model type
#' @name set_priors
#' @keywords internal
supplied_priors <- function(model = c(
  "one_source",
  "two_source",
  "two_source_ar",
  "two_source_arc"
),
a = NULL,
b = NULL,
n1 = NULL,
n1_sigma = NULL,
n2 = NULL,
n2_sigma = NULL,
c1 = NULL,
c1_sigma = NULL,
c2 = NULL,
c2_sigma = NULL,
dn = NULL,
dn_sigma = NULL,
tp_lb = NULL,
tp_ub = NULL,
sigma_lb = NULL,
sigma_ub = NULL
) {
  model <- match.arg(model)

  # ---- shared variables across all models ----
  base_supplied <- list(
    dn = dn,
    dn_sigma = dn_sigma,
    tp_lb = tp_lb,
    tp_ub = tp_ub,
    sigma_lb = sigma_lb,
    sigma_ub = sigma_ub
  )

  # ---- model-specific supplied variables ----
  model_specific <- list(

    one_source = list(
      n1 = n1,
      n1_sigma = n1_sigma
    ),

    two_source = list(
      a = a,
      b = b,
      c1 = c1,
      c1_sigma = c1_sigma,
      c2 = c2,
      c2_sigma = c2_sigma,
      n1 = n1,
      n1_sigma = n1_sigma,
      n2 = n2,
      n2_sigma = n2_sigma
    ),

    two_source_ar = list(
      a = a,
      b = b,
      n1 = n1,
      n1_sigma = n1_sigma,
      n2 = n2,
      n2_sigma = n2_sigma
    ),

    two_source_arc = list(
      a = a,
      b = b,
      c1 = c1,
      c1_sigma = c1_sigma,
      c2 = c2,
      c2_sigma = c2_sigma,
      n1 = n1,
      n1_sigma = n1_sigma,
      n2 = n2,
      n2_sigma = n2_sigma
    )
  )

  # merge them (model-specific overrides base)
  c(model_specific[[model]],
    base_supplied)
}


