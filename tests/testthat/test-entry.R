context("entry")

test_that("entry works", {
  g <- get_glossary()

  expect_true(R6::is.R6(g))

  expect_type(g$define, 'closure')
  expect_type(g$clone, 'closure')
  expect_type(g$list_slugs, 'closure')
  expect_type(g$print, 'closure')
})
