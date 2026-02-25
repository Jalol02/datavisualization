# =============================================================================
# Positron Assistant Demo
# Examples to showcase AI-assisted coding capabilities
# =============================================================================
library(tidyverse)

# -----------------------------------------------------------------------------
# Example 1: Bug Fix Demo - Intentional errors for Positron to help fix
# -----------------------------------------------------------------------------

# BUG: Wrong function name
numbers <- c(1, 2, 3, 4, 5, NA)
average <- Mean(numbers, na.rm = TRUE)


# BUG: Using |> instead of + in ggplot2

wholesale <- readr::read_csv(here::here(
  "Lecture 1 - dplyr/data/Wholesale_customers_data.csv"
))

wholesale |>
  filter(Channel == "Horeca") |>
  ggplot(
    aes(x = Region, y = Fresh)
  ) |>
  geom_boxplot() +
  labs(
    title = "Fresh-category Purchases by Region",
    subtitle = "Horeca channel",
    x = "Region",
    y = "Fresh spending",
  )


# -----------------------------------------------------------------------------
# Example 2: Data Wrangling Task - wholesale example: average Fresh by Region
# -----------------------------------------------------------------------------
# Positron Assistant prompt:
# "Calculate the average Fresh spending by Region for Horeca customers, report the highest spending region first."

# -----------------------------------------------------------------------------
# Example 3: Visualization Request
# -----------------------------------------------------------------------------

# Create a visualization that displays the distribution of Fresh spending across different Regions for Horeca customers

# -----------------------------------------------------------------------------
# Example 4: Plot interpretation Request
# -----------------------------------------------------------------------------

#  Ask Positron Assistant:
# "Can you comment the current plot in the plot pane?"

# -----------------------------------------------------------------------------
# Example 5: Statistical Analysis
# -----------------------------------------------------------------------------

# Compare Fresh spending for Horeca vs Retail customers

# -----------------------------------------------------------------------------
# Example 6: Code Explanation Request
# -----------------------------------------------------------------------------

# Complex code snippet - ask Assistant to explain
mystery_function <- function(x) {
  sapply(seq_along(x), function(i) {
    sum(x[1:i]) / i
  })
}

#  Ask Positron Assistant:
# "What does this function do? Explain step by step"

# Many more thinsgs you can ask Positron Assistant to help with!
# Code Refactoring, Documentation requests,
# data transformation challenges,
# Error handling improvements, performance optimizations, and more.
