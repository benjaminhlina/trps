#' Calculate and add \eqn{\alpha}
#'
#' Calculate \eqn{\alpha} for a two source trophic position model using
#' equations from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#'
#' @param data `data.frame` of stable isotope samples with mean values for two
#' baselines. For aquatic ecosystems, baseline one needs to come from a
#' benthic source and baseline two needs to come
#' from a pelagic source. Baseline \eqn{\delta^{13}}C columns
#' need to be named `c1_mean` and `c2_mean`,
#' with the consumer's \eqn{\delta^{13}}C column named `d13c`.
#' @param abs logical that controls whether the absolute value is taken for the
#' numerator and denominator. Default is `FALSE` meaning that the absolute
#' value is not taken.
#'
#' @details
#' \deqn{\alpha = (\delta^{13}C_c - \delta ^{13}C_2) /
#' (\delta ^{13}C_1 - \delta ^{13}C_1)}
#'
#' where \eqn{\delta^{13}C_c} is the isotopic value for consumer,
#' \eqn{\delta^{13}C_1} is the mean isotopic value for baseline 1 and
#' \eqn{\delta^{13}C_2} is the mean isotopic value for baseline 2.
#'
#' @returns a `data.frame` that has `alpha`, `min_alpha`, and `max_alpha` added.
#'
#' @examples
#' combined_iso |>
#'   add_alpha()
#' @import dplyr
#' @export

add_alpha <- function(
    data,
    abs = FALSE
) {

  if (!(inherits(data, c("data.frame", "tibble",
                         "data.table")))) {
    cli::cli_abort(c(
      "`data` must be a data.frame, tibble, or data.table",
      "i" = "Please provide data.frame"
    ))

  }

  rv <- c("d13c", "c1_mean", "c2_mean")

  if(!all(rv %in% names(data))) {

    mv <- setdiff(rv, names(data))

    cli::cli_abort(c(
      "The data.frame is missing: {mv}",
      "i" = "Please provide {mv}"
    ))

  }



  if (!(is.logical(abs))) {

    cli::cli_abort(c(
      "`abs` argument must be a logical value",
      "i" = "Please provide TRUE or FALSE"
    ))
  }

  if(isFALSE(abs)) {


  dat <- data |>
    dplyr::mutate(
      alpha = (d13c - c2_mean) / (c1_mean - c2_mean),
      min_alpha = min(alpha, na.rm = TRUE),
      max_alpha = max(alpha, na.rm = TRUE)
    )

  }

  if(isTRUE(abs)) {

  dat <- data |>
    dplyr::mutate(
      alpha = abs((d13c - c2_mean)) / abs((c1_mean - c2_mean)),
      min_alpha = min(alpha, na.rm = TRUE),
      max_alpha = max(alpha, na.rm = TRUE)
    )

  }

  return(dat)
}
