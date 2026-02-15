library(dplyr)

library(tidyr)

library(ggplot2)

library(readr)

library(janitor)

dta<-read.csv("E:/rdata/HEALTH _DATA/real_data.csv")

dta<-dta|>
  
  select(-X.1:-X.40)#removes columns

dta <- dta |>
  
  replace_na(list(dta==0))

dta <- dta |> 
  
  mutate(across(everything(), ~replace_na(.x, 0)))#"Take the dataset, then modify it across every column by replacing the NAs found in that specific column with a zero."

dta<-dta|>
  
  slice(-(1:3))#removed rows

dta <- dta |> 
  
  row_to_names(row_number = 1)

dta<-dta|>
  
  clean_names()

dta<-dta|>
  
  select(-x1999)

write.csv(dta,"E:/rdata/HEALTH _DATA/clean_dta.csv")



# Calculate the mean across all numeric columns for each row

dta <- dta |> 
  
  mutate(row_mean = rowMeans(across(where(is.numeric)), na.rm = TRUE))

dta <- dta |> 
  
  #  Convert zeros to NA (assuming 0 means "no data")
  
  mutate(across(where(is.numeric), ~na_if(.x, 0))) |> 
  
  
  
  #  Process row-by-row
  
  rowwise() |> 
  
  
  
  #  Calculate SD across numeric columns and add as new column
  
  mutate(spending_volatility = sd(c_across(where(is.numeric)), na.rm = TRUE))

# 1. Force the reduction to 5 rows and ensure data types

plot_data <- dta |> 
  
  ungroup() |>                         # <--- THIS IS THE MISSING KEY
  
  filter(!is.na(row_mean)) |> 
  
  slice_max(order_by = row_mean, n = 5)



# 2. CREATE THE PLOT - MAKE SURE IT USES 'plot_data'

ggplot(plot_data, aes(x = reorder(country_name, row_mean), y = row_mean)) +
  
  geom_col(fill = "steelblue") +
  
  coord_flip() +                
  
  labs(
    
    title = "Top 5 Countries by Healthcare Spending",
    
    x = "Country",
    
    y = "Mean Expenditure (% of GDP)"
    
  ) +
  
  theme_minimal()





