# Adjust Bayesian priors - Two Source Trophic Position

Adjust priors for two source trophic position model derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).

## Usage

``` r
two_source_priors_params(
  a = NULL,
  b = NULL,
  c1 = NULL,
  c1_sigma = NULL,
  c2 = NULL,
  c2_sigma = NULL,
  n1 = NULL,
  n1_sigma = NULL,
  n2 = NULL,
  n2_sigma = NULL,
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

- a:

  (\\\alpha\\) exponent of the random variable for beta distribution.
  Defaults to `1`. See beta distribution for more information.

- b:

  (\\\beta\\) shape parameter for beta distribution. Defaults to `1`.
  See beta distribution for more information.

- c1:

  mean (\\\mu\\) prior for the mean of the first \\\delta^{13}\\C
  baseline. Defaults to `-21`.

- c1_sigma:

  variance (\\\sigma\\)for the mean of the first \\\delta^{13}\\C
  baseline. Defaults to `1`.

- c2:

  mean (\\\mu\\) prior for or the mean of the second \\\delta^{13}\\C
  baseline. Defaults to `-26`.

- c2_sigma:

  variance (\\\sigma\\)for the mean of the first \\\delta^{13}\\C
  baseline. Defaults to `1`.

- n1:

  mean (\\\mu\\) prior for the mean of the first \\\delta^{15}\\N
  baseline. Defaults to `8`.

- n1_sigma:

  variance (\\\sigma\\)for the mean of the first \\\delta^{15}\\N
  baseline. Defaults to `1`.

- n2:

  mean (\\\mu\\) prior for or the mean of the second \\\delta^{15}\\N
  baseline. Defaults to `9.5`.

- n2_sigma:

  variance (\\\sigma\\) for the mean of the second \\\delta^{15}\\N
  baseline. Defaults to `1`.

- dn:

  mean (\\\mu\\) prior value for \\\Delta\\N. Defaults to `3.4`.

- dn_sigma:

  variance (\\\sigma\\) for \\\delta^{15}\\N. Defaults to `0.25`.

- tp_lb:

  lower bound for priors for trophic position. Defaults to `2`.

- tp_ub:

  upper bound for priors for trophic position. Defaults to `10`.

- sigma_lb:

  lower bound for priors for \\\sigma\\. Defaults to `0`.

- sigma_ub:

  upper bound for priors for \\\sigma\\. Defaults to `10`.

- bp:

  logical value that controls whether informed priors are supplied to
  the model for both \\\delta^{15}\\N and \\\delta^{15}\\C baselines.
  Default is `FALSE` meaning the model will use uninformed priors,
  however, the supplied `data.frame` needs values for both
  \\\delta^{15}\\N and \\\delta^{15}\\C baseline (`c1`, `c2`, `n1`, and
  `n2`).

## Value

`stanvars` object to be used with `brms()` call.

## Details

We will use the following equations from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2):

1.  \$\$\delta^{13}C_c = \alpha \* (\delta ^{13}C_1 - \delta ^{13}C_2) +
    \delta ^{13}C_2\$\$

2.  \$\$\delta^{15}N = \Delta N \times (tp - \lambda_1) + n_1 \times
    \alpha + n_2 \times (1 - \alpha)\$\$

3.  \$\$\delta^{15}N = \Delta N \times (tp - (\lambda_1 \times \alpha +
    \lambda_2 \times (1 - \alpha))) + n_1 \times \alpha + n_2 \times
    (1 - \alpha)\$\$

- The random exponent (\\\alpha\\; `a`) and shape parameters (\\\beta\\;
  `b`) for \\\alpha\\. This prior assumes a beta distribution.

- The mean (`c1`; \\\mu\\) and variance (`c1_sigma`; \\\sigma\\) of the
  mean for the first \\\delta^{13}C\\ for a given baseline. This prior
  assumes a normal distributions.

- The mean (`c2`;\\\mu\\) and variance (`c2_sigma`; \\\sigma\\) of the
  mean for the second \\\delta^{13}C\\ for a given baseline. This prior
  assumes a normal distributions.

- The mean (`n1`; \\\mu\\) and variance (`n1_sigma`; \\\sigma\\) of the
  mean for the first \\\delta^{15}N\\ for a given baseline. This prior
  assumes a normal distributions.

- The mean (`n2`;\\\mu\\) and variance (`n2_sigma`; \\\sigma\\) of the
  mean for the second \\\delta^{15}\\N for a given baseline. This prior
  assumes a normal distributions.

- The mean (`dn`; \\\mu\\) and variance (`dn_sigma`; \\\sigma\\) of
  \\\Delta\\N (i.e, trophic enrichment factor). This prior assumes a
  normal distributions.

- The lower (`tp_lb`) and upper (`tp_ub`) bounds for priors for trophic
  position. This prior assumes a uniform distributions.

- The lower (`sigma_lb`) and upper (`sigma_ub`) bounds for variance
  (\\\sigma\\). This prior assumes a uniform distributions.

## See also

[`two_source_priors()`](https://benjaminhlina.github.io/trps/reference/two_source_priors.md),
[`two_source_model()`](https://benjaminhlina.github.io/trps/reference/two_source_model.md),
and
[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
two_source_priors_params()
#> $a
#> $a$name
#> [1] "a"
#> 
#> $a$sdata
#> [1] 1
#> 
#> $a$scode
#> [1] "real a;"
#> 
#> $a$block
#> [1] "data"
#> 
#> $a$position
#> [1] "start"
#> 
#> $a$pll_args
#> [1] "data real a"
#> 
#> 
#> $b
#> $b$name
#> [1] "b"
#> 
#> $b$sdata
#> [1] 1
#> 
#> $b$scode
#> [1] "real b;"
#> 
#> $b$block
#> [1] "data"
#> 
#> $b$position
#> [1] "start"
#> 
#> $b$pll_args
#> [1] "data real b"
#> 
#> 
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
