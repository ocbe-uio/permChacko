orderingProcess <- function(x_t, verbose = FALSE) {
  x <- x_t[, "x"]
  t <- x_t[, "t"]
  i <- 1L
  while (i < length(x)) {
    if (verbose) cat("Evaluating index", i, "\n")
    if (x[i] > x[i + 1L]) {
      if (verbose) message("Replacing ", x[i], " and ", x[i + 1L])
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
  return(cbind("x" = x, "t" = t))
}
