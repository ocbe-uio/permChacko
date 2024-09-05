chackoStatistic <- function(x_t, n, k, fast = FALSE) {
  x_bar <- x_t[, "x"]
  t <- x_t[, "t"]
  m <- length(unique(x_bar))
  power_sum <- 0
  for (j in seq_len(m)) {
    power_sum <- power_sum + t[[j]] * (x_bar[[j]] - n / k) ^ 2
  }
  if (fast) {
    x_t_unique <- x_t[!duplicated(x_t[, "x"]), , drop = FALSE]
    return(k / n * sum(x_t_unique[, "t"] * (x_t_unique[, "x"] - n / k) ^ 2))
  }
  return(k / n * power_sum)
}
