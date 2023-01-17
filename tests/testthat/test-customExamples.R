test_that("Other from produce correct vectors", {
  ruxton22_12_07 <- c(6, 8, 4, 7, 3)
  expect_equal(reduceVector(ruxton22_12_07)[, "x"], c("x" = 5.6))
  expect_equal(reduceVector(ruxton22_12_07)[, "t"], c("t" = 5))
  expect_equal(permChacko(ruxton22_12_07)[["chisq_bar"]], 0)
  set.seed(2715249)
  expect_equal(
    permChacko(ruxton22_12_07)[["numeric_p-value"]],
    permChacko(ruxton22_12_07)[["tabular_p-value"]],
    tolerance = 1e-0
  )
})
