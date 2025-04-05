# R Basic Operations


# Before You Start

1. How to import and export data? What if I have multiple data want to read?
2. How to add or remove a column or row?
3. How to convert variables from numeric to factor?

# Basic Procedure

## Import Dataset

File - Import Dataset:

![Import Dataset](.\\Attachments\\Import Dataset.png)

Environment - Import dataset:

![Environment](.\\Attachments\\environment.png)

## Useful Packages - [**Tidyverse**](https://www.tidyverse.org/)

Thanks to Tidyverse makes R less painful. Tidyverse is an integrated package of several utility functions that we will be using a lot for data processing.

- [**reader](https://readr.tidyverse.org/articles/readr.html) :** Read and import data based on specific conditions. You can read more here: [https://r4ds.hadley.nz/data-import](https://r4ds.hadley.nz/data-import)
- [**dplyr](https://dplyr.tidyverse.org/articles/dplyr.html) :** Specific processing of rows or columns: for example, selecting specific columns, rename the column.
- [**Tibble](https://tibble.tidyverse.org/articles/tibble.html) :** New way of creating data frame.
- [**stringr](https://stringr.tidyverse.org/articles/stringr.html) :** Handle character variables (everything you can imagine). For example, calculating the length of a character, adding, removing and modifying spaces to characters, sorting, counting, case conversion, detect, locate, extract, match, replace, and split. It will be very useful when batch processing variable names when doing quantitative research.
- [**purrr](https://purrr.tidyverse.org/) :** Mainly provide `map()` function, which is more useful and effective than if statement. When you perform multiple repetitive operations it will be useful, but here we will leave it to the Statement section to talk about it.
- [**forcats](https://forcats.tidyverse.org/articles/forcats.html) :** Sort, filter, combine factors  (discontinuous variable).

# Summary and Practice

## Find Path

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Find file path | NA | When you want to import some data files, you can easily get the file path, and then copy the path, then put the path into the read function. | Run it and it can give you the path.
`file.choose()`

Combine them together!
`read_sav(file.choose())` | use `/` instead of  `\` when you input the path | https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/file.choose |
| Get the path of a file | NA | When you want to know where a certain file is and you only have the name of the file. | here package:
`here("file name")` | You can put any file name into it, it is amazing. | [https://here.r-lib.org/articles/here.html](https://here.r-lib.org/articles/here.html) |
| Get or set working directory | NA | It is where you read or set files. | `setwd()`
`getwd()` | This can be very useful when you combine statements, such as reading multiple files. | [https://www.r-bloggers.com/2021/12/get-and-set-working-directory-setwd-getwd-in-r/](https://www.r-bloggers.com/2021/12/get-and-set-working-directory-setwd-getwd-in-r/) |

## Import and Export Dataset

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Import dataset | NA | Read data (or multiple datasets), data with remote path, specific columns, etc. | haven package: `read_sav()`

Basic R:
`read.csv()`

tidyverse package:
`read_csv()`
If you want to specify the variable type:
`col_` | I would recommend you import a csv file instead of sav to avoid possible errors. Haven package will read labels and can cause issues.

`read_csv()` is faster and defaults to not converting strings to factors automatically. It also gives you many ways to read specific files. | https://haven.tidyverse.org/reference/read_spss.html

https://readr.tidyverse.org/reference/read_delim.html

https://r4ds.hadley.nz/data-import
 |
| Read multiple datasets | NA | Read and vertically merge datasets into a dataframe with the name of the first column as ‘Name’. If you want to keep it in the environment, remember to create the object. | tidyverse package:
`data <- read_csv(c("A.csv", "B.csv"), id = "Name")`

`lapply()` or `for` loop

purrr package: 
`map_dfr`
`combined_data < - map_dfr(c("A.csv", "B.csv"), ~ read_csv(.x) %>% mutate(file = .x))` | I don’t suggest use `lapply()` or `for` statements if you are a new beginner. But here I will tell you its logic is to traverse the whole folder to read the path and filename using the statement.

 | [https://stackoverflow.com/questions/46299777/add-filename-column-to-table-as-multiple-files-are-read-and-bound](https://stackoverflow.com/questions/46299777/add-filename-column-to-table-as-multiple-files-are-read-and-bound)

 |
| Export data | All | Export different kinds of data, here I only list csv files. But you can use `library(writexl)
write_xlsx(df, "data.xlsx")` to export Excel file. | `write.csv(data, file = "data.csv", row.names = FALSE)`

library(readr)
`write_csv(data, "data.csv")` | Like when you import data, you have a number of options to choose from when you export (check the function documentation for details). `write_csv` runs fast. | [https://rdrr.io/r/utils/write.table.html](https://rdrr.io/r/utils/write.table.html)

[https://readr.tidyverse.org/reference/write_delim.html](https://readr.tidyverse.org/reference/write_delim.html)
 |

## Convert Different Variables Types

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Check datatypes | All | When you want to see the variable data type and consider whether to convert the variable type. | `str()`
 | You can use `str()`  to check variable type in list, object, vector, or column.  | [https://www.statology.org/str-function-in-r/](https://www.statology.org/str-function-in-r/) |
| Convert to numeric | All | Create dummy variables, or convert factors to numbers after importing a csv file. | `as.numeric(x, …)`
 | When you use the `as.numeric` to convert factors, R returns the internal integer index of the factor, not the level of the factor itself. | [https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/numeric](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/numeric)

[https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chNumeric.html](https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chNumeric.html) |
| Convert to Characters | All | Convert logical variables into characters, display ‘Yes’ and ‘No’ instead of numbers. | `as.character()` |  | [https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/character](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/character) |
| Convert to Logical | All | TRUE is converted to 1, FALSE is converted to 0; 0 is converted to FALSE, non-0 is converted to TRUE. | `as.logical()` |  | [https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/logical](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/logical)

[https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chLogical.html](https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chLogical.html) |
| Covert to Factors | All | Display levels instead of numbers on the value column. | `as.factor()` |  | [https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/factor](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/factor)

[https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chFacts.html](https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chFacts.html) |
| Convert to Date | All | Convert a string of numbers or characters into a time. | `as.Date()`
`format()`
`as.POSIXct()`
`as.POSIXlt()` |  | [https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chDate.html](https://bookdown.org/hcwatt99/Data_Wrangling_Recipes_in_R/chDate.html)

[https://www.stat2labs.sites.grinnell.edu/Handouts/rtutorials/IntroDates.html](https://www.stat2labs.sites.grinnell.edu/Handouts/rtutorials/IntroDates.html) |
| Convert a character vector into a more specific type | All | When you want to convert a character variable to the appropriate type (date, factor, logical, double, inter, etc.) | reader package:
`parse_` | This function can be very useful when doing data cleaning, as long as your data format follows a specific pattern. 
`parse_number()` can extract the numeric part from a string containing non-numeric characters. | [https://readr.tidyverse.org/articles/readr.html](https://readr.tidyverse.org/articles/readr.html)

 |

## Subset Selection and Modification

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Remove lines | All | No longer need one of the participants’ data. | remove the second line:
`data[-2, ]`

`subset()`

dplyr package:
`filter()` | `-` and `!` mean “delete”
`’` represents all lines or columns, sometimes it can represent data frame. | [https://favtutor.com/blogs/remove-row-in-r](https://favtutor.com/blogs/remove-row-in-r)

[https://help.displayr.com/hc/en-us/articles/360003863576-How-to-Remove-a-Row-or-Column-from-a-Table-Using-R](https://help.displayr.com/hc/en-us/articles/360003863576-How-to-Remove-a-Row-or-Column-from-a-Table-Using-R) |
| Remove columns (variables) | All | No longer need one column. | `data[, !names(data) %in% "variable"]`
remove the first column:
`data[, -1]`

`subset()`

dplyr package:
`select(-variable)` | `-` and `!` mean “delete”
`’` represents all lines or columns, sometimes it can represent data frame. | [https://www.listendata.com/2015/06/r-keep-drop-columns-from-data-frame.html](https://www.listendata.com/2015/06/r-keep-drop-columns-from-data-frame.html)

[https://sparkbyexamples.com/r-programming/remove-column-in-r/](https://sparkbyexamples.com/r-programming/remove-column-in-r/) |
| Subset Selection | All | Select a portion of the data frame from the raw data frame. | `subset()`

remove the second line and first column
`data[-2, -1]` | In fact, you can pick subsets from vectors, matrices, dataframes, lists. But we use selecting rows and columns (dataframes), the most. Master the `filter` and `select` is enough. | [https://stackoverflow.com/questions/65650497/how-to-subset-rows-and-columns-in-r](https://stackoverflow.com/questions/65650497/how-to-subset-rows-and-columns-in-r)

[https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/subset](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/subset)

[https://adv-r.hadley.nz/subsetting.html](https://adv-r.hadley.nz/subsetting.html) |
| Add new columns, or delete, or maybe just modify the old column | NA | Add two columns of values representing the mean and z-score.

You can also delete columns by setting their value to NULL. | tidyverse package:
`mutate(data, name = c())` | You can add couple columns by using `mutate()`,and the new column can be list, object, function, or value.
`mutate()` is useful in conjunction with statements or other functions. | [https://dplyr.tidyverse.org/reference/mutate.html](https://dplyr.tidyverse.org/reference/mutate.html)
 |
| Select specific columns |  | The `select` function can be combined with other functions or even statements or conditions to help you filter the columns you want. | `select()`
 | By combining other conditions, you can also choose variables based on the pattern of variable naming, such as choosing variables whose first several characters are letters. | [https://dplyr.tidyverse.org/reference/select.html](https://dplyr.tidyverse.org/reference/select.html) |
| Conditions | All | Extract the variable sthat start with “A” and ends with “C” and contains “b” | `stars_with()`
`ends_with()`
`contains()`
`everything()`
`gsub("[^A-Za-z]+.*", "", colnames(df))` | These conditions can be combined, by  using `&`,  `|` , `!` , etc. | [https://dplyr.tidyverse.org/reference/select.html](https://dplyr.tidyverse.org/reference/select.html) |
| Select specific lines | All | Chooses rows based on column values, or split the data frame. | `filter()`

Index rows by their (integer) locations:
`slice()` | `filter()` role is similar to `==`.
`slice()` can't delete or replace rows directly, but you can do it by generating a new dataframe (selecting the rows you want and creating objects). `slice()` is more focused on position, while `filter()` is more focused on content (conditions). | [https://dplyr.tidyverse.org/reference/filter.html](https://dplyr.tidyverse.org/reference/filter.html)

[https://dplyr.tidyverse.org/reference/slice.html](https://dplyr.tidyverse.org/reference/slice.html) |
| Keep only unique/distinct rows | All | When you only want unique participant data (eliminating duplicates), or looking at outliers. | `distinct()`
`unique()` | This two functions will be very useful when you are doing the data cleaning, especially `unique()`, you can combine with loop statement. | [https://dplyr.tidyverse.org/reference/distinct.html](https://dplyr.tidyverse.org/reference/distinct.html)

[https://rdrr.io/r/base/unique.html](https://rdrr.io/r/base/unique.html) |
| Extract specific variable or column | All | Selecting only specific variables or columns instead of the entire data frame. | `data$'Variabel.1'`
or `data$Variabel`

dplyr package:
`pull()` | Be very careful about how you name the variable - do not use `.` because R may think this is a function or statement. If you insist using it, quote the variable. | [https://dplyr.tidyverse.org/reference/pull.html](https://dplyr.tidyverse.org/reference/pull.html) |

## Data Frames and Essential R Studio Operations

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Create object | NA |  |  `<-` | Try to get into the good habit of creating objects to store in the environment for every step of processing at the beginning. |  |
| Display object | NA | When you want to see your results, data, list, etc. | `print()`
`Object` (replace the object you want to see, eg. data) | Unlike Python, R can be run line by line, and you can select only ‘objects’ to run to see their contents. |  |
| List all the variables | All | Know what variables your data frame contains. | `names(data)`
`colnames(data)`
`str(data)`
`ls(data)`

dplyr package:
`glimpse(data)` |  | [https://dplyr.tidyverse.org/reference/glimpse.html](https://dplyr.tidyverse.org/reference/glimpse.html) |
| Save space in your code - Pipe an object forward into a function or call expression | NA | When performing multi-step operations, objects can be passed to the next function to make the syntax concise. | tidyverse package:
`%>%` | The shortcut keys are `Control + Shift + M`
You will use it very often. | [https://magrittr.tidyverse.org/reference/pipe.html](https://magrittr.tidyverse.org/reference/pipe.html)

[https://github.com/arthurwelle/VIS/blob/master/Pipe_Cake/Pipe_baking.gif](https://github.com/arthurwelle/VIS/blob/master/Pipe_Cake/Pipe_baking.gif) |
| Check R version or cite R | NA | When you want to cite R in your paper. | `RStudio.Version()` |  | [https://support.posit.co/hc/en-us/articles/206212048-Citing-RStudio](https://support.posit.co/hc/en-us/articles/206212048-Citing-RStudio) |
| Save R Objects | NA | Use it when you want to save the entire current working environment so that you can revert to the same state later. | `save()`
`save.image()` |  | [https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/save](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/save) |
| Clean the environment | NA | When your storage is not enough, or you no longer need this environment. | Clean all environment:
`rm(list = ls())` | Use `rm(list = ls())` carefully.
You can also click the broom icon at the top of the Environment pane. |  |
| List or remove the object | NA |  | remove one object
`rm()`

list objects
`ls()` |  |  |
| Reduce function calls | All | Merge multiple dataframes, or reduce function writing and calling. | `do.call()` | do.call() is a very useful function in R. Its main purpose is to call other functions dynamically and pass a list of arguments to those functions. | [https://stackoverflow.com/questions/10801750/whats-the-difference-between-lapply-and-do-call](https://stackoverflow.com/questions/10801750/whats-the-difference-between-lapply-and-do-call)

[https://www.spsanderson.com/steveondata/posts/2023-06-01/index.html](https://www.spsanderson.com/steveondata/posts/2023-06-01/index.html) |
| Another type of data frame | All | Better view and usage of the data frame. | tibble package: 
`tibble()`

Coerce objects into tibbles:
`as_tibble()` | `tibble` does not support row names, and encourages the usage of column names as unique identifiers, it provides better printing and display features. | [https://tibble.tidyverse.org/reference/tibble.html](https://tibble.tidyverse.org/reference/tibble.html) |
| Reorder columns or variables | All | Put the participant's ID in the first column. | dylr package:
`relocate()`
`select()` | `relocate()` is cleaner and simpler, it doesn't change the structure of the data.
`select()` has more functionality. | [https://dplyr.tidyverse.org/reference/relocate.html](https://dplyr.tidyverse.org/reference/relocate.html)

[https://dplyr.tidyverse.org/reference/select.html](https://dplyr.tidyverse.org/reference/select.html) |
| Reorder rows | Continuous | Ascending or descending order of the rows in the data frame based on the value of the column(s). | Basic R:
`sort()`

dylr package:
`arrange()`

descending order:
`desc()` | `sort ()` can only fulfill for one condition, while the `range ()` can meet more than one condition, such as the age of the ascending order and then depression level in descending order. | [https://rdrr.io/r/base/sort.html](https://rdrr.io/r/base/sort.html)

[https://dplyr.tidyverse.org/reference/arrange.html](https://dplyr.tidyverse.org/reference/arrange.html)

[https://dplyr.tidyverse.org/reference/desc.html](https://dplyr.tidyverse.org/reference/desc.html) |

## Data Clean Preparation

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Detect, locate, extract, match, replace, and split characters | Character Variables | Calls the name of a variable with the same first three letters; replaces specific letters. | stringr package:`str_grep()grepl()` , `sub()`,  `gsub()` provides other forms of extract or detect characters. | processing of characters is a big topic -  learning the functions when you are actually cleaning or processing the data. Current programming languages are very fleciable of handling characters: ‘don't handle them manually if you can’, instead, use statements or scripts. | [https://stringr.tidyverse.org/articles/stringr.html](https://stringr.tidyverse.org/articles/stringr.html)[https://rdrr.io/r/base/grep.html](https://rdrr.io/r/base/grep.html)[https://bookdown.org/rdpeng/rprogdatascience/regular-expressions.html](https://bookdown.org/rdpeng/rprogdatascience/regular-expressions.html)[https://r4ds.had.co.nz/strings.html](https://r4ds.had.co.nz/strings.html) |
| Sort, Filter, Combine Factors | Dichotomous Variables | When you are not satisfied with the ordering of levels or factors - drawing a figure, and you want the frequencies to be ordered from largest to smallest; or when you are doing a logistic regression you want a factor to be the reference group. | `fct_()` |  | [https://forcats.tidyverse.org/articles/forcats.html](https://forcats.tidyverse.org/articles/forcats.html)

[https://r4ds.had.co.nz/factors.html](https://r4ds.had.co.nz/factors.html)

[https://r02pro.github.io/factor.html](https://r02pro.github.io/factor.html) |
| Check your data | NA | Check that data entry and import are correct. | `summary()` 

dplyr package:
`slice()`
randomly selects rows:
`slice_sample()`

Select the first few lines or the last few lines:
`head()`
`tail()` | `summary()` can let you read detailed information about each variable, including minimum, 1quartile, median, mean, 3 quartiles, and maximum values (numeric); frequencies for each factor level.

`slice()` `head()` `tail()` can let you see the raw data directly. | [https://dplyr.tidyverse.org/reference/slice.html](https://dplyr.tidyverse.org/reference/slice.html) |
| Rename variables or columns | All | Change variable name from “CTQ” to “ACTQ” | `rename()` |  | [https://dplyr.tidyverse.org/reference/rename.html](https://dplyr.tidyverse.org/reference/rename.html) |
| data format: from wide to long, or long to wide | All | Typically our columns would be by ‘ID, Variable 1, Variable 2 ....’ but sometimes we need the column names to be sorted by ID or merged with multiple variables (e.g. figure). | Pivot data from long to wide:
`pivot_wider()`

Pivot data from wide to long:
`pivot_longer()`
 |  | [https://tidyr.tidyverse.org/reference/pivot_wider.html](https://tidyr.tidyverse.org/reference/pivot_wider.html)

[https://tidyr.tidyverse.org/reference/pivot_longer.html](https://tidyr.tidyverse.org/reference/pivot_longer.html) |

### Combination of the Dataframes, Rows, and Columns

| **Name** | **Variables Types** | **Conditions & Examples** | **Package & Function** | **Comment** | **Resource** |
| --- | --- | --- | --- | --- | --- |
| Merging multiple dataframes (rows) horizontally | All | Add more participants’ data into the raw data frame. | `bind_rows()`

`rbind()`

 |  | [https://dplyr.tidyverse.org/reference/bind_rows.html](https://dplyr.tidyverse.org/reference/bind_rows.html) |
| Merging multiple dataframes, vertically | All |  Add more columns or variables. | `bind_cols()`

`cbind()` |  | [https://dplyr.tidyverse.org/reference/bind_cols.html](https://dplyr.tidyverse.org/reference/bind_cols.html) |
| Merge data frame left and right (partially) | All | Add more variable values into the raw data frame. If you have data1 and data2 with overlapping (or consistent) IDs, you can take the two sets and merge the remaining columns based on the ID columns of data1 or data2 as a baseline. | dplyr package:
`right_join(data1, data2, by = "ID)`
`left_join(data1, data2, by = "ID")` | Notably, When the reference columns (IDs) do not match, left or right will determine which reference column you have. If data1 has an ID of ‘1,2,3,4’ and data2 is ‘1,2,3,5’ and you use `left_join`, the final data frame will only keep the data from ‘1,2,3,4’ and the corresponding values of the other variables will be NA. | [https://dplyr.tidyverse.org/reference/mutate-joins.html](https://dplyr.tidyverse.org/reference/mutate-joins.html)

[https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join](https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join)

[https://r4ds.hadley.nz/joins](https://r4ds.hadley.nz/joins)

 |
| Merge all data in different data frames | All | You want all data or values from all datasets and don’t want to drop anything. It means final combined dataframe will have data of ‘ID = 1,2,3,4,5’. | `full_join()` | This function keeps all data, and ensures that the entry is complete and that the missing information is NA.
 | [https://dplyr.tidyverse.org/reference/mutate-joins.html](https://dplyr.tidyverse.org/reference/mutate-joins.html)

[https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join](https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join)

[https://r4ds.hadley.nz/joins](https://r4ds.hadley.nz/joins) |
| Merge two datasets but only keep the overlapping rows | All | You want data on participants with the same ID in both datasets.
It means final combined dataframe will have data of ‘ID = 1,2,3’. | `inner_join()` | Only keep the same observations from the reference column. | [https://dplyr.tidyverse.org/reference/mutate-joins.html](https://dplyr.tidyverse.org/reference/mutate-joins.html)

[https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join](https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join)

[https://r4ds.hadley.nz/joins](https://r4ds.hadley.nz/joins) |
| Take one data frame as a reference and retain or drop all rows whose name matches the reference | All | Your two dataframes have different columns, now you will only have the columns of data1 and will not add columns from data2 (reference), and you will only have rows of ‘ID = 1,2,3’ | `semi_join()`
`anti_join()` | Similar to `filter()`

It actually modify (filters) your original data frame and do not add anything (columns or rows) from the reference data frame. | [https://dplyr.tidyverse.org/reference/mutate-joins.html](https://dplyr.tidyverse.org/reference/mutate-joins.html)

[https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join](https://www.rdocumentation.org/packages/plyr/versions/1.8.9/topics/join)

[https://r4ds.hadley.nz/joins](https://r4ds.hadley.nz/joins) |
| Merge data frames in different ways | All | Combine two different dataframes. | `merge()` | `merge()` is more flexible but complicated. | [https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/merge](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/merge)

[https://bookdown.org/rwnahhas/IntroToR/merge-join.html](https://bookdown.org/rwnahhas/IntroToR/merge-join.html) |
| List a cross table | All | When conducting a multifactorial experimental design (2x2), list all possible combinations of conditions. | `cross_join()` | It combines each row of two dataframes with each row of another dataframe to produce all possible combinations of rows; it may be used in the design of psychology experiments. | [https://www.statology.org/cross-join-in-r/](https://www.statology.org/cross-join-in-r/)

[https://dplyr.tidyverse.org/reference/cross_join.html](https://dplyr.tidyverse.org/reference/cross_join.html) |

# Syntax Sample

```r
# Read csv file
dataraw <- read_sav("C:\\Users\\Desktop\\data.sav") # notable, use \\ or / instead of \

# list all csv files
csv_files <- list.files(path = "put your path here", pattern = "\\.csv$", full.names = TRUE)

# read multiple csv files in a folder
folder_path <- "path/to/your/folder"
file_list <- list.files(path = folder_path, pattern = "\\.csv$", full.names = TRUE) # create a file_list
data_list <- lapply(file_list, read.csv) # read all csv files on the file_list
combined_data <- do.call(rbind, data_list) # combine all dataframe together

# read multiple different files in a folder
library(readxl)  # Load the readxl package for reading .xlsx files

# Set the working directory and get the path
folder_path <- setwk()  

# List all files in the specified folder, including full paths
file_list <- list.files(path = folder_path, full.names = TRUE)

# Use lapply to read each file based on its extension
data_list <- lapply(file_list, function(file) {
  # Check if the file is a .csv file and read it as a data frame
  if (grepl("\\.csv$", file)) {
    read.csv(file)  # Read .csv file
  } else if (grepl("\\.txt$", file)) {
    read.table(file)  # Read .txt file
  } else if (grepl("\\.xlsx$", file)) {
    readxl::read_excel(file)  # Read .xlsx file
  # If the file extension is not recognized, return NULL
  } else {
    NULL
  }
})
# Optionally, remove NULL entries from the list
data_list <- Filter(Negate(is.null), data_list)

# Test data type
str(data) 
# Test specific variable in dataframe
str(data$ACE)

# convert all values to numeric
dataraw <- as.data.frame(lapply(dataraw, as.numeric))
# Or
dataraw[] <- lapply(dataraw, as.numeric)

# For all columns whose names begin with ‘A’, subtract the value by 1.
dataraw <- dataraw %>%
  mutate(across(starts_with("A"), ~ . - 1))

# Notably, when convert factor into numeric
as.numeric(factor(5:10)) # [1] 1 2 3 4 5 6
f <- factor(1:5)
## what you typically meant and want:
as.numeric(as.character(f))

# Choose all columns after CM
df_selected <- df[, which(colnames(df) == "CM"):ncol(df)]
# OR use select()
df_selected <- df %>%
  select(CM:last_col())
  
# delete row 2 and row 3
df <- df[-c(2, 3), ]

# delete column 2 and column 3
df <- df[, -c(2, 3)]

# choose a string from the fist one to the thid one
prefixes <- substr(colnames(data), 1, 3) 

# select ()
# Select only Variable1 and Variable2 from the data frame
select(data, Variable1, Variable2) # select V1 & V2

# Exclude the column named 'Variable' from the data frame
select(data, -Variable) # delete Variable

# Exclude the column named 'Variable' from the data frame using a logical condition
select(data, !Variable) # delete Variable (note: this is not a standard usage for select)

# Select columns from the 2nd to the 5th positions in the data frame
select(data, 2:5) # select columns from position 2 to 5

# Select columns that start with the letter 'A'
select(data, starts_with("A")) # select columns that start with 'A'

# Select columns that end with the letter 'A'
select(data, ends_with("A")) # select columns that end with 'A'

# Select participants whose age are more than 30, and only keep Name and Height columns.
df <- subset(df, Age > 30, select = c(Name, Height))

# Example character data
char_integer <- c("1", "2", "3")
char_double <- c("1.1", "2.2", "3.3")
char_date <- c("2024-08-22", "2024-09-01", "2024-10-15")
char_logical <- c("TRUE", "FALSE", "TRUE")

# Convert character data to integer
parsed_integer <- parse_integer(char_integer)
print(parsed_integer)  # Output: 1 2 3

# Convert character data to double (numeric)
parsed_double <- parse_double(char_double)
print(parsed_double)  # Output: 1.1 2.2 3.3

# Convert character data to date
parsed_date <- parse_date(char_date)
print(parsed_date)  # Output: 2024-08-22 2024-09-01 2024-10-15

# Convert character data to logical
parsed_logical <- parse_logical(char_logical)
print(parsed_logical)  # Output: TRUE FALSE TRUE

# Reorder columns or variables
df %>% select(ID, everything()) # if you don't want to type the rest of the columns
df %>% relocate(ID)

# updates the values in the Age column by adding 1 to each value and removing Score column
df %>% mutate(Age = Age + 1, Score = NULL)
```

# Assignment

> *It doesn't matter if the code is neat and pretty, as long as you get there in the end!*
> 
- Import data as data frame or tibble. Export dataset as csv file.
- Combine multiple files together as a big data frame.
- Covert the factor variable into numeric.
- Check the data frame, pull out the first 3 and last 5 rows as a dataframe.
- Add a new column, rename it as ‘Mean’; add a new row, change the value to NULL.
- Delete the first column, and remove the last line.

## Functions Required to Know How to Use

Write down what they can do and practice using them.

`file.choose()`; `here()` ;`read_csv()`; `write_csv()`; `ls()`; `arrange()`; `summary()`; `<-`; `%>%`; `str()`; `mutate()`; `as.factor()`; `as.numeric()`; `filter()`; `select()`; `start_with()`; `unique()`; `bind_rows()`; `bind_cols()`

# Resource & Reference

[**R for Data Science: Import, Tidy, Transform, Visualize, and Model Data**](https://r4ds.had.co.nz/)

[https://rc2e.com/datastructures](https://rc2e.com/datastructures)

## Further study

Recommended classes or training