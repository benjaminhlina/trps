test_that("test one-source model without baseline prior", {

  m <- one_source_model()
  # m$formula
  expected_wb <- formula(
    d15n ~ n1 + dn * (tp - lambda)
  )

  # class(m$formula)
  expect_equal(m$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)
test_that("test one-source model without baseline prior", {

  m <- one_source_model()


  prform <- list(
    dn = formula(dn ~ 1),
    tp = formula(tp ~ 1)
  )



  expect_equal(m$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test one-source model with baseline prior", {

  m <- one_source_model(bp = TRUE)

  el <- formula(d15n ~ n1 + dn * (tp - lambda))



  expect_equal(m$formula,
               el,
               ignore_attr = TRUE)


}
)


test_that("test one-source model with baseline prior", {

  m <- one_source_model(bp = TRUE)


  prform <- list(
    n1 = formula(n1 ~ 1),
    dn = formula(dn ~ 1),
    tp = formula(tp ~ 1)
  )


  expect_equal(m$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test one-source bp eorros", {

  expect_error(
    one_source_model(bp = "TRU")
  )



}
)
