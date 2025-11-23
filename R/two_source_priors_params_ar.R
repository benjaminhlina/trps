#' Adjust Bayesian priors - Two Source Trophic Position with \eqn{\alpha_r}
#'
#' Create priors for trophic position using a two source model
#' with \eqn{\alpha_r} derived from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
#' and Heuvel et al. (2024) \doi{doi:10.1139/cjfas-2024-0028}.
#'
#' @param a (\eqn{\alpha}) exponent of the random variable for beta distribution.
#' Defaults to `1`. See beta distribution for more information.
#' @param b (\eqn{\beta}) shape parameter for beta distribution.
#' Defaults to `1`. See beta distribution for more information.
#' @param n1_sigma variance (\eqn{\sigma})for first
#' \eqn{\delta^{15}}N baseline. Defaults to `1`.
#' @param n1 mean (\eqn{\mu}) prior for first \eqn{\delta^{15}}N
#' baseline. Defaults to `8.0`.
#' @param n1_sigma variance (\eqn{\sigma})for first
#' \eqn{\delta^{15}}N baseline. Defaults to `1`.
#' @param n2 mean (\eqn{\mu}) prior for second \eqn{\delta^{15}}N
#' baseline. Defaults to `9.5`.
#' @param n2_sigma variance (\eqn{\sigma}) for second
#' \eqn{\delta^{15}}N  baseline. Defaults to `1`.
#' @param dn mean (\eqn{\mu}) prior value for \eqn{\Delta}N. Defaults to `3.4`.
#' @param dn_sigma variance (\eqn{\sigma}) for \eqn{\delta^{15}}N.
#' Defaults to `0.25`.
#' @param tp_lb lower bound for priors for trophic position. Defaults to `2`.
#' @param tp_ub upper bound for priors for  trophic position. Defaults to `10`.
#' @param sigma_lb lower bound for priors for \eqn{\sigma}. Defaults to `0`.
#' @param sigma_ub upper bound for priors for \eqn{\sigma}. Defaults to `10`.
#' @param bp logical value that controls whether informed baseline priors are
#' supplied to the model for \eqn{\delta^{15}}N baselines. Default is
#' `FALSE` meaning the model will use uninformed priors, however, the supplied
#' `data.frame` needs values for both \eqn{\delta^{15}}N baseline
#' (`n1` and `n2`)
#'
#' @details
#' We will use the following equations derived from
#' [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2) and Heuvel et al. (2024 \doi{doi:10.1139/cjfas-2024-0028}):
#'
#' \enumerate{
#'   \item \deqn{\alpha = (\delta^{13} C_c - \delta ^{13}C_2) /
#'   (\delta ^{13}C_1 - \delta ^{13}C_2)}
#'
#'   \item \deqn{\alpha = \alpha_r \times (\alpha_{max} - \alpha_{min}) + \alpha_{min}}
#'
#'   \item \deqn{\delta^{15}N = \Delta N \times (tp - \lambda_1) + n_1 \times \alpha_r + n_2 \times (1 - \alpha_r)}
#'
#'   \item \deqn{\delta^{15}N = \Delta N \times (tp - (\lambda_1 \times \alpha_r + \lambda_2 \times (1 - \alpha_r))) + n_1 \times \alpha_r + n_2 \times (1 - \alpha_r)}
#'    }
#'
#' **For equation 1)**
#'
#' This equation is a carbon source mixing model with
#' \eqn{\delta^{13}C_c} is the isotopic value for consumer,
#' \eqn{\delta^{13}C_1} is the mean isotopic value for baseline 1 and
#' \eqn{\delta^{13}C_2} is the mean isotopic value for baseline 2. This
#' equation is added to the data frame using `add_alpha()`.
#'
#' **For equation 2)**
#'
#' \eqn{\alpha} is being corrected using equations in
#' Heuvel et al. (2024) \doi{doi:10.1139/cjfas-2024-0028}
#' with \eqn{\alpha_r} being the corrected value (bound by 0 and 1),
#' \eqn{\alpha_{min}} is the minimum \eqn{\alpha} value calculated
#' using `add_alpha()` and \eqn{\alpha_{max}} being the maximum \eqn{\alpha}
#' value calculated using `add_alpha()`.
#'
#' **For equation 3) and 4)**
#'
#' \eqn{\delta^{15}}N are values from the consumer,
#' \eqn{n_1} is \eqn{\delta^{15}}N values of baseline 1, \eqn{n_2} is
#' \eqn{\delta^{15}}N values of baseline 2,
#' \eqn{\Delta}N is the trophic discrimination factor for N (i.e., mean of `3.4`),
#' tp is trophic position, and  \eqn{\lambda_1} and/or
#' \eqn{\lambda_2} are the trophic levels of
#' baselines which are often a primary consumer (e.g., `2` or `2.5`).
#'
#' This function allows the user to adjust the priors for the following variables
#' in the equation above:
#'
#' \itemize{
#'   \item The random exponent (\eqn{\alpha}; `a`)
#'   and shape parameters (\eqn{\beta}; `b`) for \eqn{\alpha_r}. This prior
#'   assumes a beta distribution.
#'   \item The mean (`n2`;\eqn{\mu}) and variance (`n2_sigma`; \eqn{\sigma}) of
#'   the second \eqn{\delta^{15}}N for a given baseline.
#'   This prior assumes a normal distributions.
#'   \item The mean (`c1`;\eqn{\mu}) and variance (`c1_sigma`; \eqn{\sigma}) of
#'   the second \eqn{\delta^{13}}C for a given baseline.
#'   This prior assumes a normal distributions.
#'   \item The mean (`c2`;\eqn{\mu}) and variance (`c2_sigma`; \eqn{\sigma}) of
#'   the second \eqn{\delta^{13}}C for a given baseline.
#'   This prior assumes a normal distributions.
#'   \item The mean (`dn`; \eqn{\mu}) and variance (`dn_sigma`; \eqn{\sigma}) of
#'   \eqn{\Delta}N (i.e, trophic enrichment factor).
#'   This prior assumes a normal distributions.
#'   \item The lower (`tp_lb`) and upper (`tp_ub`) bounds for priors for
#'   trophic position. This prior assumes a uniform distributions.
#'   \item The lower (`sigma_lb`) and upper (`sigma_ub`) bounds for
#'   variance (\eqn{\sigma}). This prior assumes a uniform distributions.
#'   }
#'
#' @return `stanvars` object to be used with `brms()` call.
#' @examples
#' two_source_priors_params_ar()
#' @import brms
#' @seealso [two_source_priors_ar()], [two_source_model_ar()], and [brms::brms()]
#' @export

