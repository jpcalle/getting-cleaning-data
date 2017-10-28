# Quizz week 4

# Q1

data <- read.csv("ss06hid.csv", header = TRUE)
strsplit(names(data), split = "wgtp")[123]

# Q2

data <- read.csv("GDP.csv", header = FALSE, skip = 5, nrows = 190)
data <- data[, c(1, 2, 4, 5)]
names(data) <- c("pais_abr", "ranking", "pais", "gdp")
mean(as.numeric(gsub(",", "", data$gdp)))

# Q3
grep("^United", data$pais)

# Q4
ed_data <- read.csv("EDSTATS_Country.csv")
head(ed_data)
ed_data$pais_abr <- ed_data[, "CountryCode"]

merged_data <- merge(data, ed_data, by = "pais_abr")
length(grep("^Fiscal year end: June", ed_data$Special.Notes))

# Q4
library(quantmod)
amzn <-  getSymbols("AMZN", auto.assign = FALSE)
sampleTimes <-  index(amzn)
head(sampleTimes)
typeof(sampleTimes)
in2012 <- sampleTimes[format(sampleTimes, "%Y") == "2012"]
length(in2012)
sum(weekdays(in2012, abbreviate = FALSE) == "lunes")
