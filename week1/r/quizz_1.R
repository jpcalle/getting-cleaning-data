# Quizz week 1

library("data.table")
library("xlsx")
library("XML")

# Descargar y guardar los datos
the_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# Code book:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

download.file(the_url, destfile = "./data/am_com_survey.csv")
fecha_descarga <- date()
fecha_descarga

# Leer los datos guardados
datos <- read.table("./data/am_com_survey.csv", sep = ",", header = TRUE)
datos <- data.table(datos)

# Q1
datos[VAL == 24, .N]

# Q2
# Ans: Tidy data has one variable per column

# Q3
# Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

dat <- read.xlsx("./data/gov_NGAP.xlsx",
                 sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

sum(dat$Zip*dat$Ext, na.rm = TRUE)

# Q4
# Link: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml

file_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTreeParse(file_url, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zips[zips == "21231"])

# Q5
# link: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(file_url, destfile = "./data/fss_pid.csv")
fecha_descarga <- date()
fecha_descarga

datos <- fread("./data/fss_pid.csv", sep = ",")
head(datos)
datos[, mean(pwgtp15), by = SEX]
