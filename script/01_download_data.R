#### Preamble ####
# Purpose: Get data on 2024 major crimes indicator
# Author: Yiyi Yao
# Email: ee.yao@mail.utoronto.ca
# Date: 21 January 2024
# Prerequisites: -

#ChatGPT was used in this part#

#### Workspace setup ####
install.packages("janitor")
library("janitor")
install.packages("knitr")
library("knitr")
install.packages("lubridate")
library("lubridate")
install.packages("opendatatoronto")
library("opendatatoronto")
install.packages("tidyverse")
library("tidyverse")


#### Acquire ####
toronto_crimes <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/major-crime-indicators/
  list_package_resources("major-crime-indicators") |>
  # Within that package, we are interested in the 2024 dataset
  filter(name == 
           "major-crime-indicators.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

write_csv(
  x = toronto_crimes,
  file = "toronto_crimes.csv"
)

head(toronto_crimes)