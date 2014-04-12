# Generate csv to import into google calendar

library(bible)


names <- scan(what = character(), n = 9, sep = ",")
Subject,Start Date,Start Time,End Date,End Time,All Day Event,Description,Location,Private

format <- "%m/%d/%y"
yearstart <- as.Date("01/01/14", format = format)
startDate <- as.Date("01/01/14", format = format)
endDate <- as.Date("12/31/14", format = format)
dates <- format(seq(startDate, endDate, by = 1), format = format)
days <- seq(as.numeric(startDate - yearstart), as.numeric(endDate - yearstart)) + 1
ndays <- length(days)

starttimes <- rep("06:00:00 AM", ndays)
endtimes <- rep("06:30:00 AM", ndays)
subject <- rep("Bible reading", ndays)
myreadings <- sapply(days, function(day){paste0(getReading(day), collapse = "; ")})

search <- gsub(";", ",", myreadings)
search <- gsub(" ", "%20", search)
bible <- "NLT"
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


