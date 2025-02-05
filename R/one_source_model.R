#' Bayesian model - One Source Trophic Position
#'
#' Estimate trophic position using a one source model derived from [Post 2002]()
#'
#' @import brms
#' @export

one_source_model <- function() {
  brms::bf(
    # Likelihood function
    d15n ~ n1 + dn * (tp - l),
    # Baseline δ15N (to be estimated)
    n1 ~ 1,
    # Trophic enrichment factor (ΔN)
    dn ~ 1,
    # Trophic Position (TP to be estimated)
    tp ~ 1,
    # Nonlinear model specification
    nl = TRUE
  )
}

