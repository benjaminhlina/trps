library(brms)

combined_iso$l <- 2
combined_iso$l1 <- 2
combined_iso$l2 <- 2.5

test_that("test two-source model with baseline priors ", {

  m <- brm(
    formula = two_source_model(bp = TRUE),
    data = combined_iso,
    prior = two_source_priors(bp = TRUE),
    family = gaussian(),
    chains = 2,
    iter = 10000,
    warmup = 1000,
    stanvars = two_source_priors_params(bp = TRUE),
    cores = 4,
    seed = 4,
    control = list(adapt_delta = 0.95),
  )


  expected <- c(
    0.500,
    8.980,
    8.990,
    4.290,
    3.440,
    0.610,
    -7.19
  )

  results <- round(attr(m$fit@sim$samples[[1]], which = "mean_pars"), 2)


  expect_equal(results, expected)
}

)
test_that("test two-source model without baseline priors", {


  expect_warning(
    m1 <- brm(
      formula = two_source_model(),
      data = combined_iso,
      prior = two_source_priors(),
      family = gaussian(),
      chains = 2,
      iter = 10000,
      warmup = 1000,
      stanvars = two_source_priors_params(),
      cores = 4,
      seed = 4,
      control = list(adapt_delta = 0.95),
    )
  )

  expected_m1<- c(0.790,
                  4.640,
                  3.310,
                  0.950,
                  -5.150)

  dput(round(attr(m1$fit@sim$samples[[1]], which = "mean_pars"), 2))
  results_m1 <- round(attr(m1$fit@sim$samples[[1]], which = "mean_pars"), 2)


  expect_equal(results_m1, expected_m1)
}

)
test_that("test two-source model with baseline priors ", {

  m <- brm(
    formula = two_source_model(bp = TRUE,
                               lambda = 2),
    data = combined_iso,
    prior = two_source_priors(bp = TRUE),
    family = gaussian(),
    chains = 2,
    iter = 10000,
    warmup = 1000,
    stanvars = two_source_priors_params(bp = TRUE),
    cores = 4,
    seed = 4,
    control = list(adapt_delta = 0.95),
  )


  expected <- c(
    0.500,
    9.010,
    9.000,
    4.520,
    3.450,
    0.610,
    -7.20
  )

  results <- round(attr(m$fit@sim$samples[[1]], which = "mean_pars"), 2)


  expect_equal(results, expected)
}

)
test_that("test two-source model without baseline priors", {


  expect_warning(
    m1 <- brm(
      formula = two_source_model(lambda = 2),
      data = combined_iso,
      prior = two_source_priors(),
      family = gaussian(),
      chains = 2,
      iter = 10000,
      warmup = 1000,
      stanvars = two_source_priors_params(),
      cores = 4,
      seed = 4,
      control = list(adapt_delta = 0.95),
    )
  )

  expected_m1<- c(0.790,
                  4.720,
                  3.33,
                  0.94,
                  -5.12)

  dput(round(attr(m1$fit@sim$samples[[1]], which = "mean_pars"), 2))
  results_m1 <- round(attr(m1$fit@sim$samples[[1]], which = "mean_pars"), 2)


  expect_equal(results_m1, expected_m1)
}

)
