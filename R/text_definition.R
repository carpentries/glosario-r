text_definition <- function(key, lang = "en", glossary = NULL) {
 if (is.null(glossary)){
    glossary <- get_glossary()
  }

  entries <- glossary$rmd_define(key = key, lang = lang)
  entries_list <- purrr::map(entries, ~.x$.__enclos_env__$private$.entries)
  entries_list <- purrr::flatten(entries_list)
  definitions <- purrr::map_chr(entries_list, ~.x$definition())
  return(definitions)
}
