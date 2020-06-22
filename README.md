
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glosario

<!-- badges: start -->

[![R build
status](https://github.com/carpentries/glosario-r/workflows/R-CMD-check/badge.svg)](https://github.com/carpentries/glosario-r/actions)
<!-- badges: end -->

glosario allows users to create and retrieve multilingual glossaries. By
default, glossario provides access to a [community-curated
glossary](https://github.com/carpentries/glosario) hosted by The
Carpentries. This repository also documents the structure exepcted for
the glossaries that can be managed by glosario.

There is also a [Python
interface](https://github.com/carpentries/glosario-py).

## Installation

glosario is still in the development stage and is only available from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("carpentries/glosario-r")
```

## Example

``` r
library(glosario)
g <- get_glossary()
g
#> A glossary with 152 entries.
define("slug", glossary = g)
#> slug: An abbreviated portion of a page's URL that uniquely identifies it. In
#>   the example `https://www.mysite.com/category/post-name`, the slug is
#>   `post-name`.
#> 
```