two_source_priors_params_ar <- function(
    a = NULL,
    b = NULL,
    n1 = NULL,
    n1_sigma = NULL,
    n2 = NULL,
    n2_sigma = NULL,
    dn = NULL,
    dn_sigma = NULL,
    tp_lb = NULL,
    tp_ub = NULL,
    sigma_lb = NULL,
    sigma_ub = NULL,
    bp = FALSE) {

  check_logical(bp)

  # ----- set defaults -----
  defaults <- list(
    a = 1,
    b = 1,
    n1 = 8.0,
    n1_sigma = 1,
    n2 = 9.5,
    n2_sigma = 1,
    dn = 3.4,
    dn_sigma = 0.25,
    tp_lb = 2,
    tp_ub = 10,
    sigma_lb = 0,
    sigma_ub = 10
  )


  # ---- suplied -----
  supplied <- list(
    a = a,
    b = b,
    n1 = n1,
    n1_sigma = n1_sigma,
    n2 = n2,
    n2_sigma = n2_sigma,
    dn = dn,
    dn_sigma = dn_sigma,
    tp_lb = tp_lb,
    tp_ub = tp_ub,
    sigma_lb = sigma_lb,
    sigma_ub = sigma_ub
  )


  # ---- either set defaults or supplied ------
  params <- Map(function(x, d) if (is.null(x)) d else x, supplied, defaults)

  # check them
  lapply(names(params), function(nm) {
    check_numerical(params[[nm]], arg_name = nm)
  })
  # ----- put them in to function envo
  params_env <- list2env(params, parent = environment())

  priors_params <- if (isTRUE(bp)) {
    with(params_env, {
      brms::stanvar(a, name = "a") +
        brms::stanvar(b, "b") +
        brms::stanvar(n1, name = "n1") +
        brms::stanvar(n1_sigma, "n1_sigma") +
        brms::stanvar(n2, name = "n2") +
        brms::stanvar(n2_sigma, "n2_sigma") +
        brms::stanvar(dn, "dn") +
        brms::stanvar(dn_sigma, "dn_sigma") +
        brms::stanvar(tp_lb, "tp_lb") +
        brms::stanvar(tp_ub, "tp_ub") +
        brms::stanvar(sigma_lb, "sigma_lb") +
        brms::stanvar(sigma_ub, "sigma_ub")
    }
    )
  } else {
    with(params_env, {
      brms::stanvar(a, name = "a") +
        brms::stanvar(b, "b") +
        brms::stanvar(dn, "dn") +
        brms::stanvar(dn_sigma, "dn_sigma") +
        brms::stanvar(tp_lb, "tp_lb") +
        brms::stanvar(tp_ub, "tp_ub") +
        brms::stanvar(sigma_lb, "sigma_lb") +
        brms::stanvar(sigma_ub, "sigma_ub")
    }
    )
  }

  return(priors_params)
}
