#' List of languages and their iso639-1 and iso639-2 codes
#'
#' A dataset of the ISO 639-1 and ISO 639-2 language codes
#' and their names in English, French, and German.
#'
#' @format A tibble with 507 rows and 7 columns:
#' * `iso639_1` the 2-letter code for the language
#' * `iso639_2` the 3-letter code for the language (the content of this column
#'   is the same as the column `iso639_2_terminology`)
#' * `iso639_2_bibliography` the 3-letter code for the language using the
#'   "Bibliographic version" (also known as `ISO639-2/B`).
#' * `iso639_2_terminology` the 3-letter code for the language using the
#'   "Terminology version" (also known as `ISO639-2/T`).
#' * `english_name` the English name of the language
#' * `french_name` the French name for the language
#' * `german_name` the German name for the language
#'
#' There are 21 languages that have different codes in the `ISO639-2/B` and
#' `ISO639-2/T` codes. In general the T codes are prefered and the B codes
#' are provided for compatibility.
#'
#' @source \url{http://www.loc.gov/standards/iso639-2/php/code_list.php}
#'   retrieved on 2020-06-19
"iso639"
