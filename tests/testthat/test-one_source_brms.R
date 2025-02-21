library(brms)

combined_iso <- combined_iso[c(1:7)]
combined_iso$lambda <- 2

test_that("test one-source model with baseline priors ", {

  m <- brm(
    formula = one_source_model(bp = TRUE),
    data = combined_iso,
    prior = one_source_priors(bp = TRUE),
    family = gaussian(),
    chains = 2,
    iter = 4000,
    warmup = 1000,
    stanvars = one_source_priors_params(bp = TRUE),
    cores = 4,
    seed = 4,
    control = list(adapt_delta = 0.95),
  )


  expected <- c(8.980,
                3.440, 4.280,
                0.610,
                -5.810)

  results <- round(attr(m$fit@sim$samples[[1]], which = "mean_pars"), 2)


  expect_equal(results, expected)
}

)
test_that("test one-source model without baseline priors", {


  expect_warning(
    m1 <- brm(
      formula = one_source_model(),
      data = combined_iso,
      prior = one_source_priors(),
      family = gaussian(),
      chains = 2,
      iter = 4000,
      warmup = 1000,
      stanvars = one_source_priors_params(),
      cores = 4,
      seed = 4,
      control = list(adapt_delta = 0.95),
    )
  )

  expected_m1 <- c(3.340,
                  4.630,
                  1.000,
                  -5.13)

  results_m1 <- round(attr(m1$fit@sim$samples[[1]], which = "mean_pars"), 2)


  expect_equal(results_m1, expected_m1)
}

)
