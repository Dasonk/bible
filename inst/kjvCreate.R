library(bible) # assuming bible is already a dataset
kjv <- read.csv("inst/KJV.csv", stringsAsFactor = FALSE, header = FALSE)
colnames(kjv) <- c("ID", "Text")

kjv$shortbook <- gsub("([[:alpha:]]+).*", "\\1", kjv[,"ID"])

longbook <- bible[,1]

names(longbook) <- unique(kjv$shortbook)
kjv$longbook <- longbook[kjv$shortbook]
chapter <- as.numeric(gsub("^[[:digit:]]*\ *[[:alpha:]]+([[:digit:]]+).*", "\\1", kjv[,"ID"]))
kjv$chapter <- chapter
verse <- as.numeric(gsub("^[[:digit:]]*\ *[[:alpha:]]+[[:digit:]]+:([[:digit:]]+)", "\\1", kjv[,"ID"]))
kjv$verse <- verse

kjv <- kjv[,c("longbook", "shortbook", "chapter", "verse", "ID", "Text")]

save(kjv, file="data/kjv.rda")
