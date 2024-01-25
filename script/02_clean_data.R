#### Preamble ####
# Purpose: Clean data on 2024 major crimes indicator
# Author: Yiyi Yao
# Email: ee.yao@mail.utoronto.ca
# Date: 21 January 2024

#ChatGPT was used in this part#

# Load necessary libraries
library(tidyverse)
library(lubridate)

# Load the dataset
data <- read.csv("toronto_crimes.csv")

# Inspect the structure of the dataset
str(data)

# Handle missing values
# Assuming 'REPORT_DATE' and 'OCC_DATE' are crucial, let's check how many are missing
cat("Missing REPORT_DATE:", sum(is.na(data$REPORT_DATE)), "\n")
cat("Missing OCC_DATE:", sum(is.na(data$OCC_DATE)), "\n")

# For simplicity, if the missing values are significant, consider dropping these rows
# If they are not, we might fill them with approximations or drop the columns if not needed
# Here, we'll assume dropping rows with missing 'REPORT_DATE' as an example
data_clean <- data %>% filter(!is.na(REPORT_DATE))

# Convert date columns to Date type
data_clean$REPORT_DATE <- as.Date(data_clean$REPORT_DATE, format="%Y-%m-%d")
data_clean$OCC_DATE <- as.Date(data_clean$OCC_DATE, format="%Y-%m-%d")

# Ensure categorical data consistency
# Example: Checking unique values for a cleanup
unique(data_clean$OFFENCE)

write_csv(
  x = data_clean,
  file = "data_clean.csv"
)
