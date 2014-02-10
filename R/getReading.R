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
#' @references \url{http://www.scribd.com/doc/12349985/Professor-Grant-Horners-Bible-Reading-System}
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

#' Which chapters read so far
#' 
#' A vector of the chapters that have been read so far
#' 
#' @export
chaptersRead <- function(){
    today <- as.numeric(system("date +'%j'", intern = T))
    days <- seq(1, today)
    read <- lapply(days, getReading)
    ordered <- as.vector(do.call(rbind, read))
    out <- unique(unlist(ordered))
    
    out
}

nBible <- function(){
    sum(bible[,2])
}

#' Proportion of bible read
#' 
#' Get the proportion of the bible read so far in the reading plan
#' 
#' @export
proportionRead <- function(){
    prop <- length(chaptersRead()) / nBible()
    sprintf("%3.2f%%", prop * 100)
}