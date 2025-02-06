#' Bayesian priors - One Source Trophic Position
#'
#' Create priors for one source trophic position model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' @import brms
#' @export

one_source_priors <- function() {
  #  set priors
  priors <- c(
    # Baseline δ15N (n1)
    brms::prior(normal(n1, n1_sigma), class = "b", coef = "Intercept", nlpar = "n1"),
    # Trophic enrichment factor (ΔN)
    brms::prior(normal(3.4, 0.5), class = "b", coef = "Intercept", nlpar = "dn"),
    # Trophic Position (tp)
    brms::prior(uniform(2, 10), class = "b", nlpar = "tp",
          lb = 2, ub = 10),
    # Standard deviation prior
    brms::prior(uniform(0, 10), class = "sigma", ub = 10)
  )


  return(priors)
}

