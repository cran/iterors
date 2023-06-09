% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/consume.R
\name{consume}
\alias{consume}
\alias{consume.iteror}
\title{Consumes the first n elements of an iterator}
\usage{
consume(obj, n = Inf, ...)

\method{consume}{iteror}(obj, n = Inf, ...)
}
\arguments{
\item{obj}{an iterable object}

\item{n}{The number of elements to consume.}

\item{...}{passed along to \link{iteror} constructor.}
}
\value{
\code{obj}, invisibly.
}
\description{
Advances the iterator n-steps ahead without returning anything.
}
\examples{
it <- iteror(1:10)
# Skips the first 5 elements
consume(it, n=5)
# Returns 6
nextOr(it, NA)

it2 <- iteror(letters)
# Skips the first 4 elements
consume(it2, 4)
# Returns 'e'
nextOr(it2, NA)
}
\seealso{
take collect
}
