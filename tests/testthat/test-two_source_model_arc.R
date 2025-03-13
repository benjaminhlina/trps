test_that("test two-source model without baseline prior", {

  m <- two_source_model_arc()
  # m$formula
  expected_wb <- formula(
    d15n ~ dn * (tp - l1) + n1 * ar + n2 * (1 - ar)
  )

  # class(m$formula)
  expect_equal(m$forms$d15n$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)
test_that("test two-source model without baseline prior", {

  m <- two_source_model_arc()
  # m$formula
  expected_wb <- formula(
    d13c ~ (c1 * ar)  + (c2 * (1 - ar))
  )

  # class(m$formula)
  expect_equal(m$forms$d13c$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)


test_that("test two-source model without baseline prior", {

  m <- two_source_model_arc()
  # m$formula
  expected_wb <- formula(
    alpha ~ ar * (max_alpha - min_alpha) + min_alpha
  )

  # class(m$formula)
  expect_equal(m$forms$alpha$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)
test_that("test two-source model without baseline prior", {

  m <- two_source_model_arc()


  prform <- list(
    ar = formula(ar ~ 1),
     tp = formula(tp ~ 1),
     dn = formula(dn ~ 1)

  )



  expect_equal(m$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source model without baseline prior", {

  m <- two_source_model_arc()


  prform <- list(
    ar = formula(ar ~ 1)


  )



  expect_equal(m$forms$alpha$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source model without baseline prior", {

  m <- two_source_model_arc()


  prform <- list(
    ar = formula(ar ~ 1)


  )



  expect_equal(m$forms$d13c$pforms,
               prform,
               ignore_attr = TRUE)
}
)





test_that("test two-source model with baseline prior", {

  m <- two_source_model_arc(bp = TRUE)

  el <- formula(
    d15n ~ dn * (tp - l1) + n1 * ar + n2 * (1 - ar)
    )



  expect_equal(m$forms$d15n$formula,
               el,
               ignore_attr = TRUE)


}
)


test_that("test two-source model with baseline prior", {

  m <- two_source_model_arc(bp = TRUE)


  prform <- list(
    ar = formula(ar ~ 1),
    n1 = formula(n1 ~ 1),
    n2 = formula(n2 ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )


  expect_equal(m$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source model with baseline prior", {

  m <- two_source_model_arc(bp = TRUE)


  prform <- list(
    ar = formula(ar ~ 1),
    c1 = formula(c1 ~ 1),
    c2 = formula(c2 ~ 1)

  )


  expect_equal(m$forms$d13c$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source model with baseline prior", {

  m <- two_source_model_arc(bp = TRUE)


  prform <- list(
    ar = formula(ar ~ 1)

  )


  expect_equal(m$forms$alpha$pforms,
               prform,
               ignore_attr = TRUE)
}
)


test_that("test two-source bp eorros", {

  expect_error(
    two_source_model_arc(bp = "TRU")
  )



}
)


test_that("test two-source model with multiple lambda baseline prior", {

  m <- two_source_model_arc(lambda = 2)
  # m$formula
  expected_wb <- formula(
    d15n ~ dn * (tp - (l1 * ar + l2 * (1 - ar))) + n1 * ar + n2 * (1 - ar)
  )

  # class(m$formula)
  expect_equal(m$forms$d15n$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)


test_that("test two-source model and two lambdads without baseline prior", {

  m <- two_source_model_arc(lambda = 2)


  prform <- list(
    ar = formula(ar ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )



  expect_equal(m$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)


test_that("test two-source model with baseline prior", {

  m <- two_source_model_arc(bp = TRUE,
                        lambda = 2)

  el <- formula(
    d15n ~ dn * (tp - (l1 * ar + l2 * (1 - ar))) + n1 * ar + n2 * (1 - ar)
  )



  expect_equal(m$forms$d15n$formula,
               el,
               ignore_attr = TRUE)


}
)


test_that("test two-source model with baseline prior", {

  m <- two_source_model_arc(bp = TRUE,
                        lambda = 2)


  prform <- list(
    ar = formula(ar ~ 1),
    n1 = formula(n1 ~ 1),
    n2 = formula(n2 ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )


  expect_equal(m$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source lamba errros", {

  expect_error(
    two_source_model_arc(lambda = 3),
    "`lambda` argument must be a numeric value and either `1` or `2`"
  )



}
)
