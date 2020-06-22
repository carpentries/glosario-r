iso_langs <- function(code = NULL, from = "iso639_1", to = "iso639_1") {

  code_opts <- c(
    "iso639_1",
    "iso639_2",
    "iso639_2_terminology",
    "iso639_2_bibliographic",
    "english_name",
    "french_name",
    "german_name"
  )

  if (!all(code_opts %in% names(glosario::iso639))) {
    stop(
      "internal error: available code options don't match ",
      "column names of iso639 dataset.",
      call. = FALSE
    )
  }

  from <- match.arg(from, code_opts)
  to <- match.arg(to, code_opts)

  if (is.null(code)) {
    return(glosario::iso639[[to]][!is.na(glosario::iso639[[to]])])
  }

  m <- match(tolower(code), tolower(glosario::iso639[[from]]))
  glosario::iso639[[to]][m]
}
