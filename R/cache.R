read_cache <- function(cached_glossary_path) {
  cached_glossary <- readRDS(cached_glossary_path)
  validate_cached_glossary(cached_glossary)
  cached_glossary
}


write_cache <- function(glossary_path, cached_glossary_path) {
  parsed_yaml <- yaml::read_yaml(glossary_path, eval.expr = FALSE)

  to_cache <- list(
    uri = glossary_path,
    entries = parsed_yaml
  )

  saveRDS(to_cache, cached_glossary_path)
  to_cache
}

generate_cached_glossary_path <- function(glossary_path, cache_path) {
  ## we're only hashing on the path.
  ## Hashing on the content would be more robust but it defeats the
  ## purpose of caching in the first place as we'd have to parse the
  ## entire content of the file.
  hashed_glossary_path <- digest::digest(tolower(glossary_path))
  cached_glossary_file_name <- paste0(
    "glossary-", hashed_glossary_path, ".rds"
  )
  file.path(cache_path, cached_glossary_file_name)
}

use_cache <- function(glossary_path, cache_path) {

  validate_glossary_cache_path(cache_path)

  cached_glossary_path <- generate_cached_glossary_path(
    glossary_path,
    cache_path
  )

  if (file.exists(cached_glossary_path)) {
    raw_glossary <- read_cache(cached_glossary_path)
  } else {
    raw_glossary <- write_cache(
      glossary_path,
      cached_glossary_path
    )
  }

  raw_glossary
}
