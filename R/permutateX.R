permutateX <- function(X) {
  N <- sum(X)
  K <- length(X)
  as.vector(unname(table(sample(K, size = N, replace = TRUE))))
}
