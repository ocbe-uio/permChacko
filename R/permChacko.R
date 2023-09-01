#' @title The Chacko test for order-restriction with permutation test
#' @param x vector of numeric values
#' @param n_perm number of permutations to calculate the p-value numerically
#' @param verbosity if \code{TRUE}, prints intermediate messages and output
#' @return A list containing the test statistic, p-values (analytic, numeric and
#' tabular, when available), the number of permutations performed, the original
#' data and the reduced data.
#'
#' @references
#' Chacko, V. J. (1963). Testing homogeneity against ordered alternatives. The
#' Annals of Mathematical Statistics, 945-956.
#'
#' Chacko, V. J. (1966). Modified chi-square test for ordered alternatives.
#' Sankhyā: The Indian Journal of Statistics, Series B, 185-190.
#' @importFrom stats weighted.mean pchisq
#' @examples
#' ruxton221207 <- c(6, 8, 4, 7, 3)
#' chacko66_sec3 <- c(10L, 16L, 14L, 12L, 18L)
#' chacko66_sec5 <- c(12L, 14L, 18L, 16L, 22L, 20L, 18L, 24L, 26L, 30L)
#'
#' permChacko(ruxton221207)
#' permChacko(chacko66_sec3)
#' permChacko(chacko66_sec5)
#' @export
permChacko <- function(x, n_perm = 1000L, verbosity = 0) {
  if (!is.null(dim(x))) stop("Input must be a vector")
  if (verbosity >= 1L) message("Reducing original vector")
  # Ordering and reducing vector
  x_t <- reduceVector(x, verbosity)[["x_t"]]
  k <- length(x)
  chisq_bar <- chackoStatistic(x_t, n = sum(x), k)

  if (verbosity >= 1L && n_perm > 0L) {
    message("\nReducing ", n_perm, " permutations of original vector")
  }
  # Calculating the mean of the current permutation
  perm_chisq_bar <- vapply(
    X = seq_len(n_perm),
    FUN = function(n, x, k) {
      perm_x <- permutateX(x)

      # For each such permutation we can go through the ordering procedure and
      # calculate the test statistic according to equation 5.
      perm_x_t <- reduceVector(perm_x, 0L)[["x_t"]]
      perm_chisq_bar <- chackoStatistic(perm_x_t, n = sum(perm_x), k)
      return(perm_chisq_bar)
    },
    FUN.VALUE = vector("double", 1L),
    x = x, k = k
  )

  # The p-value is simply the fraction of such permutations that yield a test
  # statistic equal to or greater than the one we originally observed.
  perm_p_value <- sum(perm_chisq_bar >= chisq_bar) / n_perm
  m <- nrow(x_t)
  anal_p_value <- ifelse(
    test = m > 1L,
    yes  = pchisq(chisq_bar, m - 1L, lower.tail = FALSE),
    no   = NA
  )

  # Calculating table p-value
  if (k %in% seq(3L, 10L) && m <= 10L) {
    table_p_value <- tablePvalue(k, m, chisq_bar)
  } else {
    table_p_value <- NA
  }
  if (verbosity >= 1L) message("\nTest statistics")
  p_values <- c(
    "analytic" = anal_p_value,
    "numeric" = perm_p_value,
    "tabular" = table_p_value
  )
  out <- list(
    statistic = chisq_bar,
    p_values = p_values,
    n_perm = n_perm,
    observed_data = x,
    reduced_data = x_t
  )
  class(out) <- "chacko_test"
  return(out)
}
