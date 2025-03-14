m <- two_source_model()
m1 <- two_source_model(bp = TRUE)
m2 <- two_source_model(lambda = 2)
m3 <- two_source_model(bp = TRUE,
                      lambda = 2)

 test_that("test two-source model without baseline prior and lambda 1", {

  # m$formula
  expected_wb <- formula(
    d15n ~ dn * (tp - l1) + n1 * alpha + n2 * (1 - alpha)
  )

  # class(m$formula)
  expect_equal(m$form$d15n$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)

 test_that("test alpha baseline prior with lambda 1", {

  # m$formula
  expected_wb <- formula(
    d13c ~ alpha * (c1 - c2) + c2
  )

  # class(m$formula)
  expect_equal(m$form$d13c$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)

test_that("test priors formuals two source model without baseline prior", {


  prform <- list(
    alpha = formula(alpha ~ 1),
     tp = formula(tp ~ 1),
     dn = formula(dn ~ 1)

  )

  expect_equal(m$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test alpha without baseline prior forms", {


  prform <- list(
    alpha = formula(alpha ~ 1)

  )

  expect_equal(m$forms$d13c$pforms,
               prform,
               ignore_attr = TRUE)
}
)


test_that("test two-source model with baseline prior", {



  el <- formula(
    d15n ~ dn * (tp - l1) + n1 * alpha + n2 * (1 - alpha)
    )



  expect_equal(m1$forms$d15n$formula,
               el,
               ignore_attr = TRUE)


}
)
test_that("test two-source model with baseline prior", {



  el <- formula(
    d13c ~ alpha * (c1 - c2) + c2
    )



  expect_equal(m1$forms$d13c$formula,
               el,
               ignore_attr = TRUE)


}
)


test_that("test two-source model with baseline prior", {

  prform <- list(
    alpha = formula(alpha ~ 1),
    n1 = formula(n1 ~ 1),
    n2 = formula(n2 ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )


  expect_equal(m1$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)

test_that("test two-source model with baseline prior", {

  prform <- list(
    alpha = formula(alpha ~ 1),
    c1 = formula(c1 ~ 1),
    c2 = formula(c2 ~ 1)

  )


  expect_equal(m1$forms$d13c$pforms,
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

# ------ lambda ------


test_that("test two-source model with multiple lambda baseline prior", {

  # m$formula
  expected_wb <- formula(
    d15n ~ dn * (tp - (l1 * alpha + l2 * (1 - alpha))) + n1 * alpha + n2 * (1 - alpha)
  )

  # class(m$formula)
  expect_equal(m2$forms$d15n$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)
test_that("test two-source model alpha with multiple lambda baseline prior", {

  # m$formula
  expected_wb <- formula(
    d13c ~ alpha * (c1 - c2) + c2
  )

  # class(m$formula)
  expect_equal(m2$forms$d13c$formula,
               expected_wb,
               ignore_attr = TRUE)


}
)


test_that("test two-source model and two lambdads without baseline prior", {

  prform <- list(
    alpha = formula(alpha ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )



  expect_equal(m2$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)




test_that("test two-source model with baseline prior", {

  el <- formula(
    d15n ~ dn * (tp - (l1 * alpha + l2 * (1-alpha))) + n1 * alpha + n2 * (1 - alpha)
  )



  expect_equal(m3$forms$d15n$formula,
               el,
               ignore_attr = TRUE)


}
)


test_that("test two-source model with baseline prior", {

  prform <- list(
    alpha = formula(alpha ~ 1),
    n1 = formula(n1 ~ 1),
    n2 = formula(n2 ~ 1),
    tp = formula(tp ~ 1),
    dn = formula(dn ~ 1)

  )


  expect_equal(m3$forms$d15n$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source model and two lambdads without baseline prior", {

  prform <- list(
    alpha = formula(alpha ~ 1),
    c1 = formula(c1 ~ 1),
    c2 = formula(c2 ~ 1)

  )



  expect_equal(m3$forms$d13c$pforms,
               prform,
               ignore_attr = TRUE)
}
)
test_that("test two-source lamba errros", {

  expect_error(
    two_source_model(lambda = 3),
    "`lambda` argument must be a numeric value and either `1` or `2`"
  )



}
)
