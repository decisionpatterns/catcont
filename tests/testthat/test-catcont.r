
source("utils.R")

context( "is_cat")
test_that( "is_cat", {
  is_cat(letters)          %>% expect_true
  is_cat(factor(letters))  %>% expect_true
  is_cat(TRUE)             %>% expect_true
  is_cat(FALSE)            %>% expect_true
  is_cat(1:10)             %>% expect_false
  is_cat(rnorm(10))        %>% expect_false
  is_cat( Sys.Date() )    %>% expect_false
  is_cat( complex(1,2) )  %>% expect_false
  # is_cat( now() )          %>% expect_false
})

context('is_cont')
test_that( "is_contt", {
  is_cont(letters)         %>% expect_false
  is_cont(factor(letters)) %>% expect_false
  is_cont(TRUE)            %>% expect_false
  is_cont(FALSE)           %>% expect_false
  is_cont(1:10)            %>% expect_true
  is_cont(rnorm(10))       %>% expect_true
  is_cont( Sys.Date() )    %>% expect_true
  is_cont( complex(1,2) )  %>% expect_true
})

context('which_cat')
test_that( "which_cat", {
  which_cat(iris)               %>% expect_equal( c( Species= 5) )
  which_cat( iris, names=TRUE ) %>% expect_equal( "Species")
})

context('which_cont')
test_that('which_cont', {
  which_cont( iris )             %>% expect_equivalent( 1:4 )
  which_cont( iris, names=TRUE ) %>% expect_equal( names(iris)[1:4] )
})

context('cat_cont')
test_that('cat_cont', {

  data(iris)
  res <- structure(c("cont", "cont", "cont", "cont", "cat"), .Names = c("Sepal.Length",
    "Sepal.Width", "Petal.Length", "Petal.Width", "Species"))

  cat_cont(iris) %>% expect_identical(res)

})
