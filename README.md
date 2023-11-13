
# permChacko

permChacko is an R package that implements a modified version of the [Chacko (1966)](https://www.jstor.org/stable/25051572) algorithm for order restriction.

## Installation

You can install the most stable version of permChacko from [CRAN](https://CRAN.R-project.org) with:

```r
install.packages("permChacko")
```

The development version of permChacko is available on GitHub. To install it, please make sure you have the [remotes](https://remotes.r-lib.org/) package installed and run:

```r
remotes::install_github("ocbe-uio/permChacko")
```

This installs the package without vignettes. To install the vignettes, please make sure you have [Pandoc installed](https://pandoc.org/installing.html) and run:

```r
remotes::install_github("ocbe-uio/permChacko", build_vignettes = TRUE)
```

## Example

This is a basic example which shows you how to solve a common problem:

```r
library(permChacko)
permChacko(chacko66_sec3) # example 5 from Chacko (1966)
```

## References

Chacko, V. J. "Testing homogeneity against ordered alternatives." The Annals of Mathematical Statistics (1963): 945-956. https://www.jstor.org/stable/2238476

Chacko, V. J. (1966). Modified Chi-Square Test for Ordered Alternatives. Sankhyā: The Indian Journal of Statistics, Series B (1960-2002), 28(3/4), 185–190. http://www.jstor.org/stable/25051572

## Badges

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CodeFactor](https://www.codefactor.io/repository/github/ocbe-uio/permChacko/badge)](https://www.codefactor.io/repository/github/ocbe-uio/permChacko)
[![R build status](https://github.com/ocbe-uio/permChacko/workflows/R-CMD-check/badge.svg)](https://github.com/ocbe-uio/permChacko/actions)
[![Codecov](https://codecov.io/gh/ocbe-uio/permChacko/branch/develop/graph/badge.svg)](https://codecov.io/gh/ocbe-uio/permChacko)
<!-- badges: end -->
