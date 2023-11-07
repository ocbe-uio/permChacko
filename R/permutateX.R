permutateX <- function(X) {
  N <- sum(X)
  K <- length(X)
  perm_x <- as.vector(unname(table(sample(K, size = N, replace = TRUE))))
  return(perm_x)
}
