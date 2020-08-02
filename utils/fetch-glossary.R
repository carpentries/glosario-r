#!/usr/bin/env Rscript

# Fetch YAML version of glossary for R package.
# Usage: Rscript fetch-glossary.R

url <- "https://raw.githubusercontent.com/carpentries/glosario/master/glossary.yml"
path <- "inst/glosario/glossary.yml"

dir.create("inst/glosario", showWarnings = FALSE)

download.file(url, path)
