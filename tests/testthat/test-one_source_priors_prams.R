#  tests for the one_source_priors_prams


test_that("test one-source priors mean", {

  pri_pram <- one_source_priors_prams()

  expected_n1 <- 9

  results_n1 <- pri_pram$n1$sdata

  expect_equal(results_n1, expected_n1)

}
)


test_that("test one-source priors variance ", {

  pri_pram <- one_source_priors_prams()

  expected_n1_sigma <- 1

  results_n1_sigma <- pri_pram$n1_sigma$sdata

  expect_equal(results_n1_sigma, expected_n1_sigma)


}

)
