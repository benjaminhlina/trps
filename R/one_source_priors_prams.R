#' Adjust Bayesian priors - One Source Trophic Position
#'
#' Adjust priors for one source trophic position model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' This function allows the user to adjust the prior mean and variance for \eqn{\delta}\eqn{^1}\eqn{^5}N for baseline.
#' To be used with `one_source_priors` and `one_source_model`.
#'
#' @param n1 mean prior value for \eqn{\delta}\eqn{^1}\eqn{^5}N for baseline used in the model.
#' Defaults to 9.
#' @param n1_sigma variance for n1 priors that are \eqn{\delta}\eqn{^1}\eqn{^5}N for baseline used in the model.
#' Defaults to 1.
#' @details
#' You can adjust the prior mean and variance for \eqn{\delta}\eqn{^1}\eqn{^5}N by supplying `n1` and `n1_sigma` with a numerical value.
#'
#' @import brms
#' @seealso [one_source_priors()] and [one_source_model()]
#' @export

one_source_priors_prams <- function(
    n1 = NULL,
    n1_sigma = NULL
    ) {

  # set n1 to 9
  if (is.null(n1)) {
    n1 <- 9
  }

  # create error message for n1 priros
  if  (!is.numeric(n1)) {
    cli::cli_abort(c(
      "`n1` argument must be a numerical value",
      "i" = "Please provide a numerical value to as an informed or uniformed
      prior for n1"
    ))
  }

  # set n1_sigma to 1
  if (is.null(n1_sigma)) {
    n1_sigma <- 1
  }
  # create error message for n1 priors
  if  (!is.numeric(n1_sigma)) {
    cli::cli_abort(c(
      "`n1_sigma` argument must be a numerical value",
      "i" = "Please provide a numerical value for n1_sigma"
    ))
  }

  # this is close
  priors_params <- brms::stanvar(n1, name = 'n1') +
    brms::stanvar(n1_sigma, 'n1_sigma')

  return(priors_params)

}
