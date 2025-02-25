#' Bayesian model - Two Source Trophic Position
#'
#' Bayesian model for trophic position using a two source model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' @param bp logical value that controls whether  priors are
#' supplied to the model for \eqn{\delta^{15}}N pelagic and benthic
#' baselines. Default is `FALSE` meaning the model will not be supplied priors,
#' however, the supplied `data.frame` needs values for
#' \eqn{\delta^{15}}N each baseline (`n1` and `n2`).
#' @param lambda numerical value, `1` or `2`, that controls whether one or
#' two lambdas are used. See details for equations and when to use `1` or `2`.
#' Defaults to `1`.
#'
#' @details
#'
#' When `lambda` is set to `1`
#'
#' \deqn{\delta^{15}N = \Delta n \times (tp - \lambda) + n_1 \times \alpha + n_2 \times (1 - \alpha)}
#'
#' or
#'
#' When `lambda` is set to `2`
#'
#' \deqn{\delta^{15}N = \Delta n \times (tp - (\lambda_1 \times \alpha + \lambda_2 \times (1 - \alpha))) + n_1 \times \alpha + n_2 \times (1 - \alpha)}
#'
#' \eqn{\delta^{15}}N are values from the consumer,
#' \eqn{n_1} is \eqn{\delta^{15}}N values of baseline 1, \eqn{n_2} is
#' \eqn{\delta^{15}}N values of baseline 2,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of `3.4`),
#' tp is trophic position, and \eqn{\lambda} is the trophic level of
#' baselines which are often a primary consumer (e.g., `2`).
#'
#' The data supplied to `brms()` when using baselines at the same trophic level
#' (`lambda` argument set to `1`) needs to have the following variables, `d15n`,
#' `n1`, `n2`, `l` (\eqn{\lambda}) which is usually `2`.
#'
#' If using baselines at
#' different trophic levels (`lambda` argument set to `2`) the dataframe needs
#' to have `l1` and `l2` with a numerical value for each trophic level (e.g.,
#' `2` and `2.5`).
#'
#' @return returns model structure for two source model to be used in a
#' `brms()` call.
#' @examples
#' two_source_model()
#'
#' @seealso [brms::brms()]
#' @import brms
#' @export

two_source_model <- function(bp = FALSE,
                             lambda = NULL) {
  if (!(is.logical(bp))) {

    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }

  if (is.null(lambda)) {
    lambda <- 1
  }

  if (!(is.numeric(lambda)) || !(lambda %in% c(1, 2))) {
    cli::cli_abort(c(
      "`lambda` argument must be a numeric value and either `1` or `2`",
      "i" = "Please provide `1` or `2`"
    ))
  }

  if (lambda == 1) {
    if (isFALSE(bp)) {

      model <- brms::bf(
        # Likelihood function
        d15n ~ dn * (tp - l) + n1 * alpha + n2 * (1 - alpha),
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
        d15n ~ dn * (tp - l) + n1 * alpha + n2 * (1 - alpha),
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
  }

  if (lambda == 2) {
    if (isFALSE(bp)) {

      model <- brms::bf(
        # Likelihood function
        d15n ~ dn * (tp - (l1 * alpha + l2 * (1 - alpha))) + n1 * alpha + n2 * (1 - alpha),
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
        d15n ~ dn * (tp - (l1 * alpha + l2 * (1 - alpha))) + n1 * alpha + n2 * (1 - alpha),
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
  }
  return(model)
}
