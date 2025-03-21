# tests for the one_source_priors
test_that("test one-source priors", {
  pri <- one_source_priors(bp = TRUE)

  expected <- c(
    "normal(n1, n1_sigma)",
    "normal(dn, dn_sigma)",
    "uniform(tp_lb, tp_ub)",
    "uniform(sigma_lb, sigma_ub)"
  )

  results <- pri$prior


  expect_equal(results, expected)
})
# tests for the one_source_priors
test_that("test one-source priors without baseline", {
  pri <- one_source_priors()

  expected <- c(
    "normal(dn, dn_sigma)",
    "uniform(tp_lb, tp_ub)",
    "uniform(sigma_lb, sigma_ub)"
  )

  results <- pri$prior


  expect_equal(results, expected)
})
test_that("test one-source priors fail if given not logical", {
  expect_error(
    one_source_priors(bp = "TRU"),
    regexp = "`bp` argument must be a logical value"
  )
})
