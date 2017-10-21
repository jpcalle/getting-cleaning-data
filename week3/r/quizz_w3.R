# Quizz week 3

# Q1

data <- read.csv("ss06hid.csv")
head(data, n = 5)

# ACR = Lot size in acres -> 3 .House on ten or more acres
# AGS = Sales of Agriculture Products -> 6 .$10000+

subset_data <- data[, c("ACR", "AGS")]

head(subset_data)

agricultureLogical <- subset_data[, "ACR"] == 3 & subset_data[, "AGS"] == 6

head(subset_data[which(agricultureLogical), ], n = 3)


# Q2
library(jpeg)

photo <- readJPEG("jeff.jpg", native = TRUE)
quantile(photo, probs = c(0.3, 0.8))


# Q3
d1 <- read.csv("GDP.csv", header = FALSE, skip = 5, nrows = 190)
d1 <- d1[, c(1, 2, 4, 5)]
names(d1) <- c("pais_abr", "ranking", "pais", "gdp")
head(d1)
d2 <- read.csv("EDSTATS_Country.csv")
head(d2) # CountryCode
d2$pais_abr <- d2[, "CountryCode"]

merged <- merge(d1, d2, by = "pais_abr")
merged$ranking <- as.numeric(merged$ranking)

library("plyr")
arranged <- arrange(join(d1, d2, by = "pais_abr", type = "inner"),
                    desc(ranking))
nrow(arranged)  # 189
head(arranged, n = 13)
tail(arranged, n = 10)
arranged[13, "pais"]  # St. Kitts and Nevis


# Q4
lapply(split(arranged, arranged$Income.Group),
       function(df) {mean(df$ranking, na.rm = TRUE)})


# Q5
cutted <- cut(arranged$ranking, 5)
arranged$cutted <- cutted

table(arranged$cutted, arranged$Income.Group)
