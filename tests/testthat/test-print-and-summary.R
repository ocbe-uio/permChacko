set.seed(778566)

test_that("print.reduced_vector() works as expected", {
  expect_output(reduceVector(rpois(13, 8)), NA)
  expect_output(
    suppressMessages(reduceVector(rpois(11, 8), verbosity = 1)), "7\\.25 8"
  )
  x <- reduceVector(rpois(6, 6))
  expect_output(print(x), "Reduced vector : 4\\t4\\t4\\t5\\t8")
})
test_that("print.chacko_test() works as expected", {
  expect_output(permChacko(rpois(8, 6), n_perm = 50L), NA)
  y <- permChacko(rpois(3, 5), n_perm = 30L)
  expect_output(print(y), "Test statistic \\(chisq_bar\\): 0\\.500000")
  expect_output(print(y), "Analytic p-value\\s+: 0\\.778801")
  expect_output(print(y), "Numeric p-value.+: 0\\.400000 \\(30 permutation")
  expect_output(print(y), "Tabular p-value\\s+: 0\\.369550")
})
test_that("summary.reduced_vector() works as expected", {
  expect_output(summary(reduceVector(rpois(7, 7))), "has been reduced 3 times")
})
test_that("Hypothesis suppression works as expected", {
  expect_output(print(permChacko(4:1)), "p1 == p2 == p3 == p4")
  expect_output(print(permChacko(6:1)), "p1 == p2 == ... == p5 == p6")
})
