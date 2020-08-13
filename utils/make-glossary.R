#!/usr/bin/env Rscript

# Create .rda version of glossary for R package.
# Usage: Rscript make-glossary.R

install.packages("yaml")
install.packages("usethis")

#args <- commandArgs(trailingOnly = TRUE)
raw <- yaml::read_yaml("https://raw.githubusercontent.com/carpentries/glosario/master/glossary.yml")
glosario <- list()
for (entry in raw) {
  glosario[[entry$slug]] <- entry
}

#setwd('glosario-r') # We have to trick usethis because of package safeguarding on the functions

usethis::use_data(glosario,
                  overwrite = TRUE,
                  internal = TRUE)
