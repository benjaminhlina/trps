#  tests for the one_source_priors_prams


test_that("test one-source priors mean", {

  pri_pram <- one_source_priors_prams()

  expected_n1 <- 9

  results_n1 <- pri_pram$n1$sdata

  expect_equal(results_n1, expected_n1)

}
)

#  tests for the one_source_priors_prams fails when given not. a numeric


test_that("test one-source priors fails n1", {

  expect_error(one_source_priors_prams(n1 = "test"),
               regexp = "`n1` argument must be a numerical value")


}
)


test_that("test priors fails n1_sigam ", {

  expect_error(one_source_priors_prams(n1_sigma = "test"),
               regexp = "`n1_sigma` argument must be a numerical value"
               )



}

)
