#' Stable isotope data for lake trout (consumer)
#'
#' Stable isotope data (SIA) for \eqn{\delta^{13}}C and
#' \eqn{\delta^ {15}}N for lake trout collected from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 30 rows and 6 variables
#'  \describe{
#'    \item{id}{row id number}
#'    \item{common_name}{name of the spcies (i.e., Lake Trout)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c}{observed values for \eqn{\delta^{13}C}}
#'    \item{d15n}{observed values for \eqn{\delta^{15}N}}
#' }
#'
"consumer_iso"

#' Stable isotope data for dreissenids (baseline 1)
#'
#' Stable isotope data (SIA) for \eqn{\delta^{13}}C and
#' \eqn{\delta^{15}}N dreissenid samples from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 12 rows and 5 variables
##'  \describe{
#'    \item{id}{row id number}
#'    \item{common_name}{name of the spcies (i.e., Dreissenids)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{c1}{observed values for \eqn{\delta^{13}C}}
#'    \item{n1}{observed values for \eqn{\delta^{13}C}}
#' }
#'
"baseline_1_iso"

#' Stable isotope data for amphipods (baseline 2)
#'
#' Stable isotope data (SIA) for \eqn{\delta^{13}}C and
#' \eqn{\delta^{15}}N amphipods samples from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 14 rows and 5 variables
##'  \describe{
#'    \item{id}{row id number}
#'    \item{common_name}{name of the spcies (i.e., Amphipoda)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{c2}{observed values for \eqn{\delta^{13}C}}
#'    \item{n2}{observed values for \eqn{\delta^{13}C}}
#' }
#'
"baseline_2_iso"

#' Stable isotope data for lake trout, dreissenids (pelagic baseline), and
#' amphipods (benthic baseline) used in two source model
#'
#' Stable isotope data (SIA) for \eqn{\delta^{13}}C and
#' \eqn{\delta ^{15}}N for lake trout collected from an ecoregion in
#' Lake Ontario. Values of \eqn{\delta ^{13}} C and
#' \eqn{\delta ^{1}}N for a pelagic baseline
#' (dreissenids; `c1` and `n1`) and a benthic baseline (amphipods;
#' `c2` and `n2`) with the means for each calcualted (`c1_mean`, `c2_mean`,
#' `n1_mean`, `n2_mean`).
#'
"combined_iso"


