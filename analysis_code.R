library(tidyverse)
library(janitor)
install.packages("janitor")

# Load data
survey <- read_csv("class1_survey.csv")

# Clean column names (snake_case, short and simple)
survey <- survey %>% clean_names()

# See new names
colnames(survey)

# How many people like cats?
table(survey$do_you_like_cats)

# Favorite day of the week
table(survey$what_is_your_favorite_day_of_the_week)

# R experience level
summary(survey$what_is_your_level_of_r_experience_1_none_5_advanced)

# Favorite foods (top 10 responses)
survey %>%
  count(what_is_your_favorite_food, sort = TRUE) %>%
  head(10)

# Favorite season bar plot
ggplot(survey, aes(x = what_is_your_favorite_season)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Favorite Season", x = "Season", y = "Count") +
  theme_minimal()

# R experience histogram
ggplot(survey, aes(x = what_is_your_level_of_r_experience_1_none_5_advanced)) +
  geom_histogram(binwidth = 1, fill = "orange", color = "black") +
  labs(title = "R Experience Levels", x = "Level (1-5)", y = "Number of Students") +
  theme_minimal()
