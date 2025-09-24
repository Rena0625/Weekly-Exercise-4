
library(readr)
library(dplyr)

olympics <- read_csv("Olympics.csv")

olympics <- mutate(olympics, total.medals = gold + silver + bronze)

medals_country <- group_by(olympics, country)
medals_country <- summarise(medals_country,
                             total_gold = sum(gold, na.rm = TRUE))

medals_year <- group_by(olympics, year)
medals_year <- summarise(medals_year,
                            total_medals_given = sum(total.medals, na.rm = TRUE))

head(olympics)
head(medals_country)
head(medals_year)
