#' Bayesian priors - One Source Trophic Position
#'
#' Create priors for one source trophic position model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' @param bp logical value that controls whether informed priors are
#' supplied to the model for \eqn{\delta^{15}}N baseline. Default is
#' `FALSE` meaning the model will use uninformed priors, however, the supplied
#' `data.frame` needs values for \eqn{\delta^{15}}N  baseline (`n1`).
#'
#' @return returns priors for one source model to be used in a `brms()` call.
#'
#' @seealso [brms::brms()]
#' @examples
#' one_source_priors()
#'
#' @import brms
#' @export

one_source_priors <- function(bp = FALSE) {
  if (!(is.logical(bp))) {
    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }


  if (isFALSE(bp)) {
    #  set priors
    priors <- c(
      # Trophic enrichment factor (ΔN)
      brms::prior(normal(dn, dn_sigma),
        class = "b",
        coef = "Intercept",
        nlpar = "dn"
      ),
      # Trophic Position (tp)
      brms::prior(uniform(tp_lb, tp_ub),
        class = "b", nlpar = "tp",
        lb = tp_lb, ub = tp_ub
      ),
      # Standard deviation prior
      brms::prior(uniform(sigma_lb, sigma_ub), class = "sigma", ub = sigma_ub)
    )
  }

  if (isTRUE(bp)) {
    #  set priors
    priors <- c(
      # Baseline δ15N (n1)
      brms::prior(normal(n1, n1_sigma),
        class = "b",
        coef = "Intercept",
        nlpar = "n1"
      ),
      # Trophic enrichment factor (ΔN)
      brms::prior(normal(dn, dn_sigma),
        class = "b",
        # coef = "Intercept",
        nlpar = "dn", lb = 3, ub = 4
      ),
      # Trophic Position (tp)
      brms::prior(uniform(tp_lb, tp_ub),
        class = "b",
        nlpar = "tp",
        lb = tp_lb, ub = tp_ub
      ),
      # Standard deviation prior
      brms::prior(uniform(sigma_lb, sigma_ub), class = "sigma", ub = sigma_ub)
    )
  }



  return(priors)
}
