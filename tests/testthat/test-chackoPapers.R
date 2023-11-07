test_that("Vector reduction procedure works well", {
  c66s3 <- reduceVector(chacko66_sec3)
  c66s5 <- reduceVector(chacko66_sec5)
  expect_equal(c66s3[["x_t"]][, "x"], c(10, 14, 18))
  expect_equal(c66s3[["x_t"]][, "t"], c(1, 3, 1))
  expect_equal(c66s5[["x_t"]][, 1], c(12, 14, 17, 20, 24, 26, 30))
  expect_equal(c66s5[["x_t"]][, 2], c(1, 1, 2, 3, 1, 1, 1))
})

test_that("Examples from Chacko (1966) produce correct statistics", {
  set.seed(3174)
  c66s3 <- permChacko(chacko66_sec3)
  c66s5 <- permChacko(chacko66_sec5)
  expect_output(
    print(c66s3),
    "Chacko Test for Order-restriction with Permutation Test"
  )
  expect_equal(c66s3[["statistic"]], 2.2857143)
  expect_equal(c66s5[["statistic"]], 13.5)
  expect_equal(
    c66s3[["p_values"]][["numeric"]],
    c66s3[["p_values"]][["tabular"]],
    tolerance = 1e-1
  )
  expect_equal(
    c66s5[["p_values"]][["numeric"]],
    c66s5[["p_values"]][["tabular"]],
    tolerance = 1e-1
  )
})
