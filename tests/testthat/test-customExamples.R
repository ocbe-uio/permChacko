test_that("Other from produce correct vectors", {
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

test_that("Expected output is produced", {
  # Fixed input
  set.seed(862255)
  vec <- rpois(5L, lambda = 100L)
  expect_output(suppressMessages(reduceVector(vec, verbose = TRUE)))

  # Random imput
  for (i in seq_len(10L)) {
    n <- sample(1:20, size = 1L)
    mu <- sample(10:100, size = 1L)
    x <- rpois(n, lambda = mu)
    reps <- sample(c(0L, 10L, 100L, 1000L, 2000L), size = 1L)
    y <- permChacko(x, n_perm = reps)
    expect_length(y, 4L)
    expect_type(y, "double")
  }
})
