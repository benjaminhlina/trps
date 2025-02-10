#' A `data.frame` of stable isotope data for lake trout used in one source model
#'
#' Stable isotope data (SIA) for \eqn{\delta}\eqn{^1}\eqn{^3}C and
#' \eqn{\delta}\eqn{^1}\eqn{^5}N for lake trout collected from an ecoregion in
#' Lake Ontario.
#'
#' @format `data.frame` containing 30 rows and 6 variables
#'  \describe{
#'    \item{id}{row id number}
#'    \item{common_name}{name of the spcies (i.e., Lake Trout)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c}{observed values for \eqn{\delta}\eqn{^1}\eqn{^3}C}
#'    \item{d15n}{observed values for \eqn{\delta}\eqn{^1}\eqn{^5}N}
#'    \item{lambda}{trophic position of baseline used in this data (i.e., 2)}
#' }
#'
"example_iso_os"

#' Stable isotope data for lake trout and dreissenids (baseline) used in
#' a one source model
#'
#' Stable isotope data (SIA) for \eqn{\delta}\eqn{^1}\eqn{^3}C and
#' \eqn{\delta}\eqn{^1}\eqn{^5}N for lake trout collected from an ecoregion in
#' Lake Ontario. The \eqn{\delta}\eqn{^1}\eqn{^3}C (`c1`) and
#' \eqn{\delta}\eqn{^1}\eqn{^5}N  (`n1`) values for dreissenid samples
#' from the same ecoregion.
#'
#'
#' @format `data.frame` containing 30 rows and 7 variables
#'  \describe{
#'    \item{common_name}{name of the spcies (i.e., Lake Trout)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c}{observed values for \eqn{\delta}\eqn{^1}\eqn{^3}C}
#'    \item{d15n}{observed values for \eqn{\delta}\eqn{^1}\eqn{^5}N}
#'    \item{lambda}{trophic position of baseline used in this data (i.e., 2)}
#'    \item{c1}{\eqn{\delta}\eqn{^1}\eqn{^3}C for baseline samples}
#'    \item{n1}{\eqn{\delta}\eqn{^1}\eqn{^5}N for baseline samples}
#' }
#'
"example_iso_osn"

#' Stable isotope data for lake trout, dreissenids (pelagic baseline), and
#' amphipods (benthic baseline) used in two source model
#'
#' Stable isotope data (SIA) for \eqn{\delta}\eqn{^1}\eqn{^3}C and
#' \eqn{\delta}\eqn{^1}\eqn{^5}N for lake trout collected from an ecoregion in
#' Lake Ontario. Values of \eqn{\delta}\eqn{^1}\eqn{^3}C and
#' \eqn{\delta}\eqn{^1}\eqn{^5}N for a pelagic baseline
#' (dreissenids; `c1` and `n1`) and a benthic baseline (amphipods;
#' `c2` and `n2`).
#'
#'
#' @format `data.frame` containing 87 rows and 10 variables
#'  \describe{
#'    \item{id}{row id number}
#'    \item{common_name}{name of the spcies (i.e., Lake Trout)}
#'    \item{ecoregion}{ecoregion where samples were collected}
#'    \item{d13c}{observed values for \eqn{\delta}\eqn{^1}\eqn{^3}C}
#'    \item{d15n}{observed values for \eqn{\delta}\eqn{^1}\eqn{^5}N}
#'    \item{c1}{mean \eqn{\delta}\eqn{^1}\eqn{^3}C for pelagic baseline samples}
#'    \item{n1}{mean \eqn{\delta}\eqn{^1}\eqn{^5}N for pelagic baseline samples}
#'    \item{c2}{mean \eqn{\delta}\eqn{^1}\eqn{^3}C for benthic baseline samples}
#'    \item{n2}{mean \eqn{\delta}\eqn{^1}\eqn{^5}N for benthic baseline samples}
#'    \item{lambda}{trophic position of baseline used in this data (i.e., 2)}
#' }
#'
"example_iso_tsn"
