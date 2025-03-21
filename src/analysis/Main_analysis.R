# Load needed packages
library(tidyverse)
library(dplyr)
library(broom)
library(ggpubr)
library(ggplot2)
library(gridExtra)
library(grid)

# Load dataset based on "Data Download.Rmd"
Amazon_UK_Top10 <- read_csv("../../gen/data-preparation/output/AmazonDataTop10.csv")

# Assumptions linear regression
# Normality check by inspecting the data
ggplot(Amazon_UK_Top10, aes(SalesLastMonth))+ geom_histogram(binwidth = 25)+ xlim(0, 4000) + ylim(0, 2000)
# Since normality does not hold, take the log
Amazon_UK_Top10$SalesLastMonthAdjusted <- Amazon_UK_Top10$SalesLastMonth + 1
Amazon_UK_Top10$SalesLog <- log(Amazon_UK_Top10$SalesLastMonthAdjusted)

## Include star rating as a covariate
MainLinModelcov <- lm(SalesLog ~ Price_Strategy + Price_Strategy * Price + StarRating, data = Amazon_UK_Top10)
### Save output as PNG
model_summary2 <- summary(MainLinModelcov)
model_text2 <- capture.output(model_summary2)
text_grob <- textGrob(paste(model_text2, collapse = "\n"), gp = gpar(fontsize = 10, fontfamily = "mono"))
ggsave("../../gen/analysis/output/regressioncov_summary.png", plot = text_grob, width = 8, height = 6, dpi = 300)
ggsave("regressioncov_summary.png", plot = text_grob, width = 8, height = 6, dpi = 300)

## Run a regression for every product category separately
result <- Amazon_UK_Top10 %>%
  group_by(Product_Category) %>%
  do({
    model <- lm(SalesLog ~ Price_Strategy + Price_Strategy * Price + StarRating, data = .)
    tidy_model <- tidy(model)
    tidy_model
  })
### Save output as PNG
grid_table <- tableGrob(result)
ggsave("../../gen/analysis/output/model_coefficients_table.png", plot = grid_table, width = 10, height = 20, dpi = 300)
ggsave("model_coefficients_table.png", plot = grid_table, width = 10, height = 20, dpi = 300)