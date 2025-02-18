#  tests for the two_source_priors_prams


test_that("test two-source priors n1", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_n1 <- 9

  results_n1 <- pri_pram$n1$sdata

  expect_equal(results_n1, expected_n1)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors fails n1", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       n1 = "test"),
               regexp = "`n1` argument must be a numerical value")


}
)


test_that("test two-source priors n1", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_n2 <- 9

  results_n2 <- pri_pram$n2$sdata

  expect_equal(results_n2, expected_n2)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors fails n2", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       n2 = "test"),
               regexp = "`n2` argument must be a numerical value")


}
)


test_that("test two-source priors sigma", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_n2_sigma <- 1

  results_n2_sigma <- pri_pram$n2_sigma$sdata

  expect_equal(results_n2_sigma, expected_n2_sigma)

}
)


test_that("test priors fails n2_sigam ", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       n2_sigma = "test"),
               regexp = "`n2_sigma` argument must be a numerical value"
  )



}

)
#  tests for the two_source_priors_prams


test_that("test two-source priors dn", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_dn <- 3.4

  results_dn <- pri_pram$dn$sdata

  expect_equal(results_dn, expected_dn)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors fails dn", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       dn = "test"),
               regexp = "`dn` argument must be a numerical value")


}
)



test_that("test two-source priors dn_sigma", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_dn_sigma <- 0.5

  results_dn_sigma <- pri_pram$dn_sigma$sdata

  expect_equal(results_dn_sigma, expected_dn_sigma)

}
)


test_that("test priors fails dn_sigam ", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       dn_sigma = "test"),
               regexp = "`dn_sigma` argument must be a numerical value"
  )



}

)

# ---- tp ----

test_that("test two-source priors tp_lb", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_tp_lb <- 2

  results_tp_lb <- pri_pram$tp_lb$sdata

  expect_equal(results_tp_lb, expected_tp_lb)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors tp_lb", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       tp_lb = "test"),
               regexp = "`tp_lb` argument must be a numerical value")


}
)



test_that("test two-source priors tp_ub", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_tp_ub <- 10

  results_tp_ub <- pri_pram$tp_ub$sdata

  expect_equal(results_tp_ub, expected_tp_ub)

}
)


test_that("test priors fails tp_ub ", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       tp_ub = "test"),
               regexp = "`tp_ub` argument must be a numerical value"
  )



}

)
test_that("test two-source priors sigma_lb", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_sigma_lb <- 0

  results_sigma_lb <- pri_pram$sigma_lb$sdata

  expect_equal(results_sigma_lb, expected_sigma_lb)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors sigma_lb", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       sigma_lb = "test"),
               regexp = "`sigma_lb` argument must be a numerical value")


}
)



test_that("test two-source priors sigma_ub", {

  pri_pram <- two_source_priors_prams(bp = TRUE)
  expected_sigma_ub <- 10

  results_sigma_ub <- pri_pram$sigma_ub$sdata

  expect_equal(results_sigma_ub, expected_sigma_ub)

}
)


test_that("test priors fails sigma_ub ", {

  expect_error(two_source_priors_prams(bp = TRUE,
                                       sigma_ub = "test"),
               regexp = "`sigma_ub` argument must be a numerical value"
  )



}

)

test_that("test priors fails test bp fails ", {

  expect_error(two_source_priors_prams(bp = "TRUE"),
               regexp = "`bp` argument must be a logical value"
  )
}
)


test_that("test two-source priors dn", {

  pri_pram <- two_source_priors_prams()
  expected_dn <- 3.4

  results_dn <- pri_pram$dn$sdata

  expect_equal(results_dn, expected_dn)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors fails dn", {

  expect_error(two_source_priors_prams(
                                       dn = "test"),
               regexp = "`dn` argument must be a numerical value")


}
)



test_that("test two-source priors dn_sigma", {

  pri_pram <- two_source_priors_prams()
  expected_dn_sigma <- 0.5

  results_dn_sigma <- pri_pram$dn_sigma$sdata

  expect_equal(results_dn_sigma, expected_dn_sigma)

}
)


test_that("test priors fails dn_sigam ", {

  expect_error(two_source_priors_prams(,
                                       dn_sigma = "test"),
               regexp = "`dn_sigma` argument must be a numerical value"
  )



}

)

# ---- tp ----

test_that("test two-source priors tp_lb", {

  pri_pram <- two_source_priors_prams()
  expected_tp_lb <- 2

  results_tp_lb <- pri_pram$tp_lb$sdata

  expect_equal(results_tp_lb, expected_tp_lb)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors tp_lb", {

  expect_error(two_source_priors_prams(
                                       tp_lb = "test"),
               regexp = "`tp_lb` argument must be a numerical value")


}
)



test_that("test two-source priors tp_ub", {

  pri_pram <- two_source_priors_prams()
  expected_tp_ub <- 10

  results_tp_ub <- pri_pram$tp_ub$sdata

  expect_equal(results_tp_ub, expected_tp_ub)

}
)


test_that("test priors fails tp_ub ", {

  expect_error(two_source_priors_prams(,
                                       tp_ub = "test"),
               regexp = "`tp_ub` argument must be a numerical value"
  )



}

)
test_that("test two-source priors sigma_lb", {

  pri_pram <- two_source_priors_prams()
  expected_sigma_lb <- 0

  results_sigma_lb <- pri_pram$sigma_lb$sdata

  expect_equal(results_sigma_lb, expected_sigma_lb)

}
)

#  tests for the two_source_priors_prams fails when given not. a numeric


test_that("test two-source priors sigma_lb", {

  expect_error(two_source_priors_prams(,
                                       sigma_lb = "test"),
               regexp = "`sigma_lb` argument must be a numerical value")


}
)



test_that("test two-source priors sigma_ub", {

  pri_pram <- two_source_priors_prams()
  expected_sigma_ub <- 10

  results_sigma_ub <- pri_pram$sigma_ub$sdata

  expect_equal(results_sigma_ub, expected_sigma_ub)

}
)


test_that("test priors fails sigma_ub ", {

  expect_error(two_source_priors_prams(,
                                       sigma_ub = "test"),
               regexp = "`sigma_ub` argument must be a numerical value"
  )



}

)

