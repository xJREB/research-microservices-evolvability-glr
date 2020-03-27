# Delete current environment variables --------
rm(list = ls(all.names = TRUE))

# Load required packages -------
library(irr)
library(dplyr)

# Read data ------------
raw <- read.csv("interrater-results.csv")
str(raw)
summary(raw)

# Calculate interrater reliability ------------

#iteration <- c(1, 2, 3, 4)
iteration <- c(4)
data <- raw %>%
  filter(round %in% iteration) %>% 
  # filter(source != "SE") %>%
  select(rater1, rater2)

# Percentage of agreement
agree(data)

# Cohen's Kappa (0: no agreement, 1: total agreement)
kappa2(data)
