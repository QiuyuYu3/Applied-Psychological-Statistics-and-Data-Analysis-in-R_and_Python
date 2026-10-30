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

The examples use the scored version of the simulated dataset described in [Example Data](Example%20Data.md).

### Correlation table

```r
library(sjPlot)
mydata <- read.csv("data/mydata_scored.csv")
data_cor <- mydata[, c("C_total", "B_s1", "B_s2", "B_s3", "A_s1", "A_s2", "A_s3", "B_total", "A_total")]
tab_corr(data_cor,
         corr.method = "spearman",
         title = "Correlation",
         triangle = "lower",
         show.p = TRUE)
```

## Resources & References

References.

### Further Study
