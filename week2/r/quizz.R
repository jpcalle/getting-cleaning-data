# Week 2 quizz

# Q1

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "b070e76340da6c5c4b1e",
                   secret = "3007eab9ee4d9d3edb61cf338f17f5e741e70740")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# Q4

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
lines <- readLines(con)
nchar(lines[c(10, 20, 30, 100)])

# Q5

?read.fwf
data <- read.fwf('wksst8110.for',
                 widths = c(-1, 9, -5, 4, -1, 3, -5, 4, -1,
                            3, -5, 4, -1, 3, -5, 4, -1, 3),
                 skip = 4)
head(data)
sum(data$V4)
