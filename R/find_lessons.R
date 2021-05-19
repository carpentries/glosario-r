#' Find terms in lessons
#'
#' @param folder The top-level folder to start searching for lessons
#' @param files The vector of specific files you want scanned
#' @param terms The vector of the terms you want to find
#' @param verbose If to print each term when found or not, TRUE by default
#' @return list of which terms were found and in which files
#' @details
#' This functions helps the user find terms in different lessons, irrespective
#' of folder management strategy or organization hierarchy. If the term is found,
#' a list entry will contain the term as a key and the files as values.
#'
#' @export
find_lessons <- function(folder = NULL, files = NULL, terms = NULL, verbose = TRUE){

  if (is.null(files) & is.null(folder)){
    stop("You need to provide either a path to the folder with the lessons or a
         vector with the specific files you want scanned.")
  }

  if (is.null(terms)){
    stop("You need to provide the terms to search for in the lessons.")
  }

  if (is.null(files)){
    folder <- stringr::str_remove(folder, "\\/$")
    files <- dir(path = folder, full.names = TRUE, recursive = TRUE)
  }

  # Read in the YAML header metadata into a list
  yaml_headers <- purrr::map(files, rmarkdown::yaml_front_matter)

  terms_returned <- list()

  # Iterate over the YAML headers to search for the terms
  for (idx in seq(length(yaml_headers))){
    terms_searched <- terms %in% yaml_headers[[idx]]$glosario$defines
    if (any(terms_searched)){
      terms_found <- terms[which(terms_searched)]
      for (term in terms_found){
        # Print the term with which file name they're in.
        if (verbose){
          print(paste0(term, " : ",  files[idx]))
        }
        # Assign terms to a list which we return to the user
        terms_returned[[term]] = c(terms_returned[[term]], files[idx])
      }
    }
  }

  invisible(terms_returned)
}
