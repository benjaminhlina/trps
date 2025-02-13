test_that("test two-source model without baseline prior", {

  m <- two_source_model()
  # m$formula
  expected_wb <- formula(
    d15n ~ dn * (tp - lambda) + n1 * alpha + n2 * (1 - alpha)
  )

  # class(m$formula)
  expect_equal(m$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)
test_that("test two-source model without baseline prior", {

  m <- two_source_model()


  prform <- list(
    alpha = formula(alpha ~ 1),
     tp = formula(tp ~ 1),
     dn = formula(dn ~ 1)

  )



  expect_equal(m$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source model with baseline prior", {

  m <- two_source_model(bp = TRUE)

  el <- formula(
    d15n ~ dn * (tp - lambda) + n1 * alpha + n2 * (1 - alpha)
    )



  expect_equal(m$formula,
               el,
               ignore_attr = TRUE)


}
)


test_that("test two-source model with baseline prior", {

  m <- two_source_model(bp = TRUE)


  prform <- list(
    alpha = formula(alpha ~ 1),
    n1 = formula(n1 ~ 1),
    n2 = formula(n2 ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )


  expect_equal(m$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source bp eorros", {

  expect_error(
    two_source_model(bp = "TRU")
  )



}
)
