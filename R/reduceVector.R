reduceVector <- function(x, verbose = FALSE) {
  x_t <- cbind("x" = x, "t" = x ^ 0L)
  while (nrow(x_t) > 1L && isMonotoneIncreasing(x_t[, "x"])) {
    if (verbose) {
      message("Reordering vector")
      print(x_t)
    }
    x_t <- orderingProcess(x_t, verbose = verbose)
  }
  if (verbose) {
    message("Final vector")
    print(x_t)
  }
  return(x_t)
}
