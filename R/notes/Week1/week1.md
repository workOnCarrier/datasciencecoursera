## Reading data
* read.table / read.csv         -- read tabular data
* readLines                     -- read text files
* source                        -- read R code files (inverse of dump)
* dget                          -- read R code files ( inverse of dput )
* load                          -- read saved workspaces
* unserialize                   -- read serialized R objects

## Writing data
* write.table
* writeLines
* dump
* dput
* save
* serialize

## readling large tables...
#### use the following approach
* initial <-read.table(<fileName>,nrows=100)
* classes <- sapply ( initial, class)
* taball  <- read.table ( <fileName>, colClass=classes)

## textual formats
* dumping and dputting - retains meta data to allow for easier readin.
* work with sharing over version control
* does sacrifice some readability
* downside -- not very space efficient on disk
