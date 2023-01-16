test_that("Examples from Chacko (1966) produce correct vectors", {
  chacko66_3 <- c(10L, 16L, 14L, 12L, 18L)
  chacko66_5 <- c(12L, 14L, 18L, 16L, 22L, 20L, 18L, 24L, 26L, 30L)
  expect_equal(reduceVector(chacko66_3)[, "x"], c(10, 14, 18))
  expect_equal(reduceVector(chacko66_3)[, "t"], c(1, 3, 1))
  expect_equal(reduceVector(chacko66_5)[, "x"], c(12, 14, 17, 20, 24, 26, 30))
  expect_equal(reduceVector(chacko66_5)[, "t"], c(1, 1, 2, 3, 1, 1, 1))
  expect_equal(permChacko(chacko66_3), 2.285714, tolerance = 1e-4)
  expect_equal(permChacko(chacko66_5), 13.5)
})