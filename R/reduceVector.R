# Notice that Chacko was entirely comfortable with this ordering process
# ending with a single value. If you look at their table on page 188 then he
# suggests that under the null hypothesis – if you start with a list of 5
# values, then you have a 20% chance that this process that the order process
# results in a single value.

reduceVector <- function(x, verbosity = 0L) {
  x_t <- cbind("x" = unname(x), "t" = unname(x) ^ 0L)
  while (nrow(x_t) > 1L && isMonotoneIncreasing(x_t[, "x"])) {
    if (verbosity >= 1L) {
      message("\nVector needs reduction\nInitial vector")
      print(t(x_t))
    }
    x_t <- orderingProcess(x_t, verbosity)
  }
  return(invisible(x_t))
}
