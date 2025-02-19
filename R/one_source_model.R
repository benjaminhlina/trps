#' Bayesian model - One Source Trophic Position
#'
#' Bayesian model for trophic position using a one source model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#
#' @param bp logical value that controls whether  priors are
#' supplied to the model for \eqn{\delta^{15}}N baseline. Default is
#' `FALSE` meaning the model will not be supplied priors, however, the supplied
#' `data.frame` needs values for \eqn{\delta^{15}}N baseline (`n1`).
#'
#'
#' @details
#'
#'  \deqn{\delta^{15}N = n1 + dn * (tp - \eqn{\lambda})}
#'
#' \eqn{\delta^{15}}N are values from the consumer,
#' n1 is \eqn{\delta^{15}}N values of baseline 1,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of 3.4),
#' tp is trophic position, and \eqn{\lambda} is the trophic level of baselines
#' which are often a primary consumer (e.g., 2).
#'
#' The data supplied to `brms()` needs to have the following variables `d15n`,
#'  `n1`, and `lambda` which is usually `2`.
#'
#' @return returns model structure for one source model to be used in a
#' `brms()` call.
#' @examples
#' one_source_model()
#'
#' @import brms
#' @seealso [brms::brms()]
#' @export

one_source_model <- function(bp = FALSE) {

  if (!(is.logical(bp))) {

    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }

  if (isFALSE(bp)) {
    model <- brms::bf(
      # Likelihood function
      d15n ~ n1 + dn * (tp - lambda),
      # Trophic enrichment factor (ΔN)
      dn ~ 1,
      # Trophic Position (TP to be estimated)
      tp ~ 1,
      # Nonlinear model specification
      nl = TRUE
    )

  }

  if (isTRUE(bp)) {
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
  }

  return(model)
}
