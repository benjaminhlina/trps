#  tests for the one_source_priors_params


test_that("test one-source priors n1", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_n1 <- 9

  results_n1 <- pri_pram$n1$sdata

  expect_equal(results_n1, expected_n1)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors fails n1", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      n1 = "test"
    ),
    regexp = "`n1` argument must be a numerical value"
  )
})


test_that("test one-source priors sigma", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_n1_sigma <- 1

  results_n1_sigma <- pri_pram$n1_sigma$sdata

  expect_equal(results_n1_sigma, expected_n1_sigma)
})


test_that("test priors fails n1_sigam ", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      n1_sigma = "test"
    ),
    regexp = "`n1_sigma` argument must be a numerical value"
  )
})
#  tests for the one_source_priors_params


test_that("test one-source priors dn", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_dn <- 3.4

  results_dn <- pri_pram$dn$sdata

  expect_equal(results_dn, expected_dn)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors fails dn", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      dn = "test"
    ),
    regexp = "`dn` argument must be a numerical value"
  )
})



test_that("test one-source priors dn_sigma", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_dn_sigma <- 0.25

  results_dn_sigma <- pri_pram$dn_sigma$sdata

  expect_equal(results_dn_sigma, expected_dn_sigma)
})


test_that("test priors fails dn_sigam ", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      dn_sigma = "test"
    ),
    regexp = "`dn_sigma` argument must be a numerical value"
  )
})

# ---- tp ----

test_that("test one-source priors tp_lb", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_tp_lb <- 2

  results_tp_lb <- pri_pram$tp_lb$sdata

  expect_equal(results_tp_lb, expected_tp_lb)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors tp_lb", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      tp_lb = "test"
    ),
    regexp = "`tp_lb` argument must be a numerical value"
  )
})



test_that("test one-source priors tp_ub", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_tp_ub <- 10

  results_tp_ub <- pri_pram$tp_ub$sdata

  expect_equal(results_tp_ub, expected_tp_ub)
})


test_that("test priors fails tp_ub ", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      tp_ub = "test"
    ),
    regexp = "`tp_ub` argument must be a numerical value"
  )
})
test_that("test one-source priors sigma_lb", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_sigma_lb <- 0

  results_sigma_lb <- pri_pram$sigma_lb$sdata

  expect_equal(results_sigma_lb, expected_sigma_lb)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors sigma_lb", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      sigma_lb = "test"
    ),
    regexp = "`sigma_lb` argument must be a numerical value"
  )
})



test_that("test one-source priors sigma_ub", {
  pri_pram <- one_source_priors_params(bp = TRUE)
  expected_sigma_ub <- 10

  results_sigma_ub <- pri_pram$sigma_ub$sdata

  expect_equal(results_sigma_ub, expected_sigma_ub)
})


test_that("test priors fails sigma_ub ", {
  expect_error(
    one_source_priors_params(
      bp = TRUE,
      sigma_ub = "test"
    ),
    regexp = "`sigma_ub` argument must be a numerical value"
  )
})

test_that("test priors fails test bp fails ", {
  expect_error(one_source_priors_params(bp = "TRUE"),
    regexp = "`bp` argument must be a logical value"
  )
})


test_that("test one-source priors dn", {
  pri_pram <- one_source_priors_params()
  expected_dn <- 3.4

  results_dn <- pri_pram$dn$sdata

  expect_equal(results_dn, expected_dn)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors fails dn", {
  expect_error(
    one_source_priors_params(,
      dn = "test"
    ),
    regexp = "`dn` argument must be a numerical value"
  )
})



test_that("test one-source priors dn_sigma", {
  pri_pram <- one_source_priors_params()
  expected_dn_sigma <- 0.25

  results_dn_sigma <- pri_pram$dn_sigma$sdata

  expect_equal(results_dn_sigma, expected_dn_sigma)
})


test_that("test priors fails dn_sigam ", {
  expect_error(
    one_source_priors_params(,
      dn_sigma = "test"
    ),
    regexp = "`dn_sigma` argument must be a numerical value"
  )
})

# ---- tp ----

test_that("test one-source priors tp_lb", {
  pri_pram <- one_source_priors_params()
  expected_tp_lb <- 2

  results_tp_lb <- pri_pram$tp_lb$sdata

  expect_equal(results_tp_lb, expected_tp_lb)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors tp_lb", {
  expect_error(
    one_source_priors_params(,
      tp_lb = "test"
    ),
    regexp = "`tp_lb` argument must be a numerical value"
  )
})



test_that("test one-source priors tp_ub", {
  pri_pram <- one_source_priors_params()
  expected_tp_ub <- 10

  results_tp_ub <- pri_pram$tp_ub$sdata

  expect_equal(results_tp_ub, expected_tp_ub)
})


test_that("test priors fails tp_ub ", {
  expect_error(
    one_source_priors_params(,
      tp_ub = "test"
    ),
    regexp = "`tp_ub` argument must be a numerical value"
  )
})
test_that("test one-source priors sigma_lb", {
  pri_pram <- one_source_priors_params()
  expected_sigma_lb <- 0

  results_sigma_lb <- pri_pram$sigma_lb$sdata

  expect_equal(results_sigma_lb, expected_sigma_lb)
})

#  tests for the one_source_priors_params fails when given not. a numeric


test_that("test one-source priors sigma_lb", {
  expect_error(
    one_source_priors_params(,
      sigma_lb = "test"
    ),
    regexp = "`sigma_lb` argument must be a numerical value"
  )
})



test_that("test one-source priors sigma_ub", {
  pri_pram <- one_source_priors_params()
  expected_sigma_ub <- 10

  results_sigma_ub <- pri_pram$sigma_ub$sdata

  expect_equal(results_sigma_ub, expected_sigma_ub)
})


test_that("test priors fails sigma_ub ", {
  expect_error(
    one_source_priors_params(,
      sigma_ub = "test"
    ),
    regexp = "`sigma_ub` argument must be a numerical value"
  )
})
