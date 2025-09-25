#Q4

# Default branch is usually "main"

#Q6

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

#Q7

olympics_1992 <- filter(olympics, year == 1992)

max_ath <- max(olympics_1992$athletes, na.rm = TRUE)

largest_1992 <- filter(olympics_1992, athletes == max_ath)
largest_1992 <- select(largest_1992, country, athletes)

largest_1992


five_ctrs <- c("United States", "France", "Germany", "Russia", "China")

gold_time <- filter(olympics, country %in% five_ctrs)
gold_time <- group_by(gold_time, country, year)
gold_time <- summarise(gold_time,
                       total_gold = sum(gold, na.rm = TRUE))

ggplot(gold_time, aes(x = year, y = total_gold, color = country)) +
  geom_line() +
  geom_point() +
  labs(title = "Gold Medals Over Time (Five Countries)",
       x = "Year", y = "Gold Medals")

