# [Internal] Applied-Psychological-Statistics-and-Data-Analysis-in-R

# About this Manual

For people who are not familiar with Coding, I would suggest starting with using JASP, it can help you build up the workflow and reduce pain. When you feel familiar with it you can transfer to R or Python. JASP is an open resource software that is built based on GUI and it can do a lot of advanced statistics! Better than SPSS.

![JASP.png](./Attachments/JASP.png)

This document is intended for students who have psychology, sociology, or neuroscience background, and who use R as a primary statistical tool. **It does not go into detail about formulas, code, or statistical principles**; instead, it focuses on the **application** of statistics and programming to your projects: it is more of a **toolkit**. Therefore, you may need to have some knowledge of statistics and programming.

**Do I need a foundation in programming and statistics?**

Yes, you need to have a slight foundation in statistics and programming. But it's okay if you don't have a firm grasp of the statistics, reading through the examples section of this document will help you solidify the knowledge. In the programming section, although I will not teach you by hand, I will list some necessary basic operations and some syntax samples.

**Why don’t you explain statistical principles and formulas?**

For students who major in social sciences, even if you don't understand statistical principles and mathematical formulas you can still do data analysis - as long as you know the circumstances under which you should use this statistical analysis method, the specific steps to follow, and how to interpret the results. Although this manual will not contain explanations and discussions of statistical principles and formulas, I still recommend that you learn about them if you have the time, as this will deepen your understanding of statistical principles.

**How do I use this manual?**

For example, when you get a set of data, after reviewing the literature, you may know how to analyze (or do not know how to analyze), so you try to use R for statistical analysis but find that you do not know what functions or packages should be used to analyze. Here you can review this document to know what statistical analysis methods as well as the appropriate functions can be used. However, it should be noted that the most cutting-edge algorithms or statistics may still require you to write code.

**What is included in this document?**

Each module includes the name of the statistics, the type of variable, an example of the scenario in which it will be used, the packages and functions, useful resources (documentation, web pages, etc.), and a review of the package, and the resource.

**Why don't you give specific code or steps?**

The process of learning programming is similar to riding a bicycle, just knowing the names of the operations is not enough, and you need to practice them over and over again. You can get started by reading a textbook or taking a lecture, but if you are doing a research project, these two methods may not be as effective, as they will take a lot of your time. 

In the middle and later stages of programming, you will learn to program mainly by looking up web pages or reading official documentation, so it is necessary to develop the ability to learn on your own (especially by reading official documentation). Code is flexible, simple copy and paste may not achieve the desired effect if you do not understand the meaning of the code.

# Learning Objectives

- This guide is designed to help you master the basic syntax and concepts of the R language.
- Be able to write simple scripts to process and analyze data.
- Familiarize yourself with R's data structures, such as vectors, data frames, lists, etc., and be able to manipulate and process data.
- Import and export data efficiently, work with a variety of data formats, and perform preliminary data cleaning and preparation.
- Select and use appropriate R packages to extend the functionality of R.
- Perform basic statistical analysis and data visualization, and use R to create clear and informative charts.
- Develop problem-solving skills as well as self-study skills, applying the knowledge gained to solve real-world problems through example-based learning and project exercises.

# Outline & Topics

## Undergraduate Level_Version 1.0

- Introduction: why choose R and how to use this document?
- R Basic Operations
    - Importing and exporting data
        - Read and save dataframe
        - merging data, converting variable types, naming variables and labels, and selecting variables.
        - Read data from several files and combine data (left and right)
        - data format: from wide to long
- Exporting data analysis results
    - Plotting - ggplot package
    - Table - {gt} package
- data cleaning
    - Handling of missing values: direct deletion, multiple interpolations, prons & cons.
    - Outliner
- Questionnaires or cross-sectional research related:
    - reverse items, sum, average
    - Normality testing: general, multivariate normality tests.
- Descriptive statistics: M, SD, frequency, odds
- Basic statistics:
    - Correlation
    - T-test, ANOVA (linear regression), chi square test, etc.
    - Nonparametric tests & parameter test
    - Multivariate analysis of variance (ANOVA)

## Junior Graduate Level_Version 2.0

- Regression
    - general linear model
    - Logistic regression
- SEM
    - CFA & EFA
    - Mediation test, bootstrap
    - Moderation
    - multiple groups comparision
    - Longitudinal SEM
- Cluster and discriminant analysis: latent profile analysis (LPA), latent class analysis (LCA)
    - Principal component and factor analysis factor analysis & principle component analysis
- Longitudinal?
    - Time series analysis
- Meta-analysis & systematic review
- Multilevel Modeling (MLM)
- statement and how to define function
    - for loop
    - if else

## Senior Graduate Level_Version 3.0

**This section will include Python.**

- Machine Learning
    Reinforcement Learning
- Extra
    - FDR control
    - sensitivity analysis
    - Power Analysis
    - Multicollinearity test
    - Common Method Biases
    - network analysis
    - Neural network modeling

## Structure:

- Categorical: nonparametric & parametric; cross sectional & longitudinal; categorical & continuous
- Statistical methods; name (Chinese & English)
- Variable type (categorization needs to be clear)
- package & function;
- Comment (your own comments, e.g. the difference between ANOVA and chi-square test);
- resource (URL Link, textbook, website, etc.)

## Reference

1. [https://saraemilyburke.com/statistics.html#BriefIntroR](https://saraemilyburke.com/statistics.html#BriefIntroR)
2. [https://bookdown.org/wangminjie/R4DS/](https://bookdown.org/wangminjie/R4DS/)
3. [https://rstudio-education.github.io/hopr/index.html](https://rstudio-education.github.io/hopr/index.html)
4. [https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/index.html](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/index.html)
5. [https://rc2e.com/](https://rc2e.com/)
6. [https://hshids.github.io/tutorials/Rcheatsheet.html](https://hshids.github.io/tutorials/Rcheatsheet.html)
7. [https://github.com/psyteachr/data-skills-v2](https://github.com/psyteachr/data-skills-v2)
8. [https://www.andywills.info/rminr/](https://www.andywills.info/rminr/)
9. [https://github.com/ajwills72/rminr](https://github.com/ajwills72/rminr)
10. [https://methodenlehre.github.io/intro-to-rstats/index.html](https://methodenlehre.github.io/intro-to-rstats/index.html)
11. [https://xueningzhu.github.io/Statistical-Analysis-with-R/](https://xueningzhu.github.io/Statistical-Analysis-with-R/)
12. [https://www.zhihu.com/question/20296556](https://www.zhihu.com/question/20296556)
13. [https://zhuanlan.zhihu.com/p/366605041](https://zhuanlan.zhihu.com/p/366605041)
14. [https://epirhandbook.com/en/index.html](https://epirhandbook.com/en/index.html)
15. [https://methodenlehre.github.io/SGSCLM-R-course/index.html](https://methodenlehre.github.io/SGSCLM-R-course/index.html)
16. [https://r4ds.hadley.nz/](https://r4ds.hadley.nz/)
17. [https://adv-r.hadley.nz/](https://adv-r.hadley.nz/)
18. [https://github.com/hcp4715/R4PsyBook](https://github.com/hcp4715/R4PsyBook)

