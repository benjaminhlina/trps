#' Bayesian model - Two Source Trophic Position
#'
#' Bayesian model for trophic position using a two source model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' \deqn{\delta ^1^5N = dn * (tp - \lambda + n1 * \alpha + n2 * (1 - \alpha))}
#'
#' \eqn{\delta}\eqn{^1}\eqn{^5}N are values from the consumer,
#' n1 is \eqn{\delta}\eqn{^1}\eqn{^5}N  values of baseline 1, n2 is
#' \eqn{\delta}\eqn{^1}\eqn{^5}N  values of baseline 2,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of 3.4),
#' tp is trophic position, and \eqn{\lambda} is the trophic level of
#' baselines which are often a primary consumer (e.g., 2).
#'
#' @param bp logical value that controls whether  priors are
#' supplied to the model for \eqn{\delta}\eqn{^1}\eqn{^5}N pelagic and benthic
#' baselines. Default is `FALSE` meaning the model will not be supplied priors,
#' however, the supplied `data.frame` needs values for
#' \eqn{\delta}\eqn{^1}\eqn{^5}N each baseline (`n1` and `n2`).
#'
#' @details
#' The data supplied to `brms()` needs to have the following variables, `d15n`
#' which is the \eqn{\delta}\eqn{^1}\eqn{^5}N of the consumers, `n1` which is
#' \eqn{\delta}\eqn{^1}\eqn{^5}N mean of baseline 1 (only needed if priors
#' aren't being supplied), `n2` which is \eqn{\delta}\eqn{^1}\eqn{^5}N
#' mean of baseline 2 (only needed if priors aren't being supplied), and
#' `lambda` which is usually `2 `otherwise `brms()` will error.
#'
#' @return returns model structure for two source model to be used in a
#' `brms()` call.
#' @examples
#' two_source_model()
#'
#' @seealso [brms::brms()]
#' @import brms
#' @export

two_source_model <- function(bp = FALSE) {
  if (!(is.logical(bp))) {

    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }

  if (isFALSE(bp)) {

  model <- brms::bf(
    # Likelihood function
    d15n ~ dn * (tp - lambda + n1 * alpha + n2 * (1 - alpha)),
    # Estimate alpha
    alpha ~ 1,
    # Estimate trophic position
    tp ~ 1,
    # Estimate delta_n
    dn ~ 1,
    # Non-linear model specification
    nl = TRUE
  )

  }

  if (isTRUE(bp)) {

  model <- brms::bf(
    # Likelihood function
    d15n ~ dn * (tp - lambda + n1 * alpha + n2 * (1 - alpha)),
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

  }
  return(model)
}
