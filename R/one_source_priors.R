#' Bayesian priors - One Source Trophic Position
#'
#' Create priors for one source trophic position model derived from [Post 2002]()
#'
#' @param n1 mean prior value for \eqn{\delta}^15 N for baseline used in the model.
#' Defaults to 9.
#' @param n1_sigma variance of n1 prior value for \eqn{\delta}^15 N for baseline used in the model.
#' Defaults to 1.
#'
#' @import brms
#' @export

one_source_priors <- function(
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

  # set n1_sigma to 9
  if (is.null(n1_sigma)) {
    n1_sigma <- 1
  }
  # create error message for n1 priros
  if  (!is.numeric(n1_sigma)) {
    cli::cli_abort(c(
      "`n1_sigma` argument must be a numerical value",
      "i" = "Please provide a numerical value for n1_sigma"
    ))
  }



  #  set priors
  priors <- c(
    # Baseline δ15N (n1)
    brms::prior(normal(n1, n1_sigma), class = "b", coef = "Intercept", nlpar = "n1"),
    # Trophic enrichment factor (ΔN)
    brms::prior(normal(3.4, 0.5), class = "b", coef = "Intercept", nlpar = "dn"),
    # Trophic Position (TP)
    brms::prior(uniform(2, 10), class = "b", nlpar = "tp",
          lb = 2, ub = 10),
    # Standard deviation prior
    brms::prior(uniform(0, 10), class = "sigma", ub = 10),
  )

  return(priors)
}
