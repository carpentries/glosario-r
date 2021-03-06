% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate_document.R
\name{validate_document}
\alias{validate_document}
\title{Validate Documents using Glosario Definitions}
\usage{
validate_document(file_path)
}
\arguments{
\item{file_path}{path to the file to be validated}
}
\description{
Validate Documents using Glosario Definitions
}
\details{
In case the document is not valid the function will return a warning
for each term not defined and raise a final error listing the total
number of terms not matched.
}
