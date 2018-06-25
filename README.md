# catcont

**Test For and Identify Categorical or Continuous Values**

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/catcont)](https://cran.r-project.org/package=catcont)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) 

This collection of methods and utilities allows for a working with
vectors at a higher level abstraction, i.e. by whether they are 
categorical (nominal)  or continous. The functions allow for testing, 
identifying, selecting, mutating,etc. and work with  both 
atomic vectors and recursive objects (table and list-like) objects in a 
tidyverse compliant way.


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

    # Atomic 
    cat_cont(1:10)
    cat_cont(letters)
     
    # Recursive 
    cat_cont(iris)
     
    which_cat(iris)
    which_cat( iris, names=TRUE )
      
    which_cont(iris)
    which_cont( iris, names=TRUE )

   
 
### Selection 

    iris %>% select_cat()
    iris %>% select_cont()
    
    
### Mutation 

    iris %>% mutate_if_cat(...)
    iris %>% mutate_if_cont(...)
