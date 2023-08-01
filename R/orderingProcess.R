orderingProcess <- function(x_t, verbose = FALSE) {
  x <- x_t[, "x"]
  t <- x_t[, "t"]
  i <- 1L
  if (verbose) {
    message("\nInitial vector")
    print(x_t)
  }
  while (i < length(x)) {
    if (verbose) cat("\nComparing", x[i], "and", x[i + 1L])
    if (x[i] <= x[i + 1L]) {
      if (verbose) cat(". Next.")
    } else {
      if (verbose) cat(". Replacing.\n")
      # Replacing values
      x[i] <- weighted.mean(c(x[i], x[i + 1L]), c(t[i], t[i + 1L]))
      t[i] <- t[i] + t[i + 1L]

      # Updating vector
      x <- x[-(i + 1L)]
      t <- t[-(i + 1L)]

      if (verbose && i < length(x) - 1L) {
        message("\nNew values and weights")
        print(cbind("x" = x, "t" = t))
      }
    }
    i <- i + 1L
  }
  if (verbose) {
    message("\nFinal vector")
    out <- cbind("x" = x, "t" = t)
    print(out)
  }
  return(out)
}
