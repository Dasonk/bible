.getReading <- function(list, day){
    len <- length(list)
    x <- day %% len
    if(x == 0){
        x <- len
    }
    list[x]
}


#' Get reading for day
#' 
#' Gets the reading for a specific day in the reading plan
#' 
#' @param list Character vector.  Contains all the readings in the plan
#' with each reading taking a different element in the vector.
#' @param day numeric.  The day in the reading plan to get the reading for
#' 
#' @export
#' @examples
#' sapply(readings, getReading, day = 29)
#' today <- sapply(readings, getReading, day = as.numeric(system("date +'%j'", intern = T)))
#' cat(paste(getReading(), collapse = "; "), "\n")
getReading <- function(day = NULL, offset = 0){
    if(is.null(day)){
        day <- as.numeric(system("date +'%j'", intern = T))
    }
    
    sapply(readings, .getReading, day = day + offset)
}
