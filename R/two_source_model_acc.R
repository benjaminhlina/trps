#' Bayesian model - Two Source Trophic Position with \eqn{\alpha_c} and carbon source
#'
#' Bayesian model for trophic position using a two source model with \eqn{\alpha_c} and carbon source derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2) and [Heuvel et al. 2024](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028)
#'
#' @param bp logical value that controls whether  priors are
#' supplied to the model for \eqn{\delta}\eqn{^1}\eqn{^5}N pelagic and benthic
#' baselines. Default is `FALSE` meaning the model will not be supplied priors,
#' however, the supplied `data.frame` needs values for
#' \eqn{\delta}\eqn{^1}\eqn{^5}N each baseline (`n1` and `n2`).
#' @param lambda numerical value, `1` or `2`, that controls whether one or
#' two lambdas are used. See details for equations and when to use `1` or `2`.
#' Defaults to `1`.
#' @return returns model structure for two source model to be used in a
#' `brms()` call.
#' @examples
#' two_source_model_acc()
#'
#' @seealso [brms::brms()]
#' @import brms
#' @export

two_source_model_acc <- function(
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
          d13c ~ ac * (c1 - c2) + c2,
          ac ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          d15n ~ dn * (tp - l) + n1 * ac + n2 * (1 - ac),
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
          d13c ~ ac * (c1 - c2) + c2,
          ac ~ 1,
          c1 ~ 1,
          c2 ~ 1,
          nl = TRUE
        ) +
        brms::bf(
          d15n ~ dn * (tp - l) + n1 * ac + n2 * (1 - ac),
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
          d13c ~ ac * (c1 - c2) + c2,
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
          d13c ~ ac * (c1 - c2) + c2,
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

