#!/usr/bin/env Rscript

# Create .rda version of glossary for R package.
# Usage: Rscript make-glossary.R /path/to/glossary.yml


args <- commandArgs(trailingOnly = TRUE)
raw <- yaml::read_yaml(args[1])
glosario <- list()
for (entry in raw) {
  glosario[[entry$slug]] <- entry
}

#setwd('glosario-r') # We have to trick usethis because of package safeguarding on the functions

usethis::use_data(glosario,
                  overwrite = TRUE,
                  internal = TRUE)
