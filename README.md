***

## NEWS SECTION

1. The database has been updated. Column names remain the same, but it many inconsistencies have been fixed (and more will be ficed in the next days). Al inconsistencies have been identified. To see a logbook of changes [click here](http://www.villasenor-derbez.com/cooperatR/DBcleaning.nb.html)

2. Proposed system for archiving our data: The **K**nowledge **N**etwork for **B**iocomplexity ([KNB](https://knb.ecoinformatics.org/#about))
    - Example of data storage from [this paper](https://www.nature.com/articles/s41559-017-0257-9) can be seen [here](https://knb.ecoinformatics.org/#view/doi:10.5063/F1CF9N69)

***

# cooperatR
R package containing Dan Ovando's database for cooperatives from his [2014 paper](https://doi.org/10.1016/j.marpol.2012.03.012)

## To install `cooperatR` in your computer

Before you try to run any of the code in the next sections, make sure you have installed the latest version of R and RStudio. Remembere these are two different things. R is the language and program itself. RStudio is an IDE (Integrated Development Environment)... which is just fancy talk for "User Interface" (with some other sweet things).

- [Download R for WINDOWS](https://cran.r-project.org/bin/windows/base/)
- [Download R for OS](https://cran.r-project.org/bin/macosx/)
- [Download RStudio](https://www.rstudio.com/products/rstudio/download/)

Once you have done this, you will be able to install all the latest packages, including `cooperatR`. You can copy/paste the code that `looks like this`:

1. Install the `devtools` package. This wil allow you to install R packages that are on github, like this one.

`install.packages("devtools")`

2. Load the `devtools` package using `library()`

`library(devtools)`

3. Use the `install_github()` function and specify username and repository where the package lives. In this case, the `cooperatR` package lives in "jcvdav/cooperatR":

`install_github("jcvdav/cooperatR")`

This might take a couple of seconds. All dependencies will also be installed.

## Using the package

### Description of the dataset

1. Make sure you load the new package you have installed with `library(cooperatR)`.
2. You can now load the database to your environment with `data("cooperatives")`.
3. If you want to know what's in there, do `?cooperatives`. This should show you the documentation for the database (I copy-pasted the metadata from the supplementary material on [Dan's paper](https://doi.org/10.1016/j.marpol.2012.03.012).

### I hate R, can I work from Excel?

Sure! (just remember that your work might not be replicable, but whatever makes life easier for you works). If you hate R and dont want to work in it, check out the `save2csv()` function to save the database to your computer so that you can open it wit Excel. Make sure you read the documentation for the function with `?save2csv`.

#### Save database to csv

If you want to export the cooperatives database, just use: `save2csv()`. That's it, you do not need to give any arguments to it. Remember to check `?save2csv` for more information on the function.

### I am ok with R

Cool, keep reading:

#### Inspect existing variables

`get_variables()`

#### Inspect available species (common names)

`get_spp()`

#### Inspect available species (scientific names)

`get_spp(scientific = TRUE)`

#### Get unique identifiers

`get_unique()`

#### Get unique identifiers and save to file

`get_unique(to.file = TRUE)`

## I want to do something that is not available here

Great, that means I still get to play with this. There are three options if you want something new in the package:

### For people familiar with this thing (git / GitHub / R)
1. Fork this repository, make the changes, additions, and enhancements you'd like, and submit a pull request.

### What was that?
2. No worries, you can either make you own functions directly in R, withot using git or github. You can later email your scripts at [jvillasenor@bren.ucsb.edu](jvillasenor@bren.ucsb.edu) and I will incorporate them -with due credit to you- to the package.
3. If you have no idea or interest in making the changes, but still think you have a great idea, that is great! You can either look for me in the hallway and we can talk about it, you can submit an issue to this repository (look at the tabs above), or you can shoot me an email with what you want at [jvillasenor@bren.ucsb.edu](jvillasenor@bren.ucsb.edu).
