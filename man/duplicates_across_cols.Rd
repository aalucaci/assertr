% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/row-redux.R
\name{duplicates_across_cols}
\alias{duplicates_across_cols}
\title{Checks if row contains at least one value duplicated in its column}
\usage{
duplicates_across_cols(data, allow.na = FALSE)
}
\arguments{
\item{data}{A data frame}

\item{allow.na}{TRUE if we allow NAs in data. Default FALSE.}
}
\value{
A logical vector.
}
\description{
This function will return a vector, with the same length as the number
of rows of the provided data frame. Each element of the vector will be
logical value that states if any value from the row was duplicated in
its column.
}
\examples{

df <- data.frame(v1 = c(1, 1, 2, 3), v2 = c(4, 5, 5, 6))
duplicates_across_cols(df)

library(magrittr)            # for piping operator

# you can use "assert_rows", "in_set", and this function to
# check if specified variables set and all subsets are keys for the data.

correct_df <- data.frame(id = 1:5, sub_id = letters[1:5], work_id = LETTERS[1:5])
correct_df \%>\%
  assert_rows(duplicates_across_cols, in_set(FALSE), id, sub_id, work_id)
  # passes because each subset of correct_df variables is key

\dontrun{
incorrect_df <- data.frame(id = 1:5, sub_id = letters[1:5], age = c(10, 20, 20, 15, 30))
incorrect_df \%>\%
  assert_rows(duplicates_across_cols, in_set(FALSE), id, sub_id, age)
  # fails because age is not key of the data (age == 20 is placed twice)
}

}
\seealso{
\code{\link{paste}}
}
