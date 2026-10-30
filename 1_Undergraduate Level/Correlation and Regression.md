# Correlation and Regression

## Before You Start

Questions to open with.

## Basic Procedure

Answering the questions.

## Report Results

How does the literature report the results?

## Summary and Practice

## Syntax

Explain and comment the code.

### Correlation table

```r
library(sjPlot)
data_cor <- mydata[, c("C_total", "B_s1", "B_s2", "B_s3", "A_s1", "A_s2", "A_s3", "B_total", "A_total")]
tab_corr(data_cor,
         corr.method = "spearman",
         title = "Correlation",
         triangle = "lower",
         show.p = TRUE)
```

### Logistic regression

```r
library(gtsummary)
theme_gtsummary_compact()

gt_r1 <- glm(y1 ~ C_total + gender + education + income + A_s1 + A_s2 + A_s3 + B_s1 + B_s2 + B_s3, data_complete, family = binomial) %>%
  tbl_regression(exponentiate = TRUE,
                 pvalue_fun = ~ style_pvalue(.x, digits = 3)) %>%
  add_significance_stars(
    hide_p = FALSE,
    pattern = "{p.value}{stars}"
  )

gt_r2 <- glm(y2 ~ C_total + gender + education + income + A_s1 + A_s2 + A_s3 + B_s1 + B_s2 + B_s3, data_complete, family = binomial) %>%
  tbl_regression(exponentiate = TRUE,
                 pvalue_fun = ~ style_pvalue(.x, digits = 3)) %>%
  add_significance_stars(
    hide_p = FALSE,
    pattern = "{p.value}{stars}"
  )

gt_r3 <- glm(y3 ~ C_total + gender + education + income + A_s1 + A_s2 + A_s3 + B_s1 + B_s2 + B_s3, data_complete, family = binomial) %>%
  tbl_regression(exponentiate = TRUE,
                 pvalue_fun = ~ style_pvalue(.x, digits = 3)) %>%
  add_significance_stars(
    hide_p = FALSE,
    pattern = "{p.value}{stars}"
  )

tbl_merge(
  list(gt_r1, gt_r2, gt_r3),
  tab_spanner = c("**Outcome 1**", "**Outcome 2**", "**Outcome 3**")
)
```

## Resources & References

References.

### Further Study
