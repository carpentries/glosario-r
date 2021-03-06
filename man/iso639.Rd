% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iso639.R
\docType{data}
\name{iso639}
\alias{iso639}
\title{List of languages and their iso639-1 and iso639-2 codes}
\format{
A tibble with 507 rows and 7 columns:
\itemize{
\item \code{iso639_1} the 2-letter code for the language
\item \code{iso639_2} the 3-letter code for the language (the content of this column
is the same as the column \code{iso639_2_terminology})
\item \code{iso639_2_bibliography} the 3-letter code for the language using the
"Bibliographic version" (also known as \code{ISO639-2/B}).
\item \code{iso639_2_terminology} the 3-letter code for the language using the
"Terminology version" (also known as \code{ISO639-2/T}).
\item \code{english_name} the English name of the language
\item \code{french_name} the French name for the language
\item \code{german_name} the German name for the language
}

There are 21 languages that have different codes in the \code{ISO639-2/B} and
\code{ISO639-2/T} codes. In general the T codes are prefered and the B codes
are provided for compatibility.
}
\source{
\url{http://www.loc.gov/standards/iso639-2/php/code_list.php}
retrieved on 2020-06-19
}
\usage{
iso639
}
\description{
A dataset of the ISO 639-1 and ISO 639-2 language codes
and their names in English, French, and German.
}
\keyword{datasets}
