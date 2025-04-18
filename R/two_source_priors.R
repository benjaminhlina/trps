#' Bayesian priors - Two Source Trophic Position
#'
#' Create priors for two source trophic position model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' @param bp logical value that controls whether informed priors are
#' supplied to the model for both \eqn{\delta^{15}}N and
#' \eqn{\delta^{15}}C baselines. Default is `FALSE` meaning the model will
#' use uninformed priors, however, the supplied `data.frame` needs values
#' for both \eqn{\delta^{15}}N and \eqn{\delta^{15}}C baseline
#' (`c1`, `c2`, `n1`, and `n2`).
#'
#' @return returns priors for two source model to be used in a `brms()` call.
#'
#' @seealso [two_source_model()] and [brms::brms()]
#' @examples
#' two_source_priors()
#'
#' @import brms
#' @export

two_source_priors <- function(bp = FALSE) {
  if (!(is.logical(bp))) {
    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }


  if (isFALSE(bp)) {
    #  set priors
    priors <- c(

      # alpha priors
      brms::prior(beta(a, b), lb = 0, ub = 1, resp = "d13c", nlpar = "alpha"),
      brms::prior(beta(a, b), lb = 0, ub = 1, resp = "d15n", nlpar = "alpha"),
      # Trophic enrichment factor (ΔN)
      brms::prior(normal(dn, dn_sigma), resp = "d15n", nlpar = "dn"),
      # Trophic Position (tp)
      brms::prior(uniform(tp_lb, tp_ub),
        lb = tp_lb, ub = tp_ub, resp = "d15n",
        nlpar = "tp"
      ),
      # Standard deviation prior
      brms::prior(uniform(sigma_lb, sigma_ub),
        resp = "d13c",
        class = "sigma", ub = sigma_ub
      ),
      brms::prior(uniform(sigma_lb, sigma_ub),
        resp = "d15n",
        class = "sigma", ub = sigma_ub
      )
    )
  }

  if (isTRUE(bp)) {
    #  set priors
    priors <- c(
      # alpha priors
      brms::prior(beta(a, b), lb = 0, ub = 1, resp = "d13c", nlpar = "alpha"),
      brms::prior(beta(a, b), lb = 0, ub = 1, resp = "d15n", nlpar = "alpha"),
      # Baseline 1 δ13N (c1)
      brms::prior(normal(c1, c1_sigma),
        resp = "d13c",
        nlpar = "c1"
      ),
      # Baseline 2 δ13c (c2)
      brms::prior(normal(c2, c2_sigma),
        resp = "d13c",
        nlpar = "c2"
      ),
      # Baseline 1 δ15N (n1)
      brms::prior(normal(n1, n1_sigma),
        resp = "d15n",
        nlpar = "n1"
      ),
      # Baseline 2 δ15N (n2)
      brms::prior(normal(n2, n2_sigma),
        resp = "d15n",
        nlpar = "n2"
      ),
      # Trophic enrichment factor (ΔN)
      brms::prior(normal(dn, dn_sigma), resp = "d15n", nlpar = "dn"),
      # Trophic Position (tp)
      brms::prior(uniform(tp_lb, tp_ub),
        lb = tp_lb, ub = tp_ub, resp = "d15n",
        nlpar = "tp"
      ),
      # Standard deviation prior
      brms::prior(uniform(sigma_lb, sigma_ub),
        resp = "d13c",
        class = "sigma", ub = sigma_ub
      ),
      brms::prior(uniform(sigma_lb, sigma_ub),
        resp = "d15n",
        class = "sigma", ub = sigma_ub
      )
    )
  }



  return(priors)
}
