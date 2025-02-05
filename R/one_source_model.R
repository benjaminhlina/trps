#' Bayesian model - One Source Trophic Position
#'
#' Bayesian model for trophic position using a one source model derived from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
#'
#' \deqn{d15n ~ n1 + dn * (tp - lambda)}
#'
#' where d15n are values from the consumer, n1 is d15n values of baseline 1,
#' \eqn{\Delta}is the trophic discrimination factor for N (i.e., mean of 3.4),
#' tp is trophic position, and lambda is the trophic level of baselines.
#'
#' Posterior distributions of of n1, dn, and tp will be estimated.
#'
#' @import brms
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

