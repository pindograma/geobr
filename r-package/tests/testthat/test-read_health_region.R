context("read_health_region")

# skip tests because they take too much time
testthat::skip_on_cran()
# testthat::skip_on_travis()
# skip_if(Sys.getenv("TEST_ONE") != "")

# Reading the data -----------------------

test_that("read_health_region", {

  # read data

  test_sf <- read_health_region()

  # check sf object
  testthat::expect_true(is(test_sf, "sf"))

  # check number of micro
  testthat::expect_equal(test_sf$code_health_region %>% length(), 438)

})



# ERRORS and messagens  -----------------------
test_that("read_health_region", {

  # Wrong year
  testthat::expect_error(read_health_region(year=9999999))
  testthat::expect_error(read_health_region(year="xxx"))
  testthat::expect_error(read_health_region(year=NULL))

})
