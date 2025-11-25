# Bayesian model - Two Source Trophic Position

Trophic position using a two source model derived from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
using a Bayesian framework.

## Usage

``` r
two_source_model(bp = FALSE, lambda = NULL)
```

## Arguments

- bp:

  logical value that controls whether informed priors are supplied to
  the model for both \\\delta^{15}\\N and \\\delta^{15}\\C baselines.
  Default is `FALSE` meaning the model will use uninformed priors,
  however, the supplied `data.frame` needs values for both
  \\\delta^{15}\\N and \\\delta^{15}\\C baseline (`c1`, `c2`, `n1`, and
  `n2`).

- lambda:

  numerical value, `1` or `2`, that controls whether one or two
  \\\lambda\\s are used. See details for equations and when to use `1`
  or `2`. Defaults to `1`.

## Value

returns model structure for two source model to be used in a `brms()`
call.

## Details

We will use the following equations from [Post
2002](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012-9658%282002%29083%5B0703%3AUSITET%5D2.0.CO%3B2)
and [Vander Zanden and Vadeboncoeur
(2002)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012):

1.  \$\$\delta^{13}C_c = \alpha \times (\delta ^{13}C_1 - \delta
    ^{13}C_2) + \delta ^{13}C_2\$\$

2.  \$\$\delta^{15}N = \Delta N \times (tp - \lambda_1) + n_1 \times
    \alpha + n_2 \times (1 - \alpha)\$\$

3.  \$\$\delta^{15}N = \Delta N \times (tp - (\lambda_1 \times \alpha +
    \lambda_2 \times (1 - \alpha))) + n_1 \times \alpha + n_2 \times
    (1 - \alpha)\$\$

**For equation 1)**

is a carbon use model derived from [Vander Zanden and Vadeboncoeur
(2002)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/0012)-9658%282002%29083%5B2152%3AFAIOBA%5D2.0.CO%3B2),\\\delta^{13}C_c\\
is the isotopic value for consumer, \\\alpha\\ is the ratio between
baselines and consumer \\\delta^{13}C\\, \\\delta^{13}C_1\\ is the mean
isotopic value for baseline 1, and \\\delta^{13}C_2\\ is the mean
isotopic value for baseline 2

**For equation 2) and 3)**

\\\delta^{15}\\N are values from the consumer, \\n_1\\ is
\\\delta^{15}\\N values of baseline 1, \\n_2\\ is \\\delta^{15}\\N
values of baseline 2, \\\Delta\\N is the trophic discrimination factor
for N (i.e., mean of `3.4`), tp is trophic position, and \\\lambda_1\\
and/or \\\lambda_2\\ are the trophic levels of baselines which are often
a primary consumer (e.g., `2` or `2.5`).

The data supplied to `brms()` when using baselines at the same trophic
level (`lambda` argument set to `1`) needs to have the following
variables, `d15n`, `c1`, `c2`, `n1`, `n2`, `l1` (\\\lambda_1\\) which is
usually `2`. If using baselines at different trophic levels (`lambda`
argument set to `2`) the data frame needs to have `l1` and `l2` with a
numerical value for each trophic level (e.g.,`2` and `2.5`;
\\\lambda_1\\ and \\\lambda_2\\).

## See also

[`brms::brms()`](https://paulbuerkner.com/brms/reference/brms-package.html)

## Examples

``` r
two_source_model()
#> d13c ~ alpha * (c1 - c2) + c2 
#> alpha ~ 1
#> d15n ~ dn * (tp - l1) + n1 * alpha + n2 * (1 - alpha) 
#> alpha ~ 1
#> tp ~ 1
#> dn ~ 1
```
