#' Bayesian priors - One Source Trophic Position
#'
#' Create priors for one source trophic position model derived from [Post 2002]()
#'
#' @import brms
#' @export

one_source_priors <- function() {
  c(
    # Baseline δ15N (n1)
    prior(normal(9.83, 1), class = "b", coef = "Intercept", nlpar = "n1"),
    # Trophic enrichment factor (ΔN)
    prior(normal(3.4, 0.5), class = "b", coef = "Intercept", nlpar = "dn"),
    # Trophic Position (TP)
    prior(uniform(2, 10), class = "b", nlpar = "tp", lb = 2, ub = 10),
    # Standard deviation prior
    prior(uniform(0, 10), class = "sigma", ub = 10),
  )

}
