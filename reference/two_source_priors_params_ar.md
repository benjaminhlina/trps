# Adjust Bayesian priors - Two Source Trophic Position with \\\alpha_r\\

Create priors for trophic position using a two source model with
\\\alpha_r\\ derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and Heuvel et al. (2024)
[doi:10.1139/cjfas-2024-0028](https://doi.org/10.1139/cjfas-2024-0028) .

## Usage

``` r
two_source_priors_params_ar(
  a = NULL,
  b = NULL,
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

- n1:

  mean (\\\mu\\) prior for first \\\delta^{15}\\N baseline. Defaults to
  `8.0`.

- n1_sigma:

  variance (\\\sigma\\)for first \\\delta^{15}\\N baseline. Defaults to
  `1`.

- n2:

  mean (\\\mu\\) prior for second \\\delta^{15}\\N baseline. Defaults to
  `9.5`.

- n2_sigma:

  variance (\\\sigma\\) for second \\\delta^{15}\\N baseline. Defaults
  to `1`.

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

  logical value that controls whether informed baseline priors are
  supplied to the model for \\\delta^{15}\\N baselines. Default is
  `FALSE` meaning the model will use uninformed priors, however, the
  supplied `data.frame` needs values for both \\\delta^{15}\\N baseline
  (`n1` and `n2`)

## Value

`stanvars` object to be used with `brms()` call.

## Details

We will use the following equations derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and Heuvel et al. (2024
[doi:10.1139/cjfas-2024-0028](https://doi.org/10.1139/cjfas-2024-0028)
):

1.  \$\$\alpha = (\delta^{13} C_c - \delta ^{13}C_2) / (\delta
    ^{13}C_1 - \delta ^{13}C_2)\$\$

2.  \$\$\alpha = \alpha_r \times (\alpha\_{max} - \alpha\_{min}) +
    \alpha\_{min}\$\$

3.  \$\$\delta^{15}N = \Delta N \times (tp - \lambda_1) + n_1 \times
    \alpha_r + n_2 \times (1 - \alpha_r)\$\$

4.  \$\$\delta^{15}N = \Delta N \times (tp - (\lambda_1 \times
    \alpha_r + \lambda_2 \times (1 - \alpha_r))) + n_1 \times \alpha_r +
    n_2 \times (1 - \alpha_r)\$\$

**For equation 1)**

This equation is a carbon source mixing model with \\\delta^{13}C_c\\ is
the isotopic value for consumer, \\\delta^{13}C_1\\ is the mean isotopic
value for baseline 1 and \\\delta^{13}C_2\\ is the mean isotopic value
for baseline 2. This equation is added to the data frame using
[`add_alpha()`](https://benjaminhlina.github.io/trps/reference/add_alpha.md).

**For equation 2)**

\\\alpha\\ is being corrected using equations in Heuvel et al. (2024)
[doi:10.1139/cjfas-2024-0028](https://doi.org/10.1139/cjfas-2024-0028)
with \\\alpha_r\\ being the corrected value (bound by 0 and 1),
\\\alpha\_{min}\\ is the minimum \\\alpha\\ value calculated using
[`add_alpha()`](https://benjaminhlina.github.io/trps/reference/add_alpha.md)
and \\\alpha\_{max}\\ being the maximum \\\alpha\\ value calculated
using
[`add_alpha()`](https://benjaminhlina.github.io/trps/reference/add_alpha.md).

**For equation 3) and 4)**

\\\delta^{15}\\N are values from the consumer, \\n_1\\ is
\\\delta^{15}\\N values of baseline 1, \\n_2\\ is \\\delta^{15}\\N
values of baseline 2, \\\Delta\\N is the trophic discrimination factor
for N (i.e., mean of `3.4`), tp is trophic position, and \\\lambda_1\\
and/or \\\lambda_2\\ are the trophic levels of baselines which are often
a primary consumer (e.g., `2` or `2.5`).

This function allows the user to adjust the priors for the following
variables in the equation above:

- The random exponent (\\\alpha\\; `a`) and shape parameters (\\\beta\\;
  `b`) for \\\alpha_r\\. This prior assumes a beta distribution.

- The mean (`n2`;\\\mu\\) and variance (`n2_sigma`; \\\sigma\\) of the
  second \\\delta^{15}\\N for a given baseline. This prior assumes a
  normal distributions.

- The mean (`c1`;\\\mu\\) and variance (`c1_sigma`; \\\sigma\\) of the
  second \\\delta^{13}\\C for a given baseline. This prior assumes a
  normal distributions.

- The mean (`c2`;\\\mu\\) and variance (`c2_sigma`; \\\sigma\\) of the
  second \\\delta^{13}\\C for a given baseline. This prior assumes a
  normal distributions.

- The mean (`dn`; \\\mu\\) and variance (`dn_sigma`; \\\sigma\\) of
  \\\Delta\\N (i.e, trophic enrichment factor). This prior assumes a
  normal distributions.

- The lower (`tp_lb`) and upper (`tp_ub`) bounds for priors for trophic
  position. This prior assumes a uniform distributions.

- The lower (`sigma_lb`) and upper (`sigma_ub`) bounds for variance
  (\\\sigma\\). This prior assumes a uniform distributions.

## See also

[`two_source_priors_ar()`](https://benjaminhlina.github.io/trps/reference/two_source_priors_ar.md),
[`two_source_model_ar()`](https://benjaminhlina.github.io/trps/reference/two_source_model_ar.md),
and
[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
two_source_priors_params_ar()
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
