#### Preamble ####
# Purpose: explore monthly toronto foodbank data for 2013 Sep-2023 Sep
# Author: Moohaeng Sohn
# Date: Jan 13, 2024
# Contact: alex.sohn@mail.utoronto.ca

#### Workspace setup ####
# Load packages
library(tidyverse)

#### Load in Data ####
cleaned_data <-
  read_csv(
    "outputs/data/cleaned_toronto_foodbank_visits.csv",
    show_col_types = FALSE
  )

#### Explore Data ####
# create a graph showing the change in visits to the foodbank
cleaned_data |>
  ggplot(aes(x = date, y = visits)) +
  geom_point() +
  labs(x = "Date",
       y = "Monthly Visits to the Food Bank") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma_format()) +
  expand_limits(y = 0)

