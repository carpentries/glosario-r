#' Update the glossary file
#'
#' @param verbose Boolean to control the amount of text to print
#' @param url The URL of the YAML file containing the glossary, if none is
#' provided the latest file from the The Carpentries GitHub repository will be
#' downloaded
#'
#' @return NULL
#'
#' @export
update <- function(verbose = FALSE, url = NULL){
  current_glossary_path <- system.file("glosario/glossary.yml", package = "glosario")
  current_glossary <- yaml::read_yaml(current_glossary_path, eval.expr = FALSE)
  current_glossary_hash <- digest::digest(current_glossary, algo = "md5")

  user_data_dir <- rappdirs::user_data_dir(appname = "glosario")
  new_glossary_path <- paste0(user_data_dir, "/glossary.yml")

  if (is.null(url)){
    url <- "https://raw.githubusercontent.com/carpentries/glosario/main/glossary.yml"
  }

  download.file(url, destfile = new_glossary_path)

  new_glossary <- yaml::read_yaml(new_glossary_path, eval.expr = FALSE)
  new_glossary_hash <- digest::digest(new_glossary)

  if (new_glossary_hash == current_glossary_hash){
    # Remove the user data directory
    unlink(user_data_dir, recursive = TRUE)
    message("No update performed as the glossaries are the same file.")
  } else {
    message("The Glosario glossary has been updated!")
  }
}

