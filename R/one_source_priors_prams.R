#' Adjust Bayesian priors - One Source Trophic Position
#'
#' Adjust priors for one source trophic position model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' \eqn{\delta}\eqn{^1}\eqn{^5}N = n1 + dn * (tp - \eqn{\lambda})
#'
#' Please read @details for more information about setting priors.
#'
#' @param n1 mean prior for \eqn{\delta}\eqn{^1}\eqn{^5}N baseline.
#' Defaults to 9.
#' @param n1_sigma variance for  \eqn{\delta}\eqn{^1}\eqn{^5}N  baseline.
#' Defaults to 1.
#' @param dn mean prior value for \eqn{\Delta}N. Defaults to 3.4.
#' @param dn_sigma variance for  \eqn{\delta}\eqn{^1}\eqn{^5}N. Defaults to 0.5.
#' @param tp_lb lower bound prior for trophic position. Defaults to 2.
#' @param tp_ub upper bound prior for trophic position. Defaults to 10.
#' @param sigma_lb lower bound prior for \eqn{\sigma}. Defaults to 0.
#' @param sigma_ub upper bound prior for \eqn{\sigma}. Defaults to 10.
#'
#' @details
#' This function allows the user to adjust the priors for the following variables
#' in the equation above:
#'
#' \itemize{
#'   \item The mean (`n1`) and variance (`n1_sigma`) of \eqn{\delta}\eqn{^1}\eqn{^5}N
#'   for a given baseline. This prior assumes a normal distributions.
#'   \item The mean (`dn`) and variance (`dn_sigma`) of \eqn{\Delta}N (i.e, trophic enrichment
#'   factor;). This prior assumes a normal distributions.
#'   \item The lower (`tp_lb`) and upper (`tp_up`) of trophic position.
#'   This prior assumes a uniform distributions.
#'   \item The lower (`sigma_lb`) and upper (`sigma_up`) variance (\eqn{\sgima}).
#'   This prior assumes a uniform distributions.
#'   }
#'
#' @import brms
#' @seealso [one_source_priors()] and [one_source_model()]
#' @export

one_source_priors_prams <- function(
    n1 = NULL,
    n1_sigma = NULL,
    dn = 3.4,
    dn_sigma = 0.5,
    tp_lb = NULL,
    tp_ub = NULL,
    sigma_lb = NULL,
    sigma_ub = NULL
) {


  # ----- n1 -----

  # set n1 to 9
  if (is.null(n1)) {
    n1 <- 9
  }


  # create error message for n1 priros
  if  (!is.numeric(n1)) {
    cli::cli_abort(c(
      "`n1` argument must be a numerical value.",
      "i" = "Please provide a numerical value as a piror."
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
