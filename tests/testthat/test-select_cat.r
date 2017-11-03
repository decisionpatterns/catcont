
library(magrittr)

context('select_cat and select_cont')

test_that( 'select_.data.frame', {

  data(iris)
  iris %>% select_cat()  %>% ncol %>% expect_equal(1)
  iris %>% select_cat() %>% names() %>% expect_equal( names(iris)[5] )

  iris %>% select_cont() %>% ncol %>% expect_equal(4)
  iris %>% select_cont() %>% names() %>% expect_equal( names(iris)[1:4] )

})


if( require(data.table) )
test_that( 'select_.data.table', {

  data(iris)
  setDT(iris)
  iris %>% select_cat()  %>% ncol %>% expect_equal(1)
  iris %>% select_cat() %>% names() %>% expect_equal( names(iris)[5] )

  iris %>% select_cont() %>% ncol %>% expect_equal(4)
  iris %>% select_cont() %>% names() %>% expect_equal( names(iris)[1:4] )

})
