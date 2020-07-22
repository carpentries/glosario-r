
<!-- README.md is generated from README.Rmd. Please edit that file -->

# glosario

<!-- badges: start -->

[![R build
status](https://github.com/carpentries/glosario-r/workflows/R-CMD-check/badge.svg)](https://github.com/carpentries/glosario-r/actions)
[![codecov](https://codecov.io/gh/carpentries/glosario-r/branch/master/graph/badge.svg)](https://codecov.io/gh/carpentries/glosario-r)
<!-- badges: end -->

`glosario` allows users to create and retrieve multilingual glossaries.
By default, `glosario` provides access to a [community-curated
glossary](https://github.com/carpentries/glosario) hosted by The
Carpentries. This repository also documents the structure expected for
the glossaries that can be managed by `glosario`.

There is also a [Python
interface](https://glosario.readthedocs.io/en/latest/).

## Installation

`glosario` is still in the development stage and is only available from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("carpentries/glosario-r")
```

## Example

``` r
library(glosario)

define("data frame")
#> data frame: A two-dimensional data structure for storing tabular data in memory. Rows represent [records](#record) and columns
#>   represent [variables](variable_data).
#> See also: tidy_data
#> 
```

To get definitions in other languages we would do:

``` r
define("plus_one", lang = 'fr')
#> +1: Un vote en faveur de quelque chose.
#> 
```

If you want to use your custom glossary file you can do it the following
way:

``` r
custom_url <- "https://raw.githubusercontent.com/carpentries/glosario/master/glossary.yml"

g <- get_glossary(url = custom_url)

define("plus_one", lang = 'fr', glossary = g)
#> +1: Un vote en faveur de quelque chose.
#> 
```

To add links to definitions, you can use the `gdef` function for inline
writing:

``` r
This is a `r gdef('data_frame', 'Data Frame')`, they are used for storing data.
```

Which would look like this:

> This is a
> <a href="https://carpentries.org/glosario/en/#data_frame" class="glossary-definition">Data
> Frame</a>, they are used for storing data.
