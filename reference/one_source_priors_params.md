# Adjust Bayesian priors - One Source Trophic Position

Adjust priors for one source trophic position model derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).

## Usage

``` r
one_source_priors_params(
  n1 = NULL,
  n1_sigma = NULL,
  dn = NULL,
  dn_sigma = NULL,
  tp_lb = NULL,
  tp_ub = NULL,
  sigma_lb = NULL,
  sigma_ub = NULL,
  bp = FALSE
)
```

## Arguments

- n1:

  mean (\\\mu\\) prior for the mean \\\delta^{15}\\N baseline. Defaults
  to `9`.

- n1_sigma:

  variance (\\\sigma\\) for the mean \\\delta^{15}\\N baseline. Defaults
  to `1`.

- dn:

  mean (\\\mu\\) prior value for \\\Delta\\N. Defaults to `3.4`.

- dn_sigma:

  variance (\\\sigma\\) for \\\delta^{15}\\N. Defaults to `0.25`.

- tp_lb:

  lower bound prior for trophic position. Defaults to `2`.

- tp_ub:

  upper bound prior for trophic position. Defaults to `10`.

- sigma_lb:

  lower bound prior for \\\sigma\\. Defaults to `0`.

- sigma_ub:

  upper bound prior for \\\sigma\\. Defaults to `10`.

- bp:

  logical value that controls whether informed priors are supplied to
  the model for \\\delta^{15}\\N baseline. Default is `FALSE` meaning
  the model will use uninformed priors, however, the supplied
  `data.frame` needs values for \\\delta^{15}\\N baseline (`n1`).

## Value

`stanvars` object to be used with `brms()` call.

## Details

\$\$\delta^{15}N = \delta^{15} N_1 + \delta N \times (tp -
\lambda_1)\$\$

This function allows the user to adjust the priors for the following
variables in the equation above:

- The mean (`n1`; \\\mu\\) and variance (`n1_sigma`; \\\sigma\\) for the
  mean \\\delta^{15}\\N for a given baseline (\\\delta^{15}N_1\\).This
  prior assumes a normal distribution.

- The mean (`dn`; \\\mu\\) and variance (`dn_sigma`; \\\sigma\\) of
  \\\Delta\\N (i.e, trophic enrichment factor). This prior assumes a
  normal distribution.

- The lower (`tp_lb`) and upper (`tp_ub`) bounds for trophic position.
  This prior assumes a uniform distribution.

- The lower (`sigma_lb`) and upper (`sigma_ub`) bounds for variance
  (\\\sigma\\). This prior assumes a uniform distribution.

## See also

[`one_source_priors()`](https://benjaminhlina.github.io/trps/reference/one_source_priors.md),
[`one_source_model()`](https://benjaminhlina.github.io/trps/reference/one_source_model.md),
and
[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
one_source_priors_params()
#> $dn
#> $dn$name
#> [1] "dn"
#> 
#> $dn$sdata
#> [1] 3.4
#> 
#> $dn$scode
#> [1] "real dn;"
#> 
#> $dn$block
#> [1] "data"
#> 
#> $dn$position
#> [1] "start"
#> 
#> $dn$pll_args
#> [1] "data real dn"
#> 
#> 
#> $dn_sigma
#> $dn_sigma$name
#> [1] "dn_sigma"
#> 
#> $dn_sigma$sdata
#> [1] 0.25
#> 
#> $dn_sigma$scode
#> [1] "real dn_sigma;"
#> 
#> $dn_sigma$block
#> [1] "data"
#> 
#> $dn_sigma$position
#> [1] "start"
#> 
#> $dn_sigma$pll_args
#> [1] "data real dn_sigma"
#> 
#> 
#> $tp_lb
#> $tp_lb$name
#> [1] "tp_lb"
#> 
#> $tp_lb$sdata
#> [1] 2
#> 
#> $tp_lb$scode
#> [1] "real tp_lb;"
#> 
#> $tp_lb$block
#> [1] "data"
#> 
#> $tp_lb$position
#> [1] "start"
#> 
#> $tp_lb$pll_args
#> [1] "data real tp_lb"
#> 
#> 
#> $tp_ub
#> $tp_ub$name
#> [1] "tp_ub"
#> 
#> $tp_ub$sdata
#> [1] 10
#> 
#> $tp_ub$scode
#> [1] "real tp_ub;"
#> 
#> $tp_ub$block
#> [1] "data"
#> 
#> $tp_ub$position
#> [1] "start"
#> 
#> $tp_ub$pll_args
#> [1] "data real tp_ub"
#> 
#> 
#> $sigma_lb
#> $sigma_lb$name
#> [1] "sigma_lb"
#> 
#> $sigma_lb$sdata
#> [1] 0
#> 
#> $sigma_lb$scode
#> [1] "real sigma_lb;"
#> 
#> $sigma_lb$block
#> [1] "data"
#> 
#> $sigma_lb$position
#> [1] "start"
#> 
#> $sigma_lb$pll_args
#> [1] "data real sigma_lb"
#> 
#> 
#> $sigma_ub
#> $sigma_ub$name
#> [1] "sigma_ub"
#> 
#> $sigma_ub$sdata
#> [1] 10
#> 
#> $sigma_ub$scode
#> [1] "real sigma_ub;"
#> 
#> $sigma_ub$block
#> [1] "data"
#> 
#> $sigma_ub$position
#> [1] "start"
#> 
#> $sigma_ub$pll_args
#> [1] "data real sigma_ub"
#> 
#> 
#> attr(,"class")
#> [1] "stanvars"
```
