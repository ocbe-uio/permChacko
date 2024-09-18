chackoStatistic <- function(x_t, n, k, uniqueness_method = 2) {
  m <- length(x_t[, "x"])
  x_t_unique <- switch(uniqueness_method,
    x_t[seq_len(m), , drop = FALSE],  # legacy code (hidden)
    x_t[!duplicated(x_t[, "x"]), , drop = FALSE], # current implementation
  )
  k / n * sum(x_t_unique[, "t"] * (x_t_unique[, "x"] - n / k) ^ 2)
}
