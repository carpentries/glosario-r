#' List all the glosario terms in an RMd
#'
#' @param title The table title
#' @param type One of 'definitions' or 'reqs'
#'
#' @export
#'
list_glosario_terms <- function(title = NULL, type = 'definitions'){

  if (!isTRUE(getOption('knitr.in.progress'))){
    stop('This function only runs on RMarkdown Documents')
  }

  glosario_data <- rmarkdown::metadata[['glosario']]

  if (type == 'definitions'){
    defines <- glosario_data$defines
  } else if (type == 'reqs'){
    defines <- glosario_data$requires
  } else {
    stop('We don\'t support the type argument outside of "definitions" or "reqs"')
  }

  definitions <- purrr::map_chr(defines, text_definition, glosario_data$language)

  def_df <- data.frame(
    'Terms' = defines,
    'Definitions' = definitions
  )

  knitr::kable(def_df, caption = title)
}
