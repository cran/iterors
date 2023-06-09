% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/itakewhile.R
\name{i_keepwhile}
\alias{i_keepwhile}
\title{Iterator that returns elements while a predicate function returns TRUE}
\usage{
i_keepwhile(object, predicate, ...)
}
\arguments{
\item{object}{an iterable object}

\item{predicate}{a function that determines whether an element is \code{TRUE}
or \code{FALSE}. The function is assumed to take only one argument.}

\item{...}{passed along to \code{iteror(object, ...)}}
}
\value{
iterator object
}
\description{
Constructs an iterator that returns elements from an iterable \code{object}
as long as the given \code{predicate} function returns \code{TRUE}.
}
\examples{
# Filters out numbers exceeding 5
not_too_large <- function(x) {
  x <= 5
}
it <- i_keepwhile(1:100, not_too_large)
unlist(as.list(it)) == 1:5

# Same approach but uses an anonymous function
it2 <- i_keepwhile(seq(2, 100, by=2), function(x) x <= 10)
unlist(as.list(it2)) == c(2, 4, 6, 8, 10)
}
