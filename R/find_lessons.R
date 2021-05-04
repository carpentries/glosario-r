find_lessons <- function(folder = NULL, files = NULL, terms = NULL){

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

  # Iterate over the YAML headers to search for the terms
  for (idx in 1:length(yaml_headers)){
    terms_searched <- terms %in% yaml_headers[[idx]]$glosario$defines
    if (any(terms_searched)){
      terms_found <- terms[which(terms_searched)]
      for (term in terms_found){
        # Print the term with which file name they're in.
        print(paste0(term, " : ",  files[idx]))
      }
    }
  }


}
