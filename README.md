# The effectiveness of Just-Below Pricing
This project estimates, by delivering a PDF file, to what extent the use of just-below pricing (as opposed to round pricing) affects consumers' purchase behavior. In addition, it looks at how this relationship is affected by the price level of the product. In total, more than 2 million products from the Amazon UK website were included in the analysis, collected in 2023. The insights help price-setters determining whether to use just-below or round prices in order to maximize demand. 

## Research Motivation
$2.99 for a chocolate bar, $19.99 for a sweater, $1199.99 for a smartphone and even stores devoted to selling products priced at $0.99 - prices set just below a round number are widely known around the globe (Tripathi & Pandey, 2018). A recent pilot study, including more than 12.000 prices from web pages in the United States and Germany, concluded that these prices make up almost 65% of prices on the internet (Troll et al., 2024), highlighting the popularity of this strategy. One explanation for the popularity is that just-below prices lead to an underestimation effect, where prices ending in $0.99 (e.g., $14.99) are perceived as substantially lower than their round counterparts, positively affecting demand (Chang & Chen, 2014). As a result, one might argue that it is beneficial for price-setters to price their products and services just below the round number. 

However, results regarding the effectiveness of just-below pricing are mixed. Where studies conclude that just-below pricing has a positive effect on consumers' purchase decisions (Choi et al., 2014; Schindler & Kibarian, 2001), others report no or even a negative effect (Georgoff, 1972, Kim, Malkoc & Goodman, 2021; Tripathi & Pandey, 2018). As a result, for this project, we investigated the effectiveness of just-below pricing on consumers' purchase decisions by analyzing a large Amazon dataset from the UK consisting of more than 2 million products. In addition, it was tested whether this effect differed based on the price level of the product. By investigating the moderating effect of price level, possible reasons for the conflicting findings might be found, which adds to the existing knowledge regarding just-below pricing.

## Relevance
As indicated before, the conclusions regarding the effectiveness of just-below pricing are mixed. By looking into the moderating effect of price levels, the conflicting findings might be reconciled and additional knowledge regarding the use of just-below pricing might be added to the literature. In addition, these insights are of vital interest to price-setters who are contemplating the use of just-below pricing to drive demand. Specifically, the article provides answers to when and why the use of just-below pricing might (not) be preferred in a given context, providing price-setters with the needed information on how to price their goods.

## Research Question
**To what extent does just below pricing (as opposed to round pricing) affect consumers' purchase behavior and to what extent does this effect depend on the price level of the product?**

## Data
For this project, a large dataset from Kaggle (https://www.kaggle.com/datasets/asaniczka/amazon-uk-products-dataset-2023) was used, consisting of more than 2 million Amazon products from the UK. The data was scraped in October 2023 and, after data cleaning and variable operationalization, included the following variables:
|Variable                        |Description                                                                                     |
|--------------------------------|------------------------------------------------------------------------------------------------|
|Product_ID                      |Product ID from Amazon                                                                          |
|Product_Name                    |Name of the product                                                                             |
|StarRating                      |Average star rating of the product                                                              |
|Price                           |Current price of the product                                                                    |
|SalesLastMonth                  |Number of products sold in the last month                                                       |
|Product_Category                |Product category                                                                                |
|PriceEnding                     |Price ending of the product (digits after the whole number)                                     | 
|Price_Strategy                  |Price strategy used (just-below vs. Round vs. Other)                                            |
|Price_Bucket                    |Price level of the product                                                                      |

## Method
First, the data will be prepared for the analysis by removing missing and inaccurately recorded data. In addition, the variables needed for the analysis will be operationalized. Next, the data will be explored using ggplot and going over the summary statistics. Finally, the research question will be answered via the use of a multiple linear regression. A multiple linear regression is a suitable method as (1) it can deal with the measurement levels of the variables, (2) analyzes all the variables at ones, and (3) allows us to include control variables if deemed needed. 

## Preview of Findings 
- Describe the gist of your findings (save the details for the final paper!)
- How are the findings/end product of the project deployed?
- Explain the relevance of these findings/product. 

## Repository Overview 
``` 
- data
- reporting
- scr
 - analysis
 - data-preparation
- .gitignore
- README.md
- makefile
```

## Dependencies 
Make sure you have downloaded R via the instructions included [Here](https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/). 
In addition, make sure the following RPackages are installed:
```
install.packages("tidyverse")
install.packages("knitr")
install packages("ggplot2")
install.packages("dplyr")
install.packages("extrafont")
install.packages("readr")
```

## Running Instructions 
For this workflow to run, the following steps should be taken:

- Fork the repository
- Open your command-line (e.g., Git GUI)
- Create a copy of the repository to your local machine by copying the following sentence in your command-line:
```
git clone https://github.com/course-dprep/team-project-spring-2025-phd-team-1.git
```
- Set your working directory to the just copied repository
- Run Data Download.Rmd
- Run Data exploration.Rmd (this step is optional)
- Run Data Analysis.Rmd

## About 
Author: Anne van der Vliet, email: a.vdrvliet@tilburguniversity.edu

This project is set up as part of the Master's course [Data Preparation & Workflow Management](https://dprep.hannesdatta.com/) at the [Department of Marketing](https://www.tilburguniversity.edu/about/schools/economics-and-management/organization/departments/marketing), [Tilburg University](https://www.tilburguniversity.edu/), the Netherlands.

## References
Choi, J., Li, Y. J., Rangan, P., Chatterjee, P., & Singh, S. N. (2014). The odd-ending price justification effect: The influence of price-endings on hedonic and utilitarian consumption. Journal of the Academy of Marketing Science, 42(5), 545–557. https://doi.org/10.1007/s11747-014-0369-6  

Georgoff, D. M. (1972). Odd-even retail price endings: Their effects on value determination, product perception, and buying propensities.

Kim. J., Malkoc, S.A., Goodman, J.K., (2022). The Threshold-Crossing Effect: Just-Below Pricing Discourages Consumers to Upgrade, Journal of Consumer Research, 48(6), 1096–1112. https://doi.org/10.1093/jcr/ucab049 

Chang, H.-H., & Chen, F.-P. (2014). When is a 9-ending price perceived lower than a 0-ending price? The moderating role of price consciousness. International Journal of Business and Information, 9(1), 89–116. 

Schindler, R. M., & Kibarian, T. M. (2001). Image communicated by the use of 99 endings in advertised prices. Journal of Advertising, 30(4), 95–99. https://doi.org/10.1080/00913367.2001.10673654 

Tripathi, A., & Pandey, N. (2018) Are Nine-Ending Prices Equally Influential in Eastern Culture for Pricing Green Products?, Journal of International Consumer Marketing, 30(3), 192-205. https://doi.org/10.1080/08961530.2017.1384711 

Troll, E. S., Frankenbach, J., Friese, M., & Loschelder, D. D. (2024). A meta‐analysis on the effects of just‐below versus round prices. Journal of Consumer Psychology, 34(2), 299–325. https://doi.org/10.1002/jcpy.1353 
