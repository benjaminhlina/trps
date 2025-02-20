
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trps <a href="https://benjaminhlina.github.io/trps/"><img src="man/figures/logo.png" align="right" height="138" alt="trps website" /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)[![R-CMD-check](https://github.com/benjaminhlina/trps/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/benjaminhlina/trps/actions/workflows/R-CMD-check.yaml)[![Codecov
test
coverage](https://codecov.io/gh/benjaminhlina/trps/graph/badge.svg)](https://app.codecov.io/gh/benjaminhlina/trps)
<!-- badges: end -->

{trps} trophic position models using stan through
[{brms}](https://paulbuerkner.com/brms/) to use Bayesian frameworks.
Equations for trophic position models are derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and [Heuvel et
al. 2024](https://aslopubs.onlinelibrary.wiley.com/doi/full/10.1002/lno.12466)
and are to be used with stable isotope data for different species.

{trps} is currently in active development with the following progress:

- [x] a one-source model
  - [x] priors for a one-source model  
  - [x] parameters for priors for a one-source model  
- [x] a two-source model without different lambda
  - [x] priors for a two-source model without different lambda
  - [x] parameters for priors for a two-source model without different
    lambda
- \[\] a two-source model with different lambda
  - \[\] priors for a two-source model with different lambda
  - \[\] parameters for priors for a two-source model with different
    lambda
- \[\] a two-source carbon fractionation model
  - \[\] priors and parameters for priors
- \[\] a two-source model with different lambdas and alpha corrected
  using [Heuvel et
  al. 2024](https://aslopubs.onlinelibrary.wiley.com/doi/full/10.1002/lno.12466).
  - \[\] priors and parameters for priors
- \[\] vignettes for each model type

## Installation

You can install the development version of {trps} using the following:

``` r
devtools::install_github("benjaminhlina/trps")
library(trps)
```
