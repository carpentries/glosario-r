#' Validate Documents using Glosario Definitions
#'
#' @param file_path path to the file to be validated
#' @return NULL
#' @details
#' In case the document is not valid the function will return a warning
#' for each term not defined and raise a final error listing the total
#' number of terms not matched.
#'
#' @export
validate_document <- function(file_path){
  yaml_header <- rmarkdown::yaml_front_matter(file_path)
  yaml_defines <- yaml_header$glosario$defines

  file_text <- readLines(file_path)

  gdef_idx <- purrr::map_lgl(file_text, stringr::str_detect, 'gdef(')

  gdef_lines <- file_text[gdef_idx]

  text_slugs <- purrr::map_chr(gdef_lines, stringr::str_remove_all, "`r gdef\\(") %>%
    purrr::map_chr(stringr::str_remove_all, "'") %>%
    purrr::map_chr(stringr::str_remove_all, "\\)`") %>%
    purrr::map(stringr::str_split_fixed, ", ", 2) %>%
    purrr::map_chr(~.x[, 1], drop = TRUE) %>%
    unique()


  terms_flag <- all(yaml_defines %in% text_slugs)

  warning_msg <- function(term_not_defined){
    warning(glue::glue("\"{term_not_defined}\" appears on the YAML header but not in the corpus of the document."))
  }

  if (terms_flag){
    print(glue::glue("Your document defines {length(yaml_defines)} terms in the YAML header and it has {length(text_slugs)} gdef calls. \n Valid Lesson! Good Job!"))
  } else {
    terms_not_defines <- yaml_defines[!yaml_defines %in% text_slugs]
    len_terms <- length(terms_not_defines)
    purrr::map_chr(terms_not_defines, warning_msg)
    if (len_terms > 1){
      stop(glue::glue("There are {len_terms} terms not defined in the document."))
    } else {
      stop("There is 1 term not defined in the document.")
    }
  }
}
