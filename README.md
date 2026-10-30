# Applied Psychological Statistics and Data Analysis in R and Python

An applied statistics manual for students in psychology, sociology, neuroscience, and related fields who analyze their own research data in R.

Read it online: <https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/>

For each method, the manual covers when to use it, which R packages and functions to use, common mistakes, and where to read more, with example code you can adapt to your own data. It assumes some background in statistics and programming and focuses on application, not formulas. If you are new to coding, you can start with [JASP](https://jasp-stats.org/) and switch to R later.

- All examples use one simulated dataset of 500 participants (two Likert scales, a yes/no checklist, demographics, and three binary outcomes). The code that generates it is in the manual, so every example can be rerun.
- The practice code in R Basic Operations runs in the browser; more chapters will follow.
- The chapters include notes from my own projects, for example on modification indices in SEM, on analyzing multiply imputed data, and on what to do when a CFA does not fit.
- The topics go from installing R and cleaning data up to structural equation modeling with lavaan.

## Contents

The manual is not finished. Linked chapters are online; the others are planned.

### Undergraduate level

- [R Introduction](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/r-introduction.html): why R, installation, the RStudio interface, data structures, debugging
- [Example Data](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/example-data.html): the simulated dataset used throughout
- [R Basic Operations](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/r-basic-operations.html): importing, converting, selecting, reshaping, and merging data
- [Figures and Tables](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/figures-and-tables.html): plots with ggplot2, tables with gtsummary
- [Data Cleaning](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/data-cleaning.html): recoding, scale scores, summaries by group, normality checks
- [Missing Values](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/missing-values.html): describing missingness and multiple imputation with mice
- [Fundamental Statistics](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/fundamental-statistics.html): summary tables and group comparisons
- [Correlation and Regression](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/correlation-and-regression.html): correlation tables (regression not written yet)
- Planned: assumption checks, t-tests and ANOVA (including within-subject designs and post hoc tests), chi-square tests, nonparametric tests, effect sizes and confidence intervals, power analysis, MANOVA

### Junior graduate level

- [Generalized Linear Model](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/generalized-linear-model.html): logistic regression; ordinal and count models planned
- [Structural Equation Modeling](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/structural-equation-modeling.html): the workflow from data screening to mediation, estimators, and practical notes
- [Multigroup Analysis](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/multigroup-analysis.html): measurement invariance and comparing paths across groups
- [Nonlinear Mediation](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/nonlinear-mediation.html): indirect effects when the paths are curved
- [Reliability and Validity](https://qiuyuyu3.github.io/Applied-Psychological-Statistics-and-Data-Analysis-in-R_and_Python/reliability-and-validity.html): Cronbach's alpha with bruceR, types of validity
- Planned: longitudinal models (longitudinal SEM, latent growth curves, RI-CLPM, time series), latent profile and latent class analysis, principal component and factor analysis, multilevel modeling, Bayesian statistics, meta-analysis, loops and functions in R

### Senior graduate level (planned, with Python)

- Regularized regression and cross-validation, psychological network analysis, FDR control, sensitivity analysis, common method bias

## License

The text and figures are licensed under [CC BY 4.0](LICENSE): you may share and adapt them with attribution. The code examples are licensed under [MIT](LICENSE-CODE), so you can use them in your own analyses. The Quarto extensions in `_extensions/` (quarto-live and list-table) are third-party code under their own licenses.
