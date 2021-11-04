#' Look up definition of term.
#'
#' @param key lookup key
#' @param lang language for the definition
#' @param glossary a glossary object
#' @param show_lang should the ISO639-1 2-letter code be displayed with the
#'   definition?
#'
#' @return string containing definition
#'
#' @export
define <- function(key, lang = "en", glossary = NULL, show_lang = FALSE) {
  if (is.null(glossary)) {
    glossary <- Glossary$new()
  }

  return(glossary$define(key, lang, show_lang = show_lang))
}
