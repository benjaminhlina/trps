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
#' need to be named `c1` and `c2`,
#' with the consumer's \eqn{\delta^{13}}C column named `d13c`.
#' @param abs logical that controls whether the absolute value is taken for the
#' numerator and denominator. Default is `FALSE` meaning that the absolute
#' value is not taken.
#'
#' @details
#' \deqn{\alpha = (\delta^{13}C_c - \delta ^{13}C_2) /
#' (\delta ^{13}C_1 - \delta ^{13}C_2)}
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

  check_data_frame(data)
  check_column_names(data)
  check_logical(abs)

  if (isFALSE(abs)) {
    dat <- data |>
      dplyr::mutate(
        alpha = (d13c - c2) / (c1 - c2),
        min_alpha = min(alpha, na.rm = TRUE),
        max_alpha = max(alpha, na.rm = TRUE)
      )
  }

  if (isTRUE(abs)) {
    dat <- data |>
      dplyr::mutate(
        alpha = abs((d13c - c2)) / abs((c1 - c2)),
        min_alpha = min(alpha, na.rm = TRUE),
        max_alpha = max(alpha, na.rm = TRUE)
      )
  }

  return(dat)
}
