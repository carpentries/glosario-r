context("caching")

test_that("caching works", {

  valid_test_yml <- system.file(
    "test-parsing/valid-files/valid-file.yml",
    package = "glosario"
  )

  ## create temp dir for caching tests
  tmp_dir <- file.path(tempdir(), "caching-tests")
  expect_false(dir.exists(tmp_dir))
  dir.create(tmp_dir)
  expect_true(dir.exists(tmp_dir))

  path_cache <- generate_cached_glossary_path(valid_test_yml, tmp_dir)

  ## check that cache is empty
  expect_false(file.exists(path_cache))

  ## create cache
  cache <- use_cache(
    valid_test_yml,
    cache_path = tmp_dir
  )

  ## test validity of cached list
  expect_true(exists("uri", cache))
  expect_true(exists("entries", cache))

  expect_identical(cache[["uri"]], valid_test_yml)
  expect_identical(length(cache[["entries"]]), 1L)
  expect_identical(cache[["entries"]][[1]][["slug"]], "test_slug")

  ## test content of caching directory
  expect_true(file.exists(path_cache))

  cache_file_info <- file.info(path_cache)

  ## re-use cache
  cache2 <- use_cache(
    valid_test_yml,
    cache_path = tmp_dir
  )

  cache_file_info2 <- file.info(path_cache)

  expect_equal(
    cache_file_info[, -match("atime", names(cache_file_info))],
    cache_file_info2[, -match("atime", names(cache_file_info2))]
  )

  unlink(path_cache)
  unlink(tmp_dir)

})
