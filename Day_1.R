library(tidyverse)


wholesale <- read_csv(
  file = if (file.exists("~/Documents/Data visualization/Wholesale_customers_data.csv")) {
    "~/Documents/Data visualization/Wholesale_customers_data.csv"
  } else {
    "Lecture 1 - dplyr/data/Wholesale_customers_data.csv"
  },
  show_col_types = FALSE
)

wholesale

class(wholesale)
wholesale

wholesale$Channel

wholesale[,1]

wholesale |> 
  glimpse(width = 70)

library(skimr)

skim(wholesale)

summarise(group_by(wholesale, Channel), mean_fresh = mean(Fresh))

wholesale |> 
  group_by(Channel) |>
  summarise(mean_fresh = mean(Fresh))

wholesale |>
  filter(Channel == "Retail" | Fresh > 50000)

wholesale |>
  select(Channel, Region, Fresh, Grocery)

wholesale |>
  select(starts_with("De"))

wholesale |> select(ends_with("en"))

wholesale |> select(contains("ro"))

wholesale |> select(-Region, -Milk) # Exclude columns with minus sign

wholesale |>
  arrange(desc(Grocery)) |>
  select(Channel, Region, Grocery, Milk, Detergents_Paper)

wholesale |> select(-contains("en")) # Exclude columns with 'en' in it


"""
wholesale <- wholesale |>
  mutate(
    total_spend = Fresh +
      Milk +
      Grocery +
      Frozen +
      Detergents_Paper +
      Delicassen
  )
"""

wholesale = wholesale |>
  mutate(
    total_spend = Fresh +
      Milk +
      Grocery +
      Frozen +
      Detergents_Paper +
      Delicassen
  )
wholesale

wholesale |>
  mutate(
    share_fresh = Fresh / total_spend,
    share_grocery = Grocery / total_spend
  ) |>
  select(Channel, share_fresh, share_grocery)

'''wholesale |>
  summarise(
    n = n(),
    avg_total = mean(total_spend),
    med_total = median(total_spend),
    .by = Channel
  )'''


wholesale |>
  summarise(
    n = n(),
    avg_total = mean(total_spend),
    med_total = median(total_spend),
    .by = Channel
  )

wholesale |>
  group_by(Channel) |>
  summarise(avg_fresh = mean(Fresh))

wholesale |>
  summarise(avg_fresh = mean(Fresh), .by = Channel)


wholesale = wholesale |>
  mutate(
    share_grocery = Grocery/total_spend,
    share_fresh = Fresh / total_spend
  )

wholesale |>
  filter(share_grocery > 0.3) |>
  arrange(desc(total_spend)) |>
  summarise(
    numb_of_filter = n())

wholesale |>
  summarise(
    n = n(),
    mean_fresh = mean(Fresh),
    median_fresh = median(Fresh),
    sd_fresh = sd(Fresh),
    .by = Channel
  )

# Find the top 5 customers by Milk spending 
# within each Region (hint: use slice_max())
wholesale |>
  group_by(Region) |>
  slice_max(order_by = Milk, n = 5,with_ties = FALSE) |>
  select(Region, Milk, Fresh, Grocery)

#Create a new variable high_spender that is TRUE if 
# total_spend is above the median, FALSE otherwise. 
# Count how many high spenders are in each Channel.
high_spender_counts = wholesale |>
  mutate(total_spend = Milk + Fresh + Grocery + Frozen + 
    Detergents_Paper + Delicassen) |>
  mutate(high_spender = total_spend > median(total_spend)) |>
  count(Channel, high_spender)

high_spender_counts
