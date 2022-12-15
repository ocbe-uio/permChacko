chackoStatistic <- function(x_t, n, k) {
  x_bar <- x_t[, "x"]
  t <- x_t[, "t"]
  m <- length(unique(x_bar))
  power_sum <- 0
  for (j in seq_len(m)) {
    power_sum <- power_sum + t[j] * (x_bar[j] - n / k) ^ 2
  }
  return(k / n * power_sum)
}
