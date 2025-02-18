
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trps

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)[![R-CMD-check](https://github.com/benjaminhlina/trps/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/benjaminhlina/trps/actions/workflows/R-CMD-check.yaml)[![Codecov
test
coverage](https://codecov.io/gh/benjaminhlina/trps/graph/badge.svg)](https://app.codecov.io/gh/benjaminhlina/trps)
<!-- badges: end -->

{trps} leverages {brms} to use Bayesian frameworks to estimate trophic
position using equations found in [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and [Heuvel et
al. 2024](https://aslopubs.onlinelibrary.wiley.com/doi/full/10.1002/lno.12466)
for different species using stable isotope data.

{trps} is currently in active development with a one-source model
implemented and a two-source model and priors, but not prior parameters
currently implemented.

## Installation

You can install the development version of {trps} using the following:

``` r
devtools::install_github("benjaminhlina/trps")
library(trps)
```
