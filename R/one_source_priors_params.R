#' Adjust Bayesian priors - One Source Trophic Position
#'
#' Adjust priors for one source trophic position model derived from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' @param n1 mean (\eqn{\mu}) prior for the mean \eqn{\delta^{15}}N baseline.
#' Defaults to `9`.
#' @param n1_sigma variance (\eqn{\sigma}) for the mean \eqn{\delta^{15}}N
#' baseline. Defaults to `1`.
#' @param dn mean (\eqn{\mu}) prior value for \eqn{\Delta}N. Defaults to `3.4`.
#' @param dn_sigma variance (\eqn{\sigma}) for \eqn{\delta^{15}}N.
#' Defaults to `0.25`.
#' @param tp_lb lower bound prior for trophic position. Defaults to `2`.
#' @param tp_ub upper bound prior for trophic position. Defaults to `10`.
#' @param sigma_lb lower bound prior for \eqn{\sigma}. Defaults to `0`.
#' @param sigma_ub upper bound prior for \eqn{\sigma}. Defaults to `10`.
#' @param bp logical value that controls whether informed priors are
#' supplied to the model for \eqn{\delta^{15}}N baseline. Default is
#' `FALSE` meaning the model will use uninformed priors, however, the supplied
#' `data.frame` needs values for \eqn{\delta^{15}}N baseline (`n1`).
#'
#' @details
#'
#' \deqn{\delta^{15}N = \delta^{15} N_1 + \delta N \times (tp - \lambda_1)}
#'
#' This function allows the user to adjust the priors for the following
#' variables in the equation above:
#'
#' \itemize{
#'   \item The mean (`n1`; \eqn{\mu}) and variance (`n1_sigma`; \eqn{\sigma})
#'   for the mean \eqn{\delta^{15}}N for a given baseline
#'   (\eqn{\delta^{15}N_1}).This prior assumes a normal distribution.
#'   \item The mean (`dn`; \eqn{\mu}) and variance (`dn_sigma`; \eqn{\sigma}) of
#'   \eqn{\Delta}N (i.e, trophic enrichment
#'   factor). This prior assumes a normal distribution.
#'   \item The lower (`tp_lb`) and upper (`tp_ub`) bounds for trophic position.
#'   This prior assumes a uniform distribution.
#'   \item The lower (`sigma_lb`) and upper (`sigma_ub`) bounds for
#'   variance (\eqn{\sigma}). This prior assumes a uniform distribution.
#'   }
#'
#' @return `stanvars` object to be used with `brms()` call.
#' @examples
#' one_source_priors_params()
#' @import brms
#' @seealso [one_source_priors()], [one_source_model()], and [brms::brms()]
#' @export

one_source_priors_params <- function(
    n1 = NULL,
    n1_sigma = NULL,
    dn = NULL,
    dn_sigma = NULL,
    tp_lb = NULL,
    tp_ub = NULL,
    sigma_lb = NULL,
    sigma_ub = NULL,
    bp = FALSE) {

  check_logical(bp)

  # ---- defualt values

  defaults <- default_priors("one_source")

  # supplied <- supplied_priors("one_source")
  supplied <- list(
    n1 = n1,
    n1_sigma = n1_sigma,
    dn = dn,
    dn_sigma = dn_sigma,
    tp_lb = tp_lb,
    tp_ub = tp_ub,
    sigma_lb = sigma_lb,
    sigma_ub = sigma_ub
  )


  params <- Map(function(x, d) if (is.null(x)) d else x, supplied, defaults)

  lapply(names(params), function(nm) {
    check_numerical(params[[nm]], arg_name = nm)
  })

  params_env <- list2env(params, parent = environment())

  # ---- set prior
  priors_params <- if (isTRUE(bp)) {
    with(params_env, {

      brms::stanvar(n1, name = "n1") +
        brms::stanvar(n1_sigma, "n1_sigma") +
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
