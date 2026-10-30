# Missing Values

## Before You Start

1. Why do we have to deal with missing values?
2. Where do missing values come from?
3. What are the categories of missing values?
4. How should we handle them? Will missing values influence our results?

## Basic Procedure

Answering the questions:

1. Deletion methods assume the data are missing completely at random (MCAR). When that assumption does not hold, deleting cases can bias the results.
2. Multiple imputation (MI) and full information maximum likelihood (FIML) are currently popular; FIML is more commonly used in structural equation modeling.
3. Compare the results before and after handling the missing values (how to compare them: to be added).
4. Assess the type of missing values: no test can confirm it, because whether data are missing not at random depends on values you never observed. But researchers often use:
    1. t-tests comparing cases with and without a missing value on one variable, on each of the other variables
    2. Little's MCAR test, which is not very reliable but still popular
5. What to report: the number of imputations (m), the number of iterations, and how much data is missing and in what pattern.
6. Exogenous variables, covariates
7. How do I decide how to handle the missing values?
    1. First, from theory
    2. Then from statistics: detect which kind of missingness you have

## Report Results

How does the literature report the results?

## Summary and Practice

### Check the number and percentage of missing values

- **Variable types:** All
- **When to use:** When you finish collecting data, you may want to check the data quality and the attrition rate, and decide whether to keep the data or variables.
- **Functions:** gtsummary package: `tbl_summary()` with `add_n()` (see [Syntax](#syntax))
- **Resources:** [Stack Overflow: Add frequency and % of missing values in gtsummary](https://stackoverflow.com/questions/71580596/add-frequency-and-of-missing-values-in-gtsummary)

### Treat codes such as 999 as missing when importing

- **Functions:** `read.csv("data.csv", na.strings = c("NA", "999"))`

## Syntax

Apart from the gtsummary example, the examples use the simulated dataset described in [Example Data](Example%20Data.md).

### Report missing values with gtsummary

```r
library(dplyr)
library(gtsummary) # trial is an example dataset in gtsummary

# add % missing in new column
tbl1 <-
  trial %>%
  tbl_summary(
    by = trt,
    include = response,
    type = all_dichotomous() ~ "categorical",
    missing = "no"
  ) %>%
  add_p() %>%
  add_n(statistic = "{N_miss} ({p_miss}%)") %>%
  modify_header(n = "**Missing**")

# prepare tbl_summary with rows for missing, then merge in p-values
tbl2 <-
  trial %>%
  dplyr::mutate(response = forcats::fct_na_value_to_level(factor(response), level = "(Missing)")) %>%
  tbl_summary(
    by = trt,
    include = response,
    label = list(response = "Tumor Response")
  ) %>%
  list(tbl1 %>% modify_column_hide(c(n, all_stat_cols()))) %>%
  tbl_merge(tab_spanner = FALSE)
```

### Little's MCAR test with naniar

```r
library(dplyr)
library(naniar)
mydata <- read.csv("data/mydata.csv")
# Convert the listed variables to factors with mutate() and across()
mydata <- mydata %>%
  mutate(across(c(gender, race, income, education, age_group, C1:C10), factor))

# Little's MCAR test assumes multivariate normality, so it is not recommended for skewed data
NAresult <- mcar_test(mydata)
NAresult
```

### Multiple imputation with mice

```r
library(dplyr)
library(mice)
mydata <- read.csv("data/mydata.csv")
# mice needs categorical variables as factors; a character column is dropped as a constant
mydata <- mydata %>%
  mutate(gender = factor(gender))

### Simple mice workflow
# Step 1: impute m datasets; drop the ID column first (mice(select(mydata, -id)) alone uses the defaults m = 5, maxit = 5)
imp <- mice(select(mydata, -id), m = 5, maxit = 50, method = "pmm")

# Step 2: fit the same model on every imputed dataset
fit <- with(imp, lm(A1 ~ age + gender))

# Step 3: pool the results with Rubin's rules
summary(pool(fit))

# Do not analyze complete(imp): it returns only the first imputed dataset, which is single imputation
# Use complete() to inspect or export the imputed data instead
data_long <- complete(imp, action = "long", include = TRUE) # all m datasets stacked; .imp = 0 is the original data

### Advanced mice workflow
# Step 1: initialize a mice object without running any iterations
init <- mice(select(mydata, -id), maxit = 0)

# Step 2: extract method vector and predictor matrix
(meth <- init$method) # the imputation method for each variable, chosen by its data type
(pred <- init$predictorMatrix) # each row represents an imputation (regression) model

# Step 3: edit method vector and/or predictor matrix
meth[4] <- "pmm"

# Step 4: run imputations
mice.out.adv <- mice(select(mydata, -id),
                     predictorMatrix = pred,
                     method = meth,
                     m = 20,
                     maxit = 10)

# Diagnostic plots
plot(mice.out.adv) # visualize change in parameters from iteration to iteration
stripplot(mice.out.adv) # visualize distributions of imputed data vs. observed data

# Then analyze and pool as in the simple workflow
fit.adv <- with(mice.out.adv, lm(A1 ~ age + gender))
summary(pool(fit.adv))
```

## Resources & References

- [Paperspace: Comparing techniques for handling missing data in random datasets for building predictive models](https://blog.paperspace.com/missing-data-techniques/)
- [Flexible Imputation of Missing Data (van Buuren): Missing data pattern](https://stefvanbuuren.name/fimd/missing-data-pattern.html)
- [naniar: Getting started](https://cran.r-project.org/web/packages/naniar/vignettes/getting-started-w-naniar.html): a package for exploring missing values
- [naniar: Visualising missing data](https://cran.r-project.org/web/packages/naniar/vignettes/naniar-visualisation.html)
- [janitor: Overview of janitor functions](https://cran.r-project.org/web/packages/janitor/vignettes/janitor.html)

### Multiple Imputation

Because there are many potential decisions, researchers should conduct sensitivity analyses such as applying different decision-making rules to test the robustness of results (e.g., threshold of significance or meaningful effect sizes for the inclusion of auxiliary variables) or examining samples and model results before and after multiple imputation.

I recommend reading this paper in detail:

- Woods, A. D., Gerasimova, D., Van Dusen, B., Nissen, J., Bainter, S., Uzdavines, A., Davis-Kean, P. E., Halvorson, M., King, K. M., Logan, J. A. R., Xu, M., Vasilev, M. R., Clay, J. M., Moreau, D., Joyal-Desmarais, K., Cruz, R. A., Brown, D. M. Y., Schmidt, K., & Elsherif, M. M. (2024). Best practices for addressing missing data through multiple imputation. *Infant and Child Development*, *33*(1), e2407. https://doi.org/10.1002/icd.2407
    - Materials from the SIPS 2021 hackathon behind this paper: [OSF project](https://osf.io/j3f8m/)

Other references:

- Woods, A. D., Davis-Kean, P., Halvorson, M. A., King, K. M., Logan, J. A. R., Xu, M., Bainter, S., Brown, D. M. Y., Clay, J. M., Cruz, R. A., Elsherif, M. M., Gerasimova, D., Joyal-Desmarais, K., Moreau, D., Nissen, J., Schmidt, K., Uzdavines, A., Van Dusen, B., & Vasilev, M. R. (2021). *Missing data and multiple imputation decision tree*. PsyArXiv. https://doi.org/10.31234/osf.io/mdw5r
- Austin, P. C., White, I. R., Lee, D. S., & van Buuren, S. (2021). Missing data in clinical research: A tutorial on multiple imputation. *Canadian Journal of Cardiology*, *37*(9), 1322-1331. https://doi.org/10.1016/j.cjca.2020.11.010

### Further Study

Recommended classes or training
