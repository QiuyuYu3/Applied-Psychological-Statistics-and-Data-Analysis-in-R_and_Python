# Data Cleaning

## Before You Start

Questions

## Basic Procedure

1. Check unique values and ranges.

## Report Results

How does the literature report the results?

## Summary and Practice

### Missing and Conditional Values

#### Drop rows with missing values

- **Functions:** tidyr package: `drop_na()`

#### Assign a new value based on a condition

- **Functions:**
  - `case_when(condition ~ value)`: assigns the value where the condition is `TRUE`. Values that match no condition become `NA`, unless you add `.default = old_variable`.
  - `replace_when(x, condition ~ value)` (dplyr 1.2.0 or later): replaces the old value where the condition is `TRUE`; where it is `FALSE`, the old value doesn't change.
  - Recode old values into new ones: `recode_values(x, "old" ~ "new")` (dplyr 1.2.0 or later; it replaces `case_match()`, now deprecated, and `recode()`, now superseded).
- **Resources:** [dplyr: case_when and replace_when](https://dplyr.tidyverse.org/reference/case-and-replace-when.html), [dplyr: recode_values and replace_values](https://dplyr.tidyverse.org/reference/recode-and-replace-values.html)

#### Two-way condition

- **Functions:** `if_else(condition, true, false)`
- **Comment:** `case_when()` is more flexible. The logic of `if_else()`: you give a condition and it checks whether it is `TRUE` or `FALSE`. If it is `TRUE`, you get the first value; if it is `FALSE`, you get the second.
- **Resources:** [dplyr: if_else](https://dplyr.tidyverse.org/reference/if_else.html)

#### Replace a certain value (or vector) with NA

- **Functions:** `na_if(x, y)`
- **Comment:** For vectors, this function compares each element in `x` with the corresponding element in `y`. If they are equal, the corresponding element in `x` is replaced with `NA`.
- **Resources:** [dplyr: na_if](https://dplyr.tidyverse.org/reference/na_if.html)

### Group and Summarise

#### Group data

- **Functions:** `group_by()`
- **Resources:** [dplyr: group_by](https://dplyr.tidyverse.org/reference/group_by.html), [dplyr: Per-operation grouping with .by/by](https://dplyr.tidyverse.org/reference/dplyr_by.html)

#### Summarise data

- **Functions:** `summarise()`
- **Resources:** [dplyr: summarise](https://dplyr.tidyverse.org/reference/summarise.html)

#### Count observations

- **Functions:** `count()`
- **Resources:** [dplyr: count](https://dplyr.tidyverse.org/reference/count.html)

### Rows and Columns

#### Compute by row

- **Functions:** `rowwise(data, ...)`
- **Resources:** [dplyr: rowwise](https://dplyr.tidyverse.org/reference/rowwise.html)

#### Apply a function to many columns

- **Functions:** `across()`; Base R: `lapply()`

#### Split a column into several columns or rows

- **Functions:**
  - By a regular expression: `separate_wider_regex()`
  - By a delimiter: `separate_wider_delim(data, cols, delim, names = ...)`
  - Into rows: `separate_longer_delim()`
  - Older function: `separate()` (superseded by the `separate_wider_*()` functions)
- **Resources:** [tidyr: separate_wider_delim](https://tidyr.tidyverse.org/reference/separate_wider_delim.html)

#### Combine several columns into one

- **Functions:** `unite()`
- **Resources:** [tidyr: unite](https://tidyr.tidyverse.org/reference/unite.html)

### Other Packages

- data.table
- [bruceR](https://psychbruce.github.io/bruceR/)

## Syntax

### Check the data

```r
# Summarize one variable
summary(data$variable)
# Summarize all variables
summary(data)
```

### Compute scale scores

```r
mydata <- mydata %>%
  mutate(across(starts_with("item"), ~. + 1))
# Note: with na.rm = TRUE, a row with all items missing gets 0 instead of NA
mydata <- mydata %>%
  mutate(
    sub1 = rowSums(select(., starts_with("item")[1:5]), na.rm = TRUE),
  )
mydata <- mydata %>%
  mutate(total = rowSums(select(., c(sub1, sub2, sub3)), na.rm = TRUE))
```

### Count missing values

```r
library(DMwR2)
sum(rowSums(is.na(dataraw)) > 0.7 * ncol(dataraw)) # Number of rows with more than 70% missing
sum(!complete.cases(dataraw)) # Number of rows with any missing value
sum(is.na(dataraw)) # Number of missing responses
sum(!complete.cases(dataraw)) / nrow(dataraw) * 100 # Percentage of rows with any missing value
sum(is.na(dataraw)) / (ncol(dataraw) * nrow(dataraw)) * 100 # Percentage of missing responses

# Number of missing values per variable
missing_count <- colSums(is.na(dataraw))

# Percentage of missing values per variable
missing_percent <- missing_count / nrow(dataraw) * 100
# Store the results in a data frame
missing_summary <- data.frame(variable = names(missing_count),
                              missing_count = missing_count,
                              missing_percent = missing_percent)

library(naniar)
vis_miss(dataraw)
```

### Check normality

```r
# Test normality
library(modelsummary)
datasummary_skim(select(mydata, sub1, sub2, sub3, total, x1, x2, x3), title = "Summary", fmt = fmt_sprintf("%.2f"))
library(mvnormalTest)
mvnout <- mardia(select(mydata, sub1, sub2, sub3, total, x1, x2, x3))
## Shapiro-Wilk univariate normality test
mvnout$uv.shapiro
## Mardia multivariate normality test
mvnout$mv.test

library(MVN)
mvn(data_cor, univariate_test = "SW", mvn_test = "mardia")
```

### Recode values and convert types

```r
mydata$age[mydata$age %in% c(7, 8)] <- 3 # >65
mydata$group[mydata$group %in% c(4)] <- 0 # Reference group - 0

mydata <- mydata %>%
  mutate(race = case_when(
    race == "1" ~ "European American/Caucasian/White",
    race == "2" ~ "African American/Black",
    race == "3" ~ "Hispanic/Latino(a)",
    race == "4" ~ "Asian/Pacific Islander",
    race == "5" ~ "Other",
  ))

mydata <- mydata %>%
  mutate(across(c(marital, race, sex, education), as.factor))

mydata <- mydata %>%
  mutate(across(-c(marital, race, sex, education), as.numeric))

mydata2 <- mydata %>%
  mutate(race = case_when(
    race == "European American/Caucasian/White" ~ "European American/Caucasian/White",
    race == "African American/Black" ~ "African American/Black",
    race == "Hispanic/Latino(a)" ~ "Other",  # Recode Hispanic/Latino(a) as Other
    race == "Asian/Pacific Islander" ~ "Other",  # Recode Asian/Pacific Islander as Other
    race == "Other" ~ "Other"
  ))

recode_values(df$gender, "female" ~ 1, "male" ~ 0)

na_if(1:5, 5:1)
#> [1]  1  2 NA  4  5
```

### Summarize by group

```r
group_means <- mydata %>%
  group_by(group) %>%
  summarise(
    across(starts_with("QA"), ~ mean(.x, na.rm = TRUE)),
    across(starts_with("FQA"), ~ mean(.x, na.rm = TRUE)),
    across(starts_with("F2QA"), ~ mean(.x, na.rm = TRUE)),
    across(starts_with("QB"), ~ mean(.x, na.rm = TRUE)),
    across(starts_with("FQB"), ~ mean(.x, na.rm = TRUE)),
    across(starts_with("F2QB"), ~ mean(.x, na.rm = TRUE))
  ) %>%
  pivot_longer(
    cols = -group,
    names_to = "Variable",
    values_to = "Mean"
  ) %>%
  mutate(
    Time = case_when(
      str_detect(Variable, "^QA|^QB") ~ "T1",
      str_detect(Variable, "^FQA|^FQB") ~ "T2",
      str_detect(Variable, "^F2QA|^F2QB") ~ "T3",
      TRUE ~ "Other"
    )
  ) %>%
  ungroup()

group_means <- group_means %>%
  mutate(
    name_2 = case_when(
      str_detect(Variable, "QA_D$") ~ "A_D",
      str_detect(Variable, "QA_P$") ~ "A_P",
      str_detect(Variable, "QA_T$") ~ "A_T",
      str_detect(Variable, "QA_U$") ~ "A_U",
      str_detect(Variable, "QB_T$") ~ "B_T",
      TRUE ~ Variable
    )
  ) %>%
  ungroup()

race_counts <- mydata %>%
  group_by(race) %>%
  summarise(count = n()) %>%
  mutate(percentage = count / sum(count) * 100)
```

### Create grouping variables

```r
mydata <- mydata %>%
  mutate(
    G_score1 = case_when(
      score1 > 5 ~ 1,
      score1 <= 5 ~ 0,
      TRUE ~ NA_real_
    )
  )

# convert_to_group() is a user-defined function, not shown here
mydata <- mydata %>%
  mutate(
    G_score2 = convert_to_group(score2),
    G_score3 = convert_to_group(score3),
  )

mydata <- mydata %>%
  mutate(
    Any_G = case_when(
      rowSums(across(starts_with("G_")), na.rm = TRUE) > 0 ~ 1,
      rowSums(is.na(across(starts_with("G_")))) == length(across(starts_with("G_"))) ~ NA_real_,
      TRUE ~ 0
    )
  )
```

## Assignment

## Resources & References

### Further Study

Recommended classes or training
