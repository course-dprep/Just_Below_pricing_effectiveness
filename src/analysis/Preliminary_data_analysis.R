# Load needed packages
library(tidyverse)
library(knitr)
library(dplyr)
library(readr)
library(rmarkdown)
library(tinytex)
library(ggplot2)
library(gridExtra)
library(grid)
library(ggpubr)

# Load dataset
Amazon_UK_Top10 <- read_csv("../../gen/data-preparation/output/AmazonDataTop10.csv")

# Create directories to save output
dir.create('../../gen/analysis')
dir.create('../../gen/analysis/output')

## Descriptive statistics
# Descriptive statistics table
DescriptivesTable <- Amazon_UK_Top10 %>% 
  group_by(Product_Category) %>% 
  summarise(AmountofProducts = n(),
            PricedasJustBelow = sum(Price_Strategy == "just-below", na.rm = TRUE),
            PercentageJustBelow = paste0(round((PricedasJustBelow / AmountofProducts) * 100, 0), "%"),
            AveragePrice = paste0("$", (round(mean(Price, na.rm = TRUE), 2))), 
            MaxPrice = paste0("$", (max(Price, na.rm = TRUE))),
            MinPrice = paste0("$", (min(Price, na.rm = TRUE))),
            AverageReviewRating = round(mean(StarRating, na.rm = TRUE), 1))
# Save table as PNG
png("../../gen/analysis/output/DescriptivesTable.png", width = 1200, height = 600)  # Adjust dimensions as needed
grid.table(DescriptivesTable)
dev.off()


## ANOVA main effect IV-DV
# ANOVA
anova_IVDV <- aov(SalesLastMonth ~ Price_Strategy, data = Amazon_UK_Top10)
summary(anova_IVDV)
# Save output as PNG
anova_summary <- capture.output(summary(anova_IVDV))
png("../../gen/analysis/output/anova_output.png", width = 1200, height = 600, res = 150)
grid.newpage()
formatted_text <- paste(anova_summary, collapse = "\n")
grid.text(formatted_text, x = 0.5, y = 0.5, just = "center", gp = gpar(fontsize = 16, fontface = "bold"))
dev.off()

# Post-hoc Test
tukey_resultIVDV <- TukeyHSD(anova_IVDV)
tukey_resultIVDV
# Save output as PNG
tukey_df <- as.data.frame(tukey_resultIVDV$Price_Strategy)
tukey_df$Comparison <- rownames(tukey_df)
colnames(tukey_df) <- c("Mean Difference", "Lower CI", "Upper CI", "p-value", "Comparison")
tukey_df <- tukey_df[, c("Comparison", "Mean Difference", "Lower CI", "Upper CI", "p-value")]
tukey_table <- ggtexttable(tukey_df, rows = NULL, theme = ttheme("mBlue"))
ggsave("../../gen/analysis/output/TukeyHSD_table.png", tukey_table, width = 12, height = 6, dpi = 300)

# Means table
MeansTable <- Amazon_UK_Top10 %>%
  group_by(Price_Strategy) %>%
  summarise(Mean_Sales = mean(SalesLastMonth, na.rm = TRUE))
# Save output as PNG
table_plot <- ggtexttable(MeansTable, rows = NULL, theme = ttheme("mBlue"))
ggsave("../../gen/analysis/output/MeansTable.png", table_plot, width = 10, height = 5, dpi = 300)

## Linear regression price on sales
# Run regression price level on sales last month
PriceLevelmodel <- lm(SalesLastMonth ~ Price, data = Amazon_UK_Top10)
# Save output as PNG
model_summary <- capture.output(summary(PriceLevelmodel))
png("../../gen/analysis/output/PriceLevelmodel_summary.png", width = 1600, height = 800, res = 150)
grid.newpage()
formatted_text <- paste(model_summary, collapse = "\n")
grid.text(formatted_text, x = 0.5, y = 0.5, just = "center", gp = gpar(fontsize = 14, fontface = "bold"))
dev.off()
