# cooperatR
R package containing Dan Ovando's database for cooperatives from his [2014 paper](https://doi.org/10.1016/j.marpol.2012.03.012)

`devtools::install.github("jcvdav/cooperatR")`

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
