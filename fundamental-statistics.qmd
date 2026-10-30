# Fundamental Statistics (Cross-sectional)

## Descriptive Statistics

### Summary table

- **Functions:** gtsummary package

## Statistical Inference

### Parametric Tests

#### Compare means

- **Functions:**
  - gtsummary package: `tbl_summary()` with `add_p()`
  - modelsummary package: `datasummary()`
- **Comment:**
  - gtsummary is very full-featured, and its output tables are customizable and look great. `add_p()` chooses the test for each variable by its type, not by whether the data are normal: by default, continuous variables get a nonparametric test (Wilcoxon rank-sum for two groups, Kruskal-Wallis for more), and categorical variables get a chi-square test (Fisher's exact test when expected counts are small). For a t-test, use `add_p(test = all_continuous() ~ "t.test")`.
  - modelsummary is also a very powerful package that outputs good-looking tables. It can do most of what gtsummary can.
- **Resources:** [gtsummary: tbl_summary() tutorial](https://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html), [modelsummary: Data summaries](https://modelsummary.com/vignettes/datasummary.html#datasummary_correlation)

#### Bivariate correlation

### Nonparametric Tests

When data are not normally distributed, the mean and standard deviation may be distorted, so when reporting summary statistics it is better to consider more robust statistics, such as the median and interquartile range.

- **Resources:** [Newsom: Categorical Data Analysis class](https://web.pdx.edu/~newsomj/cdaclass/)
