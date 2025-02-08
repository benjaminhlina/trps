#' Bayesian model - Two Source Trophic Position
#'
#' Bayesian model for trophic position using a two source model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' \eqn{\delta}\eqn{^1}\eqn{^5}N = n1 * alpha + n2 * (1 - alpha) + dn * (tp - (\eqn{\lambda} * alpha + \eqn{\lambda} * (1 - alpha))
#'
#' \eqn{\delta}\eqn{^1}\eqn{^5}N are values from the consumer,
#' n1 is \eqn{\delta}\eqn{^1}\eqn{^5}N  values of baseline 1,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of 3.4),
#' tp is trophic position, and \eqn{\lambda} is the trophic level of baselines which are often a primary consumer (e.g., 2).
#'
#' Posterior distributions of of n1, dn, and tp will be estimated.
#'
#' @import brms
#' @export

two_source_model <- function() {
  model <- brms::bf(
    # Likelihood function
    d15n ~ dn * (tp - (lambda_p * (1 - alpha) + lambda_b * alpha) + n1 * alpha + n2 * (1 - alpha)),
    # Estimate alpha
    alpha ~ 1,
    # estimate
    n1 ~ 1,
    n2 ~ 1,
    # Estimate trophic position

    tp ~ 1,
    # Estimate delta_n
    dn ~ 1,
    # Non-linear model specification
    nl = TRUE
  )
  return(model)
}
