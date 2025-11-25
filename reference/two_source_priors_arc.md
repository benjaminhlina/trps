# Bayesian priors - Two Source Trophic Position with \\\alpha_r\\ and carbon mixing model

Create priors for trophic position using a two source model with
\\\alpha_r\\ derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and Heuvel et al. (2024)
[doi:10.1139/cjfas-2024-0028](https://doi.org/10.1139/cjfas-2024-0028) .

## Usage

``` r
two_source_priors_arc(bp = FALSE)
```

## Arguments

- bp:

  logical value that controls whether informed priors are supplied to
  the model for both \\\delta^{15}\\N and \\\delta^{15}\\C baselines.
  Default is `FALSE` meaning the model will use uninformed priors,
  however, the supplied `data.frame` needs values for both
  \\\delta^{15}\\N and \\\delta^{15}\\C baseline (`c1`, `c2`, `n1`, and
  `n2`).

## Value

returns priors for two source model to be used in a `brms()` call.

## See also

[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
two_source_priors_arc()
#>                        prior class coef group  resp dpar nlpar    lb       ub
#>                   beta(a, b)     b            alpha         ar     0        1
#>                   beta(a, b)     b             d13c         ar     0        1
#>                   beta(a, b)     b             d15n         ar     0        1
#>         normal(dn, dn_sigma)     b             d15n         dn  <NA>     <NA>
#>        uniform(tp_lb, tp_ub)     b             d15n         tp tp_lb    tp_ub
#>  uniform(sigma_lb, sigma_ub) sigma            alpha             <NA> sigma_ub
#>  uniform(sigma_lb, sigma_ub) sigma             d13c             <NA> sigma_ub
#>  uniform(sigma_lb, sigma_ub) sigma             d15n             <NA> sigma_ub
#>  tag source
#>        user
#>        user
#>        user
#>        user
#>        user
#>        user
#>        user
#>        user
```
