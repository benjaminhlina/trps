

# tests for the one_source_priors
test_that("test one-source priors", {

  pri <- one_source_priors()

  expected <- c("normal(n1, n1_sigma)",
                "normal(3.4, 0.5)",
                "uniform(2, 10)",
                "uniform(0, 10)"
                )

  results <- pri$prior


  expect_equal(results, expected)
}

)
