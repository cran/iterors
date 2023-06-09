% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/icombinations.R
\name{icombinations}
\alias{icombinations}
\title{Iterator that generates all combinations of a vector taken m at a time.}
\usage{
icombinations(object, m, replacement = FALSE)
}
\arguments{
\item{object}{vector}

\item{m}{the length of each combination}

\item{replacement}{Generate combinations with replacement? Default: no.}
}
\value{
iterator that generates all combinations of \code{object}
}
\description{
Constructs an iterator generates all combinations of a vector taken \code{m}
at a time. This function is similar to \code{\link[utils]{combn}}.
}
\details{
By default, the combinations are \strong{without replacement} so that elements are
not repeated. To generate combinations \strong{with replacement}, set
\code{replacement=TRUE}.

The function implementation is loosely based on the \code{combinations}
function from Python's itertools. Combinations with replacement are based on
\code{combinations_with_replacement} from the same Python library.
}
\examples{
# Combinations without replacement
it <- icombinations(1:4, m=2)

nextOr(it, NA) # c(1, 2)
nextOr(it, NA) # c(1, 3)
nextOr(it, NA) # c(1, 4)
nextOr(it, NA) # c(2, 3)
nextOr(it, NA) # c(2, 4)
nextOr(it, NA) # c(3, 4)

# Combinations without replacement
it <- icombinations(1:4, m=2, replacement=TRUE)

nextOr(it, NA) # c(1, 1)
nextOr(it, NA) # c(1, 2)
nextOr(it, NA) # c(1, 3)
nextOr(it, NA) # c(1, 4)
nextOr(it, NA) # c(2, 2)
nextOr(it, NA) # c(2, 3)
nextOr(it, NA) # c(2, 4)
nextOr(it, NA) # c(3, 3)
nextOr(it, NA) # c(3, 4)
nextOr(it, NA) # c(4, 4)

it3 <- icombinations(1:5, m=2)
as.list(it3)
utils::combn(x=1:5, m=2, simplify=FALSE)

}
