library(dplyr)
example_iso_tsn <- consumer_iso %>%
    left_join(baseline_1_iso %>%
                select(-common_name)) %>%
    left_join(baseline_2_iso %>%
                select(-common_name))  %>%
    left_join(
      baseline_1_iso %>%
        group_by(ecoregion) %>%
        summarise(
          c1_mean = mean(c1),
          n1_mean = mean(n1),
        ) %>%
        ungroup()
    ) %>%
    left_join(
      baseline_2_iso %>%
        group_by(ecoregion) %>%
        summarise(
          c2_mean = mean(c2),
          n2_mean = mean(n2),
        ) %>%
        ungroup()
    )
test_that("test adding estimates of alpha ", {



  dats <- example_iso_tsn |>
    add_alpha()


  exc <- 1.440
  expect_equal(round(dats$alpha[1], 2), exc)
}
)
test_that("test adding estimates of alpha_min ", {


  dats <- example_iso_tsn |>
    add_alpha()


  exc <- 0.94
  expect_equal(round(dats$min_alpha[1], 2), exc)
}
)
test_that("test adding estimates of max_alpha ", {


  dats <- example_iso_tsn |>
    add_alpha()


  exc <- 3.38
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
    add_alpha(data = example_iso_tsn[-c(4, 10, 12)]),
    "The data.frame is missing: d13c, c1_mean, and c2_mean"
  )
}
)
