# catcont

**Test For and Identify Categorical or Continuous Values**

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/catcont)](https://cran.r-project.org/package=catcont)
[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) 

Methods and utilities for classifying vectors as categorical 
or continuos. Methods is_cat() and is_cont() test for categorical and 
continous values respectively. Functions which_cat(), which_cont() and 
cat_cont() identify them within recursive objects.


## Installation

You can install from CRAN with: 

    install.packages("catcont")

You can install catcont from github with:

    # install.packages("devtools")
    devtools::install_github("decisionpatterns/catcont")

## Example

### Tests

    is_cat(letters)          # TRUE
    is_cat(factor(letters))  # TRUE
    is_cat(TRUE)             # TRUE
    is_cat(FALSE)            # TRUE
    is_cat(1:10)             # FALSE
    is_cat(rnorm(10))        # FALSE
    is_cat( Sys.Date() )     # FALSE
    is_cat( complex(1,2) )   # FALSE
     
    is_cont(letters)         # FALSE
    is_cont(factor(letters)) # FALSE
    is_cont(TRUE)            # FALSE
    is_cont(FALSE)           # FALSE
    is_cont(1:10)            # TRUE
    is_cont(rnorm(10))       # TRUE
    is_cont( Sys.Date() )    # TRUE
    is_cont( complex(1,2) )  # TRUE
     
### Identification 

    which_cat(iris)
    which_cat( iris, names=TRUE )
      
    which_cont(iris)
    which_cont( iris, names=TRUE )
 
