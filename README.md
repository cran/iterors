The iterors package: Fast, compact iteration and tools
================

<!-- Do not edit README.md in the repo root directly; 
  edit vignettes/README.Rmd and then run devtools::build_vignettes() -->

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/iterors)](https://CRAN.R-project.org/package=iterors)
[![R-CMD-check](https://github.com/crowding/iterors/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/crowding/iterors/actions/workflows/check_full.yaml)
[![pkgdown](https://github.com/crowding/iterors/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/crowding/iterors/actions/workflows/pkgdown.yaml)
[![codecov](https://codecov.io/gh/crowding/iterors/branch/main/graph/badge.svg?token=kqLgHxP1Gh)](https://app.codecov.io/gh/crowding/iterors)
<!-- badges: end -->

A fresh take on iterators in R, leading to faster, shorter code.

## Features

  - Main method `nextOr(iter, or)`; allows simpler and faster code.
  - `iteror` objects are cross-compatible with existing code using
    `iterators` (such as the `foreach` package.)
  - Optimized performance, with often several times less overhead per
    item.
  - Compatible with Python iterators, via the `reticulate` package.
  - Comes with batteries included: a complete collection of iterator
    functions, ported, curated and harmonized from packages `iterators`,
    `itertools`, and `itertools2`,

## How is it different from `iterators`?

`iterors` uses the method `nextOr(it, or)` to retrieve the next element.
The trick is that the second argument `or` is lazily evaluated, so it
can specify a return value *or* an action to take at the end of
iteration. In particular, `or` can be a control flow operator like
`break` or `next` or `return`.

For example, this is how you can compute a sum over an iteror `it`:

``` r
total <- 0
repeat total <- total + nextOr(it, break)
```

To contrast with the previous `iterators` package: In that package
`nextElem` signals end of iteration by throwing an exception, which
means all iterator code had to be written inside a `tryCatch`. Computing
a sum over an iterator looked like this:

``` r
total <- 0
tryCatch(
  repeat total <- total + nextElem(it),
  error=function(x) {
    if (conditionMessage(x) != "StopIteration") stop(x)
  }
)
```

Besides requiring less boilerplate, iterator code written using `nextOr`
also performs faster, particularly when using higher-order iterator
functions. This is because `tryCatch` is a relatively expensive
operation in R, especially when used once per item. It is also not
possible(\*) to use `break` or `next` to exit an outer loop from inside
a `tryCatch` handler function. while `nextOr` is designed with that use
in mind.

The
[benchmarking](https://crowding.github.io/iterors/articles/benchmarks.html)
vignette illustrates that computations using `iterors` can execute
several times faster than using `iterators`.

The `iterors` package grew out of, and is a complement to, the
generators implemented in the [async](https://crowding.github.io/async/)
package.
[async::gen](https://crowding.github.io/async/reference/gen.html) lets
you construct iterators with complex logic, using familiar imperative
code with ordinary flow control constructs like `if` `for`, `switch` and
so on. Meanwhile, functions in this package `iterors` let you manipulate
the output of such a generator in functional style. These two packages
form two complementary ways to work with sequential processes.

## More reading

For a quick introduction, see
[`vignette("iterors")`](https://crowding.github.io/iterors/articles/iterors.html)

For an index of `iteror` functions organized by task, see
[`vignette("categories",
"iterors")`](https://crowding.github.io/iterors/articles/categories.html)

If you are familiar with packages `iterators`/`itertools`/`itertools2`,
some functions have been moved. See [`vignette("cross-reference",
"iterors")`](https://crowding.github.io/iterors/articles/cross-reference.html)

To learn how to build custom iterors, see [`vignette("writing",
"iterors")`](https://crowding.github.io/iterors/articles/writing.html)

## Installation

For prerelease, run the following after installing
[devtools](https://github.com/r-lib/devtools):

``` r
devtools::install_github('crowding/iterors')
```

When the package is released, you will be able to install the stable
version from [CRAN](https://cran.r-project.org/package=iterors):

``` r
install.packages('iterors', dependencies=TRUE)
```

## License

Copyright (c) 2023 Peter Meilstrup. This package as a whole is released
under the GNU General Public License (GPL) version 3.0, or (at your
option) any later version.

Portions of this package are derived from the `iterators` package,
copyright (c) 2008-2010 Revolution Analytics.

Portions of this package are derived from the `itertools`package,
copyright (c) 2015 Steve Weston.

Portions of this package are derived from the `itertools2` package,
copyright (c) 2015 John A. Ramey.

Where functions in this package are derived from previous works, this is
noted in the Rd documentation, and the original license notice is
retained at the top of the relevant source files.
