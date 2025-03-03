

# tests for the one_source_priors
test_that("test two-source priors", {

  pri <- two_source_priors_ar(bp = TRUE)

  expected <- c(
    "beta(a, b)",
    "beta(a, b)",
    "beta(a, b)",
    "normal(n1, n1_sigma)",
    "normal(n2, n2_sigma)",
    "normal(c1, c1_sigma)",
    "normal(c2, c2_sigma)",
    "normal(dn, dn_sigma)",
    "uniform(tp_lb, tp_ub)",
    "uniform(sigma_lb, sigma_ub)",
    "uniform(sigma_lb, sigma_ub)",
    "uniform(sigma_lb, sigma_ub)"
  )

  results <- pri$prior


  expect_equal(results, expected)
}

)
# tests for the one_source_priors
test_that("test two-source priors without baseline", {

  pri <- two_source_priors_ar()

  expected <- c(
    "beta(a, b)",
    "beta(a, b)",
    "beta(a, b)",
    "normal(dn, dn_sigma)",
    "uniform(tp_lb, tp_ub)",
    "uniform(sigma_lb, sigma_ub)",
    "uniform(sigma_lb, sigma_ub)",
    "uniform(sigma_lb, sigma_ub)"
  )

  results <- pri$prior


  expect_equal(results, expected)
}

)
test_that("test two-source priors fail if given not logical", {

  expect_error(
    two_source_priors_ar(bp = "TRU"),
    regexp = "`bp` argument must be a logical value"
  )
}

)
