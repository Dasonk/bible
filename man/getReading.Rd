\name{getReading}
\alias{getReading}
\title{Get reading for day}
\usage{
getReading(day = NULL, offset = 0)
}
\arguments{
  \item{list}{Character vector.  Contains all the readings
  in the plan with each reading taking a different element
  in the vector.}

  \item{day}{numeric.  The day in the reading plan to get
  the reading for}
}
\description{
Gets the reading for a specific day in the reading plan
}
\examples{
sapply(readings, getReading, day = 29)
today <- sapply(readings, getReading, day = as.numeric(system("date +'\%j'", intern = T)))
cat(paste(getReading(), collapse = "; "), "\\n")
}

