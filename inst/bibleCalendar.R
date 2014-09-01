# Generate csv to import into google calendar
library(bible)

planStart <- "09/01/14"
calendarStart <- "09/01/14"
calendarEnd <- "12/31/15"
bible <- "ESV"
STARTTIME <- "06:00:00 AM"
ENDTIME   <- "06:30:00 AM"


names <- c("Subject", "Start Date", "Start Time", "End Date", "End Time", 
           "All Day Event", "Description", "Location", "Private")

format <- "%m/%d/%y"
yearstart <- as.Date(planStart, format = format)
startDate <- as.Date(calendarStart, format = format)
endDate <- as.Date(calendarEnd, format = format)
dates <- format(seq(startDate, endDate, by = 1), format = format)
days <- seq(as.numeric(startDate - yearstart), as.numeric(endDate - yearstart)) + 1
ndays <- length(days)

starttimes <- rep(STARTTIME, ndays)
endtimes <- rep(ENDTIME, ndays)
subject <- rep("Bible reading", ndays)
myreadings <- sapply(days, function(day){paste0(getReading(day), collapse = "; ")})

search <- gsub(";", ",", myreadings)
search <- gsub(" ", "%20", search)

site<- paste0("http://www.biblegateway.com/passage/?search=", search, 
              "&version=", bible)

description <- paste(myreadings, site, sep = "\n\n")


dat <- data.frame(Subject = subject,
                  "Start Date" = dates, 
                  "Start Time" = starttimes,
                  "End Date" = dates,
                  "End Time" = endtimes,
                  "All Day Event" = "False",
                  Description = description,
                  check.names = FALSE)

write.csv(dat, file = "inst/Readings.csv", row.names = FALSE)


