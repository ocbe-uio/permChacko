orderingProcess <- function(x_t, verbose = FALSE) {
  x <- x_t[, "x"]
  t <- x_t[, "t"]
  i <- 1L
  if (verbose) {
    message("Reordering vector")
    print(x_t)
  }
  while (i < length(x)) {
    if (verbose) cat("Comparing", x[i], "and", x[i + 1L])
    if (x[i] <= x[i + 1L]) {
      if (verbose) cat(". Next.\n")
    } else {
      if (verbose) cat(". Replacing.\n")
      # Replacing values
      x[i] <- weighted.mean(c(x[i], x[i + 1L]), c(t[i], t[i + 1L]))
      t[i] <- t[i] + t[i + 1L]

      # Updating vector
      x <- x[-(i + 1L)]
      t <- t[-(i + 1L)]

      if (verbose) {
        message("New values and weights")
        print(cbind("x" = x, "t" = t))
      }
    }
    i <- i + 1L
  }
  if (verbose) {
    message("Final vector")
    out <- cbind("x" = x, "t" = t)
    print(out)
  }
  return(out)
}
