
test_that("test adding estimates of alpha ", {



  dats <- combined_iso |>
    add_alpha()


  exc <- -0.4400
  expect_equal(round(dats$alpha[1], 2), exc)
}
)
test_that("test adding estimates of alpha_min ", {


  dats <- combined_iso |>
    add_alpha()


  exc <- -2.38
  expect_equal(round(dats$min_alpha[1], 2), exc)
}
)
test_that("test adding estimates of max_alpha ", {


  dats <- combined_iso |>
    add_alpha()


  exc <- 0.0600
  expect_equal(round(dats$max_alpha[1], 2), exc)
}
)
test_that("test check if alpha errors ", {


  expect_error(
    add_alpha(data = list()),
    "`data` must be a data.frame, tibble, or data.table"
  )
}
)
test_that("test check if alpha errors ", {


  expect_error(
    add_alpha(data = combined_iso[-c(4, 10, 12)]),
    "The data.frame is missing: d13c, c1_mean, and c2_mean"
  )
}
)

test_that("test adding estimates of alpha ", {



  dats <- combined_iso |>
    add_alpha(abs = TRUE)


  exc <- 0.44
  expect_equal(round(dats$alpha[1], 2), exc)
}
)
test_that("test adding estimates of alpha_min ", {


  dats <- combined_iso |>
    add_alpha(abs = TRUE)


  exc <- 0.06
  expect_equal(round(dats$min_alpha[1], 2), exc)
}
)
test_that("test adding estimates of max_alpha ", {


  dats <- combined_iso |>
    add_alpha(abs = TRUE)


  exc <- 2.38
  expect_equal(round(dats$max_alpha[1], 2), exc)
}
)

test_that("test adding estimates if abs fails", {


  expect_error(combined_iso |>
    add_alpha(abs = "TRUE"),
    "`abs` argument must be a logical value"
  )
}
)
