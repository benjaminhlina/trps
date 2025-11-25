# Bayesian priors - One Source Trophic Position

Create priors for one source trophic position model derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2).

## Usage

``` r
one_source_priors(bp = FALSE)
```

## Arguments

- bp:

  logical value that controls whether informed priors are supplied to
  the model for \\\delta^{15}\\N baseline. Default is `FALSE` meaning
  the model will use uninformed priors, however, the supplied
  `data.frame` needs values for \\\delta^{15}\\N baseline (`n1`).

## Value

returns priors for one source model to be used in a `brms()` call.

## See also

[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
one_source_priors()
#>                        prior class      coef group resp dpar nlpar    lb
#>         normal(dn, dn_sigma)     b Intercept                    dn  <NA>
#>        uniform(tp_lb, tp_ub)     b                              tp tp_lb
#>  uniform(sigma_lb, sigma_ub) sigma                                  <NA>
#>        ub tag source
#>      <NA>       user
#>     tp_ub       user
#>  sigma_ub       user
```
