#load needed packages
library(knitr)
library(tidyverse)
library(rmarkdown)

# Download dataset
## Dataset was downloaded from Dropbox.
dropbox_url <- "https://www.dropbox.com/scl/fi/3jzhkicf953bsusjtu938/amz_uk_processed_data.csv?rlkey=ikvjt5kz4hy0tbdynrypb786n&st=6xb1y3g6&dl=1"
Amazon_UK <- read_csv(dropbox_url)

# Data Description before Data Preparation
## For this project, a large dataset from Kaggle (https://www.kaggle.com/) was used, consisting of `r nrow(Amazon_UK)` Amazon products from the UK.

# Create directories to save data
dir.create('../../gen')
dir.create('../../gen/data-preparation')
dir.create('../../gen/data-preparation/temp')
dir.create('../../gen/data-preparation/output')

# Save dataset in ../../gen/data-preparation
write.csv(Amazon_UK, file = "../../gen/data-preparation/temp/AmazonData.csv")
