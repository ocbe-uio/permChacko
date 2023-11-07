orderingProcess <- function(x_t, verbosity = 0) {
  x <- x_t[, "x"]
  t <- x_t[, "t"]
  i <- 1L
  while (i < length(x)) {
    if (verbosity >= 2L) cat("\nComparing", x[i], "and", x[i + 1L])
    if (x[i] <= x[i + 1L]) {
      if (verbosity >= 2L) cat(". Next.")
    } else {
      if (verbosity >= 2L) cat(". Replacing.\n")
      # Replacing values
      x[i] <- weighted.mean(c(x[i], x[i + 1L]), c(t[i], t[i + 1L]))
      t[i] <- t[i] + t[i + 1L]

      # Updating vector
      x <- x[-(i + 1L)]
      t <- t[-(i + 1L)]

      if (verbosity >= 2L && i < length(x) - 1L) {
        message("\nNew values and weights")
        print(cbind("x" = x, "t" = t))
      }
    }
    i <- i + 1L
  }
  out <- cbind("x" = x, "t" = t)
  if (verbosity >= 1L) {
    message("\n\nFinal vector")
    print(out)
  }
  return(out)
}
