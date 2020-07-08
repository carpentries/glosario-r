context("define")

test_that("define works", {
  g <- get_glossary()

  expect_type(define('data_frame', lang = 'en', glossary = g), 'list')

  expect_type(define('data frame', lang = 'en', glossary = g), 'list')

})

