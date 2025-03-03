#' Stable isotope data for lake trout (consumer)
#'
#' Stable isotope data (\eqn{\delta^{13}}C and
#' \eqn{\delta^ {15}}N) for lake trout collected from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 30 rows and 6 variables
#'  \describe{
#'    \item{common_name}{name of the spcies (i.e., Lake Trout)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c}{observed values for \eqn{\delta^{13}}C}
#'    \item{d15n}{observed values for \eqn{\delta^{15}}N}
#' }
#'
"consumer_iso"

#' Stable isotope data for amphipods (baseline 1)
#'
#' Stable isotope data (\eqn{\delta^{13}}C and
#' \eqn{\delta^{15}}N) for amphipods collected from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 14 rows and 5 variables
#'  \describe{
#'    \item{common_name}{name of the spcies (i.e., Amphipoda)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c_b1}{observed values for \eqn{\delta^{13}}C}
#'    \item{d15n_b1}{observed values for \eqn{\delta^{15}}N}
#' }
#'
"baseline_1_iso"

#' Stable isotope data for dreissenids (baseline 2)
#'
#' Stable isotope data (\eqn{\delta^{13}}C and
#' \eqn{\delta^{15}}N) for dreissenid collected from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 12 rows and 5 variables
#'  \describe{
#'    \item{common_name}{name of the spcies (i.e., Dreissenids)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c_b2}{observed values for \eqn{\delta^{13}}C}
#'    \item{d15n_b2}{observed values for \eqn{\delta^{15}}N}
#' }
#'
"baseline_2_iso"

#' Stable isotope data for lake trout, amphipods (benthic baseline; baseline 1)
#' and dreissenids (pelagic baseline; baseline 2),
#'
#' Stable isotope data (\eqn{\delta^{13}}C and
#' \eqn{\delta ^{15}}N) for lake trout collected from two ecoregions in
#' Lake Ontario. Values of \eqn{\delta ^{13}}C and
#' \eqn{\delta ^{15}}N for a benthic baseline (amphipods; baseline 1;
#' `d13c_b1` and `d15n_b1`) and  pelagic baseline
#' (dreissenids; baseline 2; `d13c_b2` and `d15n_b2`) with the means for each
#' baseline calculated (`c1`,  `n1`, `c2`, and `n2`).
#'
#' @format `data.frame` containing 117 rows and 13 variables
#'  \describe{
#'    \item{id}{row id number}
#'    \item{common_name}{name of the spcies (i.e., Lake Trout)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c}{observed values for \eqn{\delta^{13}}C of consumer}
#'    \item{d15n}{observed values for \eqn{\delta^{15}}N of consumer}
#'    \item{d13c_b1}{observed values for \eqn{\delta^{13}}C of baseline 1}
#'    \item{d15n_b1}{observed values for \eqn{\delta^{15}}N of baseline 1}
#'    \item{d13c_b2}{observed values for \eqn{\delta^{13}}C of baseline 2}
#'    \item{d15n_b2}{observed values for \eqn{\delta^{15}}N of baseline 2}
#'    \item{c1}{mean values for \eqn{\delta^{13}}C of baseline 1}
#'    \item{n1}{mean values for \eqn{\delta^{15}}N of baseline 1}
#'    \item{c2}{mean values for \eqn{\delta^{13}}C of baseline 2}
#'    \item{n2}{mean values for \eqn{\delta^{15}}N of baseline 2}
#'
#' }
#'
"combined_iso"


