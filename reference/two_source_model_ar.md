# Bayesian model - Two Source Trophic Position with \\\alpha_r\\

Estimate trophic position using a two source model with \\\alpha_r\\
derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and Heuvel et al. (2024)
[doi:10.1139/cjfas-2024-0028](https://doi.org/10.1139/cjfas-2024-0028)
using a Bayesian framework.

## Usage

``` r
two_source_model_ar(bp = FALSE, lambda = NULL)
```

## Arguments

- bp:

  logical value that controls whether informed priors are supplied to
  the model for both \\\delta^{15}\\N baselines. Default is `FALSE`
  meaning the model will use uninformed priors, however, the supplied
  `data.frame` needs values for both \\\delta^{15}\\N baseline (`n1` and
  `n2`).

- lambda:

  numerical value, `1` or `2`, that controls whether one or two lambdas
  are used. See details for equations and when to use `1` or `2`.
  Defaults to `1`.

## Value

returns model structure for two source model to be used in a `brms()`
call.

## Details

We will use the following equations derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2),
[Vander Zanden and Vadeboncoeur
(2002)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012),
and Heuvel et al. (2024)
[doi:10.1139/cjfas-2024-0028](https://doi.org/10.1139/cjfas-2024-0028) :

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

This equation is a carbon use model derived from [Vander Zanden and
Vadeboncoeur
(2002)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012)
with \\\delta^{13}C_c\\ as the isotopic value for consumer,
\\\delta^{13}C_1\\ as the mean isotopic value for baseline 1 and
\\\delta^{13}C_2\\ as the mean isotopic value for baseline 2. This
equation is added to the data frame using
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

The data supplied to `brms()` when using baselines at the same trophic
level (`lambda` argument set to `1`) needs to have the following
variables, `d15n`, `n1`, `n2`, `l1` (\\\lambda_1\\) which is usually
`2`. If using baselines at different trophic levels (`lambda` argument
set to `2`) the data frame needs to have `l1` and `l2` with a numerical
value for each trophic level (e.g., `2` and `2.5`; \\\lambda_1\\ and
\\\lambda_2\\).

## See also

[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
two_source_model_ar()
#> alpha ~ ar * (max_alpha - min_alpha) + min_alpha 
#> ar ~ 1
#> d15n ~ dn * (tp - l1) + n1 * ar + n2 * (1 - ar) 
#> ar ~ 1
#> tp ~ 1
#> dn ~ 1
```
