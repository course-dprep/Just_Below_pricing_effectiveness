# Load needed packages
library(tidyverse)
library(knitr)
library(ggplot2)
library(dplyr)
library(extrafont)
library(readr)
library(rmarkdown)
library(tinytex)

# Load dataset based on "Data Download.Rmd"
Amazon_UK <- read_csv("../../gen/data-preparation/output/AmazonData.csv")

# Creation of Top 10 categories
Categories = unique(Amazon_UK$Product_Category)
Categories = Amazon_UK %>% group_by(Product_Category) %>% summarize(Product_count = n()) %>% mutate(ranking = rank(-Product_count)) %>% mutate(top = ranking <= 10)
Categories_filtered = Categories %>% filter(top==T) %>% pull(Product_Category)

# Price ending distribution 
## Overall distribution price endings
OverallDistr <- Amazon_UK %>% ggplot(aes(x = PriceEnding)) + 
  geom_bar() +
  labs(title = "Overall distribution price endings",
       x = "Price endings",
       y = "Sum") +
  theme_bw() +
  theme(panel.grid = element_blank())
#Save output to PNG
ggsave("../../gen/analysis/output/OverallDistrPriceEnding.png", plot = OverallDistr, width = 8, height = 6, dpi = 300)

## Overall distribution price endings for top 10 categories
OverallDistrtop10 <- Amazon_UK %>% filter(Product_Category %in% Categories_filtered) %>%
  ggplot(aes(x = PriceEnding)) + 
  geom_bar() +
  labs(title = "Overall distribution price endings for top 10",
       x = "Price endings",
       y = "Sum") +
  theme_bw() +
  theme(panel.grid = element_blank())
#Save output to PNG
ggsave("../../gen/analysis/output/OverallDistrPriceEndingTop10.png", plot = OverallDistrtop10, width = 8, height = 6, dpi = 300)

## Zooming in on prices ending in .90 until .00
DistrZoomed <- Amazon_UK %>% filter(PriceEnding >= 0.90) %>% 
  ggplot(aes(x = PriceEnding)) + 
  geom_bar() +
  labs(title = "Distribution price endings .90 until .00",
       x = "Price endings",
       y = "Sum") +
  theme_bw() +
  theme(panel.grid = element_blank())
## Save output to PNG
ggsave("../../gen/analysis/output/DistrPriceEndingZoomed.png", plot = DistrZoomed, width = 8, height = 6, dpi = 300)

## Zooming in on prices ending in .90 until .00 for top 10 categories
DistrZoomedTop10 <- Amazon_UK %>% filter(PriceEnding >= 0.90) %>%
  filter(Product_Category %in% Categories_filtered) %>% 
  ggplot(aes(x = PriceEnding)) + 
  geom_bar() +
  labs(title = "Distribution price endings .90 until .00 top 10 categories",
       x = "Price endings",
       y = "Sum") +
  theme_bw() +
  theme(panel.grid = element_blank())
## Save output to PNG
ggsave("../../gen/analysis/output/DistrPriceEndingZoomedTop10.png", plot = DistrZoomedTop10, width = 8, height = 6, dpi = 300)

# Price ending distribution per Product Category
## Distribution price endings top 10 categories
output_dir <- "../../gen/analysis/output"  # Change this to your desired directory
# Ensure the directory exists, create it if it doesn't
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}

Amazon_filtered <- Amazon_UK %>% filter(Product_Category %in% Categories_filtered)

for (cat in unique(Amazon_filtered$Product_Category)) {
  df_cat <- Amazon_filtered %>% filter(Product_Category == cat)
  
  EndingDistrTop10Plots <- ggplot(df_cat, aes(x = PriceEnding)) + 
    geom_bar() + 
    labs(title = paste("Overall distribution price endings top 10 categories -", cat),
         x = "Price endings",
         y = "Sum") +
    theme_bw() +
    theme(panel.grid = element_blank(),
          legend.position = "none")
  
  # Create a safe filename by replacing spaces and special characters
  filename <- paste0("Price_Ending_Distribution_", gsub("[^A-Za-z0-9]", "_", cat), ".png")
  
  # Full path to save the file
  filepath <- file.path(output_dir, filename)
  
  # Save the plot
  ggsave(filepath, plot = EndingDistrTop10Plots, width = 8, height = 6, dpi = 300)
}

## Zooming in on prices ending in .90 until .00
output_dir <- "../../gen/analysis/output"  # Change this to your desired directory
# Ensure the directory exists, create it if it doesn't
if (!dir.exists(output_dir)) {
  dir.create(output_dir, recursive = TRUE)
}
Amazon_filtered <- Amazon_UK %>% 
  filter(PriceEnding >= 0.90) %>%
  filter(Product_Category %in% Categories_filtered)

for (cat in unique(Amazon_filtered$Product_Category)) {
  df_cat <- Amazon_filtered %>% filter(Product_Category == cat)
  
  EndingTop10Plots <- ggplot(df_cat, aes(x = PriceEnding)) + 
    geom_bar() + 
    labs(title = paste("Distribution price endings .90 until .00 top 10 -", cat),
         x = "Price endings",
         y = "Sum") +
    theme_bw() +
    theme(panel.grid = element_blank(),
          legend.position = "none")
  
  # Create a safe filename by replacing spaces and special characters
  filename <- paste0("Price_Ending_", gsub("[^A-Za-z0-9]", "_", cat), ".png")
  
  # Full path to save the file
  filepath <- file.path(output_dir, filename)
  
  # Save the plot
  ggsave(filepath, plot = EndingTop10Plots, width = 8, height = 6, dpi = 300)
}
