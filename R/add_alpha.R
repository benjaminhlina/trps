#' Calculate and add \eqn{\alpha}
#'
#' Calculate \eqn{\alpha} for a two source trophic position model using
#' equations from [Post 2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).
#'
#' \eqn{\alpha} = (\eqn{\delta}\eqn{^1}\eqn{^3}C[c] - \eqn{\delta}\eqn{^1}\eqn{^3}C[p]) /
#' (\eqn{\delta}\eqn{^1}\eqn{^3}C[b] - \eqn{\delta}\eqn{^1}\eqn{^3}C[p])
#'
#' where \eqn{\delta}\eqn{^1}\eqn{^3}C[c] is the isotopic value for consumer,
#' \eqn{\delta}\eqn{^1}\eqn{^3}C[p] is the mean isotopic value for pelagic
#' baseline, and \eqn{\delta}\eqn{^1}\eqn{^3}C[b] is the mean isotopic value
#' for benthic baseline.
#'
#' @param data data.frame of stable isotope samples with mean values for two
#' baselines. For aquatic ecosystems, baseline two needs to come
#' from a pelagic source, while baseline one needs to come from a
#' benthic source. Baseline \eqn{\delta}\eqn{^1}\eqn{^3}C columns
#' need to be named `c1` and `c2`, with the consumer's column named `d13c`.
#'
#' @returns a `data.frame` that has `alpha`, `min_alpha`, and `max_alpha` added.
#'
#' @examples
#' example_iso_tsn |>
#'   add_alpha()
#' @import dplyr
#' @export

add_alpha <- function(
    data
) {

  if (!(inherits(data, c("data.frame", "tibble",
                         "data.table")))) {
    cli::cli_abort(c(
      "`data` must be a data.frame, tibble, or data.table",
      "i" = "Please provide data.frame"
    ))

  }

  rv <- c("d13c", "c1", "c2")

  if(!all(rv %in% names(data))) {

    mv <- setdiff(rv, names(data))

    cli::cli_abort(c(
      "The data.frame is missing: {mv}",
      "i" = "Please provide {mv}"
    ))

  }


  dat <- data |>
    dplyr::mutate(
      alpha = (d13c - c2) / (c1 - c2),
      min_alpha = min(alpha, na.rm = TRUE),
      max_alpha = max(alpha, na.rm = TRUE)
    )


  return(dat)
}
