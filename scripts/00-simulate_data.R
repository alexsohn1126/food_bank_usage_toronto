#### Preamble ####
# Purpose: Simulate monthly toronto foodbank data for 2013 Sep-2023 Sep
# Author: Moohaeng Sohn
# Date: Jan 13, 2024
# Contact: alex.sohn@mail.utoronto.ca

#### Workspace setup ####
# Load packages
library(tidyverse)

#### Simulate data ####
# set the seed
set.seed(302)
# dates going from 2013 September 1st to 2023 September 1st increasing monthly
dates <- seq(as.Date("2013/9/1"), as.Date("2023/9/1"), "month")
# filter out year and month from dates and format it as YEAR/MONTH
dates_formatted <- format(dates, "%Y/%m")
# use the formatted dates and poisson distribution to simulate visits
simulated_foodbank_data <-
  tibble(
    date = dates_formatted,
    visits = rpois(length(dates_formatted), lambda = 25000)
  )
