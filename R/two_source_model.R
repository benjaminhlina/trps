#' Bayesian model - Two Source Trophic Position
#'
#' Trophic position using a two source model derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2) using a Bayesian framework.
#'
#' @param bp logical value that controls whether informed priors are
#' supplied to the model for both \eqn{\delta^{15}}N and
#' \eqn{\delta^{15}}C baselines. Default is `FALSE` meaning the model will
#' use uninformed priors, however, the supplied `data.frame` needs values
#' for both \eqn{\delta^{15}}N and \eqn{\delta^{15}}C baseline
#' (`c1`, `c2`, `n1`, and `n2`).
#'
#' @param lambda numerical value, `1` or `2`, that controls whether one or
#' two \eqn{\lambda}s are used. See details for equations and when to use
#' `1` or `2`. Defaults to `1`.
#'
#' @details
#'
#' We will use the following equations from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2) and  [Vander Zanden and Vadeboncoeur (2002)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012):
#'
#'  \enumerate{
#'   \item \deqn{\delta^{13}C_c = \alpha \times (\delta ^{13}C_1 - \delta ^{13}C_2) +
#' \delta ^{13}C_2}
#'   \item \deqn{\delta^{15}N = \Delta N \times (tp - \lambda_1) +
#' n_1 \times \alpha + n_2 \times (1 - \alpha)}
#'    \item \deqn{\delta^{15}N = \Delta N \times (tp - (\lambda_1 \times \alpha +
#' \lambda_2 \times (1 - \alpha))) + n_1 \times \alpha +
#' n_2 \times (1 - \alpha)}
#' }
#'
#' **For equation 1)**
#'
#' is a carbon use model derived from [Vander Zanden and Vadeboncoeur (2002)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012)-9658%282002%29083%5B2152%3AFAIOBA%5D2.0.CO%3B2),\eqn{\delta^{13}C_c} is the isotopic value for consumer, \eqn{\alpha}
#' is the ratio between baselines and consumer \eqn{\delta^{13}C},
#' \eqn{\delta^{13}C_1} is the mean isotopic value for baseline 1,  and
#' \eqn{\delta^{13}C_2} is the mean isotopic value for baseline 2
#'
#' **For equation 2) and 3)**
#'
#' \eqn{\delta^{15}}N are values from the consumer,
#' \eqn{n_1} is \eqn{\delta^{15}}N values of baseline 1, \eqn{n_2} is
#' \eqn{\delta^{15}}N values of baseline 2,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of `3.4`),
#' tp is trophic position, and  \eqn{\lambda_1} and/or
#' \eqn{\lambda_2} are the trophic levels of
#' baselines which are often a primary consumer (e.g., `2` or `2.5`).
#'
#' The data supplied to `brms()` when using baselines at the same trophic level
#' (`lambda` argument set to `1`) needs to have the following variables, `d15n`,
#' `c1`, `c2`, `n1`, `n2`, `l1` (\eqn{\lambda_1}) which is usually `2`.
#' If using baselines at different trophic levels (`lambda` argument set to `2`)
#' the data frame needs to have `l1` and `l2` with a numerical value for
#' each trophic level (e.g.,`2` and `2.5`; \eqn{\lambda_1} and \eqn{\lambda_2}).
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
      model <-
        brms::bf(
          d13c ~ alpha * (c1 - c2) + c2,
          alpha ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          # Likelihood function
          d15n ~ dn * (tp - l1) + n1 * alpha + n2 * (1 - alpha),
          # Estimate alpha
          alpha ~ 1,
          # Estimate trophic position
          tp ~ 1,
          # Estimate delta_n
          dn ~ 1,
          # Non-linear model specification
          nl = TRUE
        ) +
        brms::set_rescor()
    }

    if (isTRUE(bp)) {
      model <- brms::bf(
        d13c ~ alpha * (c1 - c2) + c2,
        alpha ~ 1,
        # estimate c1
        c1 ~ 1,
        c2 ~ 1,
        nl = TRUE
      ) +
        brms::bf(
          # Likelihood function
          d15n ~ dn * (tp - l1) + n1 * alpha + n2 * (1 - alpha),
          # Estimate alpha
          alpha ~ 1,
          # estimate n1
          n1 ~ 1,
          n2 ~ 1,
          # Estimate trophic position
          tp ~ 1,
          # Estimate delta_n
          dn ~ 1,
          # Non-linear model specification
          nl = TRUE
        ) +
        brms::set_rescor()
    }
  }

  if (lambda == 2) {
    if (isFALSE(bp)) {
      model <- brms::bf(
        d13c ~ alpha * (c1 - c2) + c2,
        alpha ~ 1,
        nl = TRUE
      ) +
        brms::bf(
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
        ) +
        brms::set_rescor()
    }

    if (isTRUE(bp)) {
      model <- brms::bf(
        d13c ~ alpha * (c1 - c2) + c2,
        alpha ~ 1,
        # estimate c1
        c1 ~ 1,
        c2 ~ 1,
        nl = TRUE
      ) +
        brms::bf(
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
        ) +
        brms::set_rescor()
    }
  }
  return(model)
}
