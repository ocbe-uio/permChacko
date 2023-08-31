test_that("Other from produce correct vectors", {
  expect_equal(reduceVector(ruxton221207)[["x_t"]][, "x"], c("x" = 5.6))
  expect_equal(reduceVector(ruxton221207)[["x_t"]][, "t"], c("t" = 5))
  expect_equal(permChacko(ruxton221207)[["statistic"]], 0)
  set.seed(2715249)
  expect_equal(
    permChacko(ruxton221207)[["numeric_p-value"]],
    permChacko(ruxton221207)[["tabular_p-value"]],
    tolerance = 1e-0
  )
})

test_that("Expected output is produced", {
  # Fixed input
  set.seed(862255)
  vec <- rpois(5L, lambda = 100L)
  expect_output(suppressMessages(reduceVector(vec, verbosity = 3L)))

  # Random imput
  for (i in seq_len(10L)) {
    n <- sample(1:20, size = 1L)
    mu <- sample(10:100, size = 1L)
    x <- rpois(n, lambda = mu)
    reps <- sample(c(0L, 10L, 100L, 1000L, 2000L), size = 1L)
    y <- permChacko(x, n_perm = reps)
    expect_length(y, 5L)
    expect_type(y, "list")
  }
})
