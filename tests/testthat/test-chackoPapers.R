test_that("Examples from Chacko (1966) produce correct vectors", {
  expect_equal(reduceVector(chacko66_3)[, "x"], c(10, 14, 18))
  expect_equal(reduceVector(chacko66_3)[, "t"], c(1, 3, 1))
  expect_equal(reduceVector(chacko66_5)[, "x"], c(12, 14, 17, 20, 24, 26, 30))
  expect_equal(reduceVector(chacko66_5)[, "t"], c(1, 1, 2, 3, 1, 1, 1))
  expect_equal(permChacko(chacko66_3)[["chisq_bar"]], 2.28571, tolerance = 1e-4)
  expect_equal(permChacko(chacko66_5)[["chisq_bar"]], 13.5)
  set.seed(3174)
  expect_equal(
    permChacko(chacko66_3)[["numeric_p-value"]],
    permChacko(chacko66_3)[["tabular_p-value"]],
    tolerance = 1e-1
  )
  expect_equal(
    permChacko(chacko66_5)[["numeric_p-value"]],
    permChacko(chacko66_5)[["tabular_p-value"]],
    tolerance = 1e-1
  )
})
