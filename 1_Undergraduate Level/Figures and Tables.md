# Report Results: Figures and Tables (ggplot2 & gtsummary)

## Before You Start

1. How do I know what kind of figure or table I should create?
2. Where can I find templates?
3. How do I export my figures or tables?

## Basic Procedure

### Figure decision tree

[From Data to Viz: Find the graphic you need](https://www.data-to-viz.com/)

## Report Results

How does the literature report the results?

## Summary and Practice

### Chart Types

#### Frequency plot or cross-table

- **Variable types:** Categorical + categorical
- **When to use:** Plotting demographic variables.
- **Functions:** ggplot2 package: `ggplot()`
- **Resources:** [The R Graph Gallery](https://r-graph-gallery.com/)

#### Line chart

#### Lollipop chart

- **When to use:** Each category on the x-axis has one value on the y-axis.

#### Ridgeline plot and violin plot

- **Variable types:** Continuous only, or categorical + continuous
- **When to use:** Show how the data are distributed.

#### Histogram

- **Variable types:** Continuous (frequency)
- **When to use:** Show the frequency distribution of scores on a scale.

### Customize a Plot

#### Change colors

- **Resources:** [Datanovia: R color palettes](https://www.datanovia.com/blog/r-color-palettes)

#### Reorder a variable

- **Resources:** [The R Graph Gallery: Reorder a variable with ggplot2](https://r-graph-gallery.com/267-reorder-a-variable-in-ggplot2.html)

#### Change the legend position

- **Resources:** [Datanovia: ggplot2 legend in R: position, title & labels](https://www.datanovia.com/learn/data-visualization/ggplot2/legend)

#### Change the theme

- **When to use:** e.g. change the position of the axis titles.
- **Functions:** `theme()`; hrbrthemes package: `theme_ipsum()`

#### Rename the labels on an axis

- **Functions:** `scale_x_discrete(labels = c("X" = "name"))`

#### Flip the x and y axes

- **Functions:** `coord_flip()`

#### Change the axis range

### Prepare Data for Plotting

#### Convert data to long format

- **Variable types:** Any
- **When to use:** Move the variable names into a single new variable: turn all the columns into a dataset with only two columns, where the first column holds the variable names and the second holds the values.
- **Functions:** tidyr package: `pivot_longer()` (replaces the superseded `gather()`)

#### Select only some of the variables

- **Functions:** `select()` for wide data; `filter()` for long data, where the variable names are values in one column

### Combine and Export

#### Draw and combine multiple plots

- **Variable types:** Any
- **When to use:** You drew 4 plots and want to arrange them in order.
- **Functions:** cowplot package: `plot_grid()`
- **Comment:** It aligns the plots automatically, and lets you set the number of rows and columns and the order of the plots.
- **Resources:** [cowplot](https://wilkelab.org/cowplot/index.html), [USGS Water Data Blog: Beyond basic R: plotting with ggplot2 and multiple plots in one figure](https://waterdata.usgs.gov/blog/beyond-basic-plotting/), [Datanovia: Combine multiple ggplots in R with patchwork](https://www.datanovia.com/learn/data-visualization/ggplot2/combine-plots)

#### Export figures

- **Functions:** ggplot2 package: `ggsave()`; ggpubr package: `ggexport()`
- **Resources:** [R Markdown Cookbook: Keep the plot files](https://pkg.yihui.org/rmarkdown-cookbook/keep-files)

### Tables

#### Create a table or cross-table

- **Functions:** `table()`
- **Resources:** [rdrr.io: table](https://rdrr.io/r/base/table.html), [Statology: How to use the table function in R](https://www.statology.org/table-function-in-r/)

#### Generate all combinations of experimental conditions

- **When to use:** Generate every combination of the experimental conditions, for a complete experimental design and analysis.
- **Functions:** tidyr package: `expand_grid()`
- **Resources:** [tidyr: expand_grid](https://tidyr.tidyverse.org/reference/expand_grid.html)

## Syntax

```r
library(gtsummary)

# Merge several gtsummary tables side by side, each with its own spanning header
tbl_merge(
  list(table_a, table_b, table_c),
  tab_spanner = c("**Outcome A**", "**Outcome B**", "**Outcome C**")
)
```

## Resources & References

### Further Study

Recommended classes or training
