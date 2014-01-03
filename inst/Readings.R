books <- read.csv("inst//Bible.csv", stringsAsFactors = F)
b <- as.character(books$Book)
lists <- list(
    b[40:43],
    b[1:5],
    c(b[45:51], b[58]),
    c(b[52:57], b[59:66]),
    b[c(18,21,22)],
    b[19],
    b[20],
    b[6:17],
    b[23:39],
    b[44])

gen <- function(x){
    id <- which(books$Book %in% x)
    reps <- books$Chapters[id]
    crep <- sequence(reps)
    brep <- rep(books$Book[id], reps)
    paste(brep, crep)
}

readings <- lapply(lists, gen)
lens <- sapply(readings, length)

getReading <- function(list, day){
    len <- length(list)
    x <- day %% len
    if(x == 0){
        x <- len
    }
    list[x]
}

readingForDay <- function(list,)

today <- sapply(readings, getReading, day = as.numeric(system("date +'%j'", intern = T)))
sapply(readings, getReading, day = 29)

cat(paste(today, collapse = "; "))

