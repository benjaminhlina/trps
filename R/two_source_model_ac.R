#' Bayesian model - Two Source Trophic Position with \eqn{\alpha_c}
#'
#' Estimate trophic position using a two source model with \eqn{\alpha_c} derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2) and [Heuvel et al. 2024](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028) using a Bayesian framework.
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
#' We will use the following equations derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2) and [Heuvel et al. 2024](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028):
#'
#' \enumerate{
#'   \item \deqn{\alpha = (\delta^{13} C_c - \delta ^{13}C_2) /
#'   (\delta ^{13}C_1 - \delta ^{13}C_2)}
#'
#'   \item \deqn{\alpha = \alpha_c \times (\alpha_{max} - \alpha_{min}) + \alpha_{min}}
#'
#'   \item \deqn{\delta^{13}C = c_1 \times \alpha_c + c_2 \times (1 - \alpha_c)}
#'
#'   \item \deqn{\delta^{15}N = \Delta N \times (tp - \lambda_1) + n_1 \times \alpha_c + n_2 \times (1 - \alpha_c)}
#'
#'
#'   \item \deqn{\delta^{15}N = \Delta N \times (tp - (\lambda_1 \times \alpha_c + \lambda_2 \times (1 - \alpha_c))) + n_1 \times \alpha_c + n_2 \times (1 - \alpha_c)}
#'    }
#'
#' **For equation 1)**
#'
#' This equation is a carbon source mixing model with
#' \eqn{\delta^{13}C_c} is the isotopic value for consumer,
#' \eqn{\delta^{13}C_1} is the mean isotopic value for baseline 1 and
#' \eqn{\delta^{13}C_2} is the mean isotopic value for baseline 2.
#'
#' **For equation 2)**
#'
#' \eqn{\alpha} is being corrected using equations in
#' [Heuvel et al. 2024](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028).
#' with \eqn{\alpha_c} being the corrected value (bound by 0 and 1),
#' \eqn{\alpha_{min}} is the minimum \eqn{\alpha} value calculated
#' using `add_alpha()` and \eqn{\alpha_{max}} being the maximum \eqn{\alpha}
#' value calculated using `add_alpha()`.
#'
#' **For equation 3)**
#'
#' This equation is a carbon source mixing model with \eqn{\delta^{13}}C being
#' estimated using `c_1`, `c_2`  and \eqn{\alpha_c} calculated in equation 1.
#'
#' **For equation 4) and 5)**
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
#' `n1`, `n2`, `l1` (\eqn{\lambda_1}) which is usually `2`. If using baselines at
#' different trophic levels (`lambda` argument set to `2`) the data frame needs
#' to have `l1` and `l2` with a numerical value for each trophic level (e.g.,
#' `2` and `2.5`; \eqn{\lambda_1} and \eqn{\lambda_2}).
#'
#'
#' @return returns model structure for two source model to be used in a
#' `brms()` call.
#' @examples
#' two_source_model_ac()
#'
#' @seealso [brms::brms()]
#' @import brms
#' @export

two_source_model_ac <- function(
    bp = FALSE,
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

  # ---- singe lambda ----
  if (lambda == 1) {

    # ---- no baseline priors -----
    if (isFALSE(bp)) {
      model <- brms::bf(
        alpha ~ ac * (max_alpha - min_alpha) + min_alpha,
        ac ~ 1,
        nl = TRUE
      ) +
        brms::bf(
          d13c ~ (c1 * ac)  + (c2 * (1 - ac)),
          ac ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          d15n ~ dn * (tp - l1) + n1 * ac + n2 * (1 - ac),
          ac ~ 1,
          tp ~ 1,
          dn ~ 1,
          nl = TRUE
        ) +
        brms::set_rescor()
    }

    # ----- baseline priors -----
    if (isTRUE(bp)) {
      model <- brms::bf(
        alpha ~ ac * (max_alpha - min_alpha) + min_alpha,
        ac ~ 1,
        nl = TRUE
      ) +
        brms::bf(
          d13c ~ (c1 * ac)  + (c2 * (1 - ac)),
          ac ~ 1,
          c1 ~ 1,
          c2 ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          d15n ~ dn * (tp - l1) + n1 * ac + n2 * (1 - ac),
          ac ~ 1,
          n1 ~ 1,
          n2 ~ 1,
          tp ~ 1,
          dn ~ 1,
          nl = TRUE
        ) +
        brms::set_rescor()
    }

  }
  # ---- for two different lambda -----
  if (lambda == 2) {

    # ---- no baseline priors -----
    if (isFALSE(bp)) {
      model <- brms::bf(
        alpha ~ ac * (max_alpha - min_alpha) + min_alpha,
        ac ~ 1,
        nl = TRUE
      ) +
        brms::bf(
          d13c ~ (c1 * ac)  + (c2 * (1 - ac)),
          ac ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          d15n ~ dn * (tp - (l1 * ac + l2 * (1 - ac))) + n1 * ac + n2 * (1 - ac),
          ac ~ 1,
          tp ~ 1,
          dn ~ 1,
          nl = TRUE
        ) +
        brms::set_rescor()
    }
    # ----- baseline priors -----
    if (isTRUE(bp)) {

      model <- brms::bf(
        alpha ~ ac * (max_alpha - min_alpha) + min_alpha,
        ac ~ 1,
        nl = TRUE
      ) +
        brms::bf(
          d13c ~ (c1 * ac)  + (c2 * (1 - ac)),
          ac ~ 1,
          c1 ~ 1,
          c2 ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          d15n ~ dn * (tp - (l1 * ac + l2 * (1 - ac))) + n1 * ac + n2 * (1 - ac),
          ac ~ 1,
          n1 ~ 1,
          n2 ~ 1,
          tp ~ 1,
          dn ~ 1,
          nl = TRUE
        ) +
        brms::set_rescor()
    }
  }

  return(model)
}

