#' Generate anchor tag for a given term in HTML
#'
#' @param term Look-up key
#' @param text Text to display
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
    base_url <- 'https://carpentries.org/glosario'
  } else {
    base_url <- glosario_data$base_url
  }

  if (is.null(glosario_data$language)){
    language <- 'en'
  } else {
    language <- glosario_data$language
  }

  string <- glue::glue('<a href="{base_url}/{language}/#{term}" class="glossary-definition">{text}</a>')
  return(string)
}
