#' Bayesian model - One Source Trophic Position
#'
#' Bayesian model for trophic position using a one source model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' \eqn{\delta}\eqn{^1}\eqn{^5}N = n1 + dn * (tp - \eqn{\lambda})
#'
#' \eqn{\delta}\eqn{^1}\eqn{^5}N are values from the consumer,
#' n1 is \eqn{\delta}\eqn{^1}\eqn{^5}N values of baseline 1,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of 3.4),
#' tp is trophic position, and \eqn{\lambda} is the trophic level of baselines which are often a primary consumer (e.g., 2).
#'
#' Posterior distributions of of n1, dn, and tp will be estimated.
#'
#' @details
#' The data supplied to `brms()` needs to have the following variables, `d15n`
#' which is the eqn{\delta}\eqn{^1}\eqn{^5}N of the consumers, `n1` which is
#' \eqn{\delta}\eqn{^1}\eqn{^5}N values of baseline 1, and
#' `lambda` which is usually `2 `otherwise `brms()` will error.
#'
#' @import brms
#' @seealso [brms::brms()]
#' @export

one_source_model <- function() {

  model <- brms::bf(
    # Likelihood function
    d15n ~ n1 + dn * (tp - lambda),
    # Baseline δ15N (to be estimated)
    n1 ~ 1,
    # Trophic enrichment factor (ΔN)
    dn ~ 1,
    # Trophic Position (TP to be estimated)
    tp ~ 1,
    # Nonlinear model specification
    nl = TRUE
  )
  return(model)
}



