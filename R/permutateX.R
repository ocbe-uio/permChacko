permutateX <- function(X) {
  N <- sum(X)
  K <- length(X)
  perm_x <- vector("integer", length = K)
  for (x in seq_len(N)) {
    x_category <- sample(K, size = 1)
    perm_x[x_category] <- perm_x[x_category] + 1
  }
  return(perm_x)
}
