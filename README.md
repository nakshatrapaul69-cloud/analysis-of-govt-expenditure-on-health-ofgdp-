# analysis-of-govt-expenditure-on-health-ofgdp-
This project processes and visualizes healthcare expenditure data from various countries. The goal is to:
Clean a raw dataset
Handle missing values
Compute statistical metrics (mean and volatility of spending)
Visualize the top 5 countries by average healthcare spending (% of GDP)

# Libraries Used

dplyr – Data manipulation and transformation
tidyr – Handling missing values
ggplot2 – Visualization
readr – Reading CSV files
janitor – Cleaning column names and row names


# Data Cleaning Steps

Removed irrelevant columns (X.1 to X.40 and x1999)
Removed the first 3 rows of metadata
Replaced NAs with 0 temporarily for calculations
Converted the first row into column names
leaned column names using clean_names()

# Data Transformation

Row Mean – Average healthcare expenditure per country
Replace 0 with NA – Treat 0 as missing data
Spending Volatility – Standard deviation of expenditure across numeric columns

# Visualization

Top 5 Countries – Based on mean healthcare expenditure
Bar Plot – Horizontal bars, colored steel blue, minimal theme
X-axis: Country names
Y-axis: Mean expenditure (% of GDP)
