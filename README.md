# cooperatR
R package containing Dan Ovando's database for cooperatives from his [2014 paper](https://doi.org/10.1016/j.marpol.2012.03.012)

## To install `cooperatR` in your computer

1. Install the `devtools` package. This wil allow you to install R packages that are on github, like this one.

`install.packages("devtools")`

2. Load the `devtools` package using `library()`

`library(devtools)`

3. Use the `install_github()` function and specify username and repository where the package lives. In this case, the `cooperatR` package lives in "jcvdav/cooperatR":

`install_github("jcvdav/cooperatR")`

This might take a couple of seconds. All dependencies will also be installed.

## Description of the dataset

```
library(cooperatR)
?cooperatives
```

## Inspect existing variables

`get_variables()`

## Inspect available species (common names)

`get_spp()`

## Inspect available species (scientific names)

`get_spp(scientific = TRUE)`

## Save database to csv

`save2csv()`

## Get unique identifiers

`get_unique()`

## Get unique identifiers and save to file

`get_unique(to.file = TRUE)`
