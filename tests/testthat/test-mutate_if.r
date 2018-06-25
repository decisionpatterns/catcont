# test-mutate_if

context("mutate_if_*")

context( "  .data.frame")
test_that( "mutate_if_*.data.frame", {

  data(iris)

  iris ->.;
    mutate_if_cat(., as.character) ->.;
    expect_is( . , "data.frame" )
    .$Species ->.;
    # is.character(.) ->.;
    expect_is(., "character")


  iris ->.;
    mutate_if_cont(., as.integer) ->.;
    expect_is( . , "data.frame" )
    .[1:4] ->. ;
    sapply( ., expect_is, "integer" ) ->.;
})


if( require( "data.table", quietly = TRUE ) ) {

  context( "  .data.table")
  test_that( "mutate_if_*.data.table", {

    data(iris)
    data.table::setDT(iris)

    iris ->.;
      mutate_if_cat(., as.character) ->.;
      expect_is( . , "data.table" )
      expect_equal( data.table::address(iris), data.table::address(.))
      .$Species ->.;
      # is.character(.) ->.;
      expect_is(., "character")


    iris ->. ;
      mutate_if_cont(., as.integer) ->.;
      expect_is( . , "data.table" )
      expect_equal( address(iris), address(.))
      .[,1:4] ->. ;
      expect_is( . , "data.table" )
      sapply( ., expect_is, "integer" ) ->.;


  })

}
