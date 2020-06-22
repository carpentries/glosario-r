context("iso_langs")

test_that("iso_langs returns all languages when `code` is NULL", {
  all_langs <- iso_langs(code = NULL)
  expect_identical(length(all_langs), 204L)
})

test_that("iso_langs is insensitive to from argument", {
  all_langs_1 <- iso_langs(code = NULL, from = "iso639_1")
  all_langs_2 <- iso_langs(code = NULL, from = "iso639_2")
  all_langs_en <- iso_langs(code = NULL, from = "english_name")

  expect_true(all.equal(all_langs_1, all_langs_2))
  expect_true(all.equal(all_langs_1, all_langs_en))
})

test_that("iso_langs fails if from or to args are invalid", {
  expect_error(iso_langs(from = "test"), "should be one of")
  expect_error(iso_langs(to = "test"), "should be one of")
})

test_that("iso_langs returns NA if code is invalid", {
  expect_true(is.na(iso_langs(code = "zz")))
  expect_true(is.na(iso_langs(code = "zzz", from = "iso639_2")))
  expect_true(is.na(iso_langs(code = "zzzz", from = "english_name")))
})

test_that("iso_langs returns 2-letter codes (iso639-1)", {
  expect_identical(iso_langs(code = "es"), "es")
  expect_identical(iso_langs(code = "ES"), "es")
  expect_identical(iso_langs(code = "Basque", from = "english_name"), "eu")
  expect_identical(iso_langs(code = "eus", from = "iso639_2"), "eu")
  expect_identical(iso_langs(code = "eus", from = "iso639_2_terminology"), "eu")
  expect_identical(iso_langs(code = "baq", from = "iso639_2_bibliographic"), "eu")
})

test_that("iso_langs returns 3-letter codes (iso639-2)", {
  expect_identical(iso_langs(code = "es", to = "iso639_2"), "spa")
  expect_identical(iso_langs(code = "ES", to = "iso639_2"), "spa")
  expect_identical(
    iso_langs(code = "Basque", from = "english_name", to = "iso639_2"),
    "eus"
  )
  expect_identical(
    iso_langs(code = "eus", from = "iso639_2", to = "iso639_2"),
    "eus"
  )
  expect_identical(
    iso_langs(code = "eus", from = "iso639_2_terminology", to = "iso639_2"),
    "eus"
  )
  expect_identical(
    iso_langs(code = "baq", from = "iso639_2_bibliographic", to = "iso639_2"),
    "eus"
  )
})

test_that("iso_langs returns English names", {
  expect_identical(
    iso_langs(code = "es", to = "english_name"),
    "Spanish; Castilian"
  )
  expect_identical(
    iso_langs(code = "ES", to = "english_name"),
    "Spanish; Castilian"
  )
  expect_identical(
    iso_langs(code = "Basque", from = "english_name", to = "english_name"),
    "Basque"
  )
  expect_identical(
    iso_langs(code = "eus", from = "iso639_2", to = "english_name"),
    "Basque"
  )
  expect_identical(
    iso_langs(code = "eus", from = "iso639_2_terminology", to = "english_name"),
    "Basque"
  )
  expect_identical(
    iso_langs(code = "baq", from = "iso639_2_bibliographic", to = "english_name"),
    "Basque"
  )
})
