test_that("Examples from Chacko (1966) produce correct vectors", {
  expect_equal(reduceVector(chacko66_sec3)[, "x"], c(10, 14, 18))
  expect_equal(reduceVector(chacko66_sec3)[, "t"], c(1, 3, 1))
  expect_equal(reduceVector(chacko66_sec5)[, 1], c(12, 14, 17, 20, 24, 26, 30))
  expect_equal(reduceVector(chacko66_sec5)[, 2], c(1, 1, 2, 3, 1, 1, 1))
  expect_equal(permChacko(chacko66_sec3)[["chisq_bar"]], 2.2857143)
  expect_equal(permChacko(chacko66_sec5)[["chisq_bar"]], 13.5)
  set.seed(3174)
  expect_equal(
    permChacko(chacko66_sec3)[["numeric_p-value"]],
    permChacko(chacko66_sec3)[["tabular_p-value"]],
    tolerance = 1e-1
  )
  expect_equal(
    permChacko(chacko66_sec5)[["numeric_p-value"]],
    permChacko(chacko66_sec5)[["tabular_p-value"]],
    tolerance = 1e-1
  )
})
