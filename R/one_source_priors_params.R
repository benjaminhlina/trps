#' Adjust Bayesian priors - One Source Trophic Position
#'
#' Adjust priors for one source trophic position model derived from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' @param n1 mean (\eqn{\mu}) prior for \eqn{\delta^{15}}N baseline.
#' Defaults to `9`.
#' @param n1_sigma variance (\eqn{\sigma}) for \eqn{\delta^{15}}N
#' baseline. Defaults to `1`.
#' @param dn mean (\eqn{\mu}) prior value for \eqn{\Delta}N. Defaults to `3.4`.
#' @param dn_sigma variance (\eqn{\sigma}) for \eqn{\delta^{15}}N.
#' Defaults to `0.5`.
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
#' This function allows the user to adjust the priors for the following variables
#' in the equation above:
#'
#' \itemize{
#'   \item The mean (`n1`; \eqn{\mu}) and variance (`n1_sigma`; \eqn{\sigma}) of
#'   \eqn{\delta^{15}}N for a given baseline (\eqn{\delta^{15}N_1}).
#'   This prior assumes a normal distribution.
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
    bp = FALSE
) {

  if (!(is.logical(bp))) {

    cli::cli_abort(c(
      "`bp` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }

  # ----- n1 -----

  # set n1 to 9
  if (is.null(n1)) {
    n1 <- 9
  }

  # create error message for n1 priros
  if  (!is.numeric(n1)) {
    cli::cli_abort(c(
      "`n1` argument must be a numerical value.",
      "i" = "Please provide a numerical value as a piror."
    ))
  }

  # set n1_sigma to 1
  if (is.null(n1_sigma)) {
    n1_sigma <- 1
  }
  # create error message for n1 priors
  if  (!is.numeric(n1_sigma)) {
    cli::cli_abort(c(
      "`n1_sigma` argument must be a numerical value",
      "i" = "Please provide a numerical value as a piror"
    ))
  }
  # create error message for dn priros


  if (is.null(dn)) {
    dn <- 3.4
  }

  if  (!is.numeric(dn)) {
    cli::cli_abort(c(
      "`dn` argument must be a numerical value",
      "i" = "Please provide a numerical value as a pirorr"
    ))
  }

  # create error message for dn priors
  if (is.null(dn_sigma)) {
    dn_sigma <- 0.5
  }

  if  (!is.numeric(dn_sigma)) {
    cli::cli_abort(c(
      "`dn_sigma` argument must be a numerical value",
      "i" = "Please provide a numerical value as a piror"
    ))
  }

  # ----- tp -----

  # set piror for tp
  if (is.null(tp_lb)) {
    tp_lb <- 2
  }

  # create error message for tp priros

  if  (!is.numeric(tp_lb)) {
    cli::cli_abort(c(
      "`tp_lb` argument must be a numerical value",
      "i" = "Please provide a numerical value as a piror"
    ))
  }

  if (is.null(tp_ub)) {
    tp_ub <- 10
  }

  # create error message for n1 priors
  if  (!is.numeric(tp_ub)) {
    cli::cli_abort(c(
      "`tp_ub` argument must be a numerical value",
      "i" = "Please provide a numerical value as a piror"
    ))
  }
  # ----- sigma -----

  # set piror for tp
  if (is.null(sigma_lb)) {
    sigma_lb <- 0
  }

  # create error message for tp priros

  if  (!is.numeric(sigma_lb)) {
    cli::cli_abort(c(
      "`sigma_lb` argument must be a numerical value",
      "i" = "Please provide a numerical value as a piror"
    ))
  }

  if (is.null(sigma_ub)) {
    sigma_ub <- 10
  }

  # create error message for n1 priors
  if  (!is.numeric(sigma_ub)) {
    cli::cli_abort(c(
      "`sigma_ub` argument must be a numerical value",
      "i" = "Please provide a numerical value as a piror"
    ))
  }


  if (isTRUE(bp)) {

    priors_params <- brms::stanvar(n1, name = 'n1') +
      brms::stanvar(n1_sigma, 'n1_sigma') +
      brms::stanvar(dn, 'dn') +
      brms::stanvar(dn_sigma, 'dn_sigma') +
      brms::stanvar(tp_lb, 'tp_lb') +
      brms::stanvar(tp_ub, 'tp_ub') +
      brms::stanvar(sigma_lb, 'sigma_lb') +
      brms::stanvar(sigma_ub, 'sigma_ub')

  }


  # ----- dn -----

  if (isFALSE(bp)) {

    # ----- set prirors -----

    priors_params <- brms::stanvar(dn, 'dn') +
      brms::stanvar(dn_sigma, 'dn_sigma') +
      brms::stanvar(tp_lb, 'tp_lb') +
      brms::stanvar(tp_ub, 'tp_ub') +
      brms::stanvar(sigma_lb, 'sigma_lb') +
      brms::stanvar(sigma_ub, 'sigma_ub')
  }

  return(priors_params)

}
