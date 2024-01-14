#### Preamble ####
# Purpose: clean monthly toronto foodbank data for 2013 Sep-2023 Sep
# Author: Moohaeng Sohn
# Date: Jan 13, 2024
# Contact: alex.sohn@mail.utoronto.ca

#### Workspace setup ####
# Load packages
library(tidyverse)
library(janitor)
library(lubridate)

#### Clean data ####
# load raw data
raw_data <- read.csv("inputs/data/toronto_foodbank_data.csv")
# clean data
# change dates in string format to int https://stackoverflow.com/a/76469586
# filter data to be between 2013-09-01 and 2023-09-01
cleaned_data <-
  clean_names(raw_data) |>
  mutate(period = recode(period,
   Jan = 1,
   Feb = 2,
   Mar = 3,
   Apr = 4,
   May = 5,
   Jun = 6,
   Jul = 7,
   Aug = 8,
   Sep = 9,
   Oct = 10,
   Nov = 11,
   Dec = 12
  )) |>
  mutate(date = make_date(year, period, 1)) |>
  select(date, visits = value) |>
  filter(as.Date("2013-09-01") <= date & date <= as.Date("2023-09-01"))

#### Save data ####
write_csv(
  x = cleaned_data,
  file = "outputs/data/cleaned_toronto_foodbank_visits.csv"
)

         