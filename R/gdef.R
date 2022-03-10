#' Generate anchor tag for a given term in HTML
#'
#'
#' @param term Look-up key
#' @param text Text to display
#'
#' @note If you set up a language key in the glosario section of the YAML header,
#' the function will read this key and link to the correct language. If no
#' language key is provided the function will default to English.
#'
#' @return string containing link
#'
#' @export

gdef <- function(term, text){

  if (!isTRUE(getOption('knitr.in.progress'))){
    stop('This function only runs on RMarkdown Documents')
  }

  glosario_data <- rmarkdown::metadata[['glosario']]

  if (is.null(glosario_data$base_url)){
    base_url <- 'https://glosario.carpentries.org'
  } else {
    base_url <- glosario_data$base_url
  }

  if (is.null(glosario_data$language)){
    language <- 'en'
  } else {
    language <- glosario_data$language
  }

  # We introduce a span with class glosario_def so people can style HTML
  # The link itself is a MD link so that it renders without problem in all formats.
  string <- glue::glue('<span class="glosario_def">[{text}]({base_url}/{language}/#{term})</span>')
  return(string)
}
