

test_that("test adding estimates of alpha ", {


  dats <- example_iso_tsn |>
    add_alpha()


  exc <- 1.31
  expect_equal(round(dats$alpha[1], 2), exc)
}
)
test_that("test adding estimates of alpha_min ", {


  dats <- example_iso_tsn |>
    add_alpha()


  exc <- 0.96
  expect_equal(round(dats$min_alpha[1], 2), exc)
}
)
test_that("test adding estimates of max_alpha ", {


  dats <- example_iso_tsn |>
    add_alpha()


  exc <- 2.66
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
    add_alpha(data = example_iso_os[-c(4)]),
    "The data.frame is missing: d13c, c1, and c2"
  )
}
)
