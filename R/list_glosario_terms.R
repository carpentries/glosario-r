#' @param title The table title
#' @export
#'
list_glosario_terms <- function(title = NULL){

  if (!isTRUE(getOption('knitr.in.progress'))){
    stop('This function only runs on RMarkdown Documents')
  }

  glosario_data <- rmarkdown::metadata[['glosario']]
  defines <- glosario_data$defines

  definitions <- purrr::map_chr(defines, text_definition, glosario_data$language)

  def_df <- data.frame(
    'Terms' = defines,
    'Definitions' = definitions
  )

  knitr::kable(def_df, caption = title)
}
