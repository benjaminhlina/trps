
<!-- README.md is generated from README.Rmd. Please edit that file -->

# trps <a href="https://benjaminhlina.github.io/trps/"><img src="man/figures/logo.png" align="right" height="138" alt="trps website" /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)[![trps
status
badge](https://benjaminhlina.r-universe.dev/trps/badges/version)](https://benjaminhlina.r-universe.dev/trps)[![R-CMD-check](https://github.com/benjaminhlina/trps/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/benjaminhlina/trps/actions/workflows/R-CMD-check.yaml)[![Codecov
test
coverage](https://codecov.io/gh/benjaminhlina/trps/graph/badge.svg)](https://app.codecov.io/gh/benjaminhlina/trps)
<!-- badges: end -->

Bayesian trophic position models using stan (pronounced trips) by
leveraging [{brms}](https://paulbuerkner.com/brms/). Equations for
trophic position models are derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and [Heuvel et
al. 2024](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028) and are
to be used with stable isotope data for different species.

## Progress

{trps} is currently in active development with the following progress:

- [x] a one-source model
  - [x] priors for a one-source model  
  - [x] parameters for priors for a one-source model  
- [x] a two-source model without different lambda
  - [x] priors for a two-source model without different lambda
  - [x] parameters for priors for a two-source model without different
    lambda
- [x] a two-source model with different lambda
  - [x] priors for two-source model w/ different lambda (priors are the
    same as a two-source)
  - [x] parameters for priors for a two-source model w/ different lambda
    (priors are the same as a two-source)
- \[\] a two-source carbon fractionation model
  - \[\] priors and parameters for priors
- [x] a two-source model with different lambdas and alpha corrected
  using [Heuvel et
  al. 2024](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028).
  - [x] priors
  - \[\] parameters for priors
- \[\] vignettes for each model type

## Installation

You can install the R-Universe version of {trps} using the following:

``` r
install.packages("trps", 
                  repos = c("https://benjaminhlina.r-universe.dev",
                            "https://cloud.r-project.org"))
```

You can install the development version of {trps} using the following:

``` r
devtools::install_github("benjaminhlina/trps")
library(trps)
```

## Vignettes

Info to come

## Citations

To cite this package please cite the following publications

- Post, D.M. 2002. Using Stable Isotopes to Estimate Trophic Position:
  Models, Methods, and Assumptions. Ecology 83(3): 703-718. doi:
  [10.2307/3071875](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).

- Heuvel, C., Zhao, Y., and Fisk, A.T. 2025. Food web structure across
  basins in Lake Erie, a large freshwater ecosystem. Canadian Journal of
  Fisheries and Aquatic Sciences 82:1-16. doi:
  [10.1139/cjfas-2024-0028](https://cdnsciencepub.com/doi/10.1139/cjfas-2024-0028).

- Hlina B.L. 2025. trps: Bayesian trophic position models using stan. R
  package version 0.1.0. <https://benjaminhlina.github.io/trps/>
