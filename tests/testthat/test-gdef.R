context("gdef")

test_that("gdef works", {
  expect_error(gdef('data_frame', 'Data Frame'))
  options('knitr.in.progress' = TRUE)
  expect_type(gdef('data_frame', 'Data Frame'), 'character')
})
