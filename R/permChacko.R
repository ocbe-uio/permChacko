#' @title The Chacko test for order-restriction with permutation test
#' @param x vector of numeric values
#' @param n_perm number of permutations to calculate the p-value numerically
#' @param verbose if \code{TRUE}, prints intermediate messages and output
#' @references
#' Chacko, V. J. (1963). Testing homogeneity against ordered alternatives. The
#' Annals of Mathematical Statistics, 945-956.
#'
#' Chacko, V. J. (1966). Modified chi-square test for ordered alternatives.
#' Sankhyā: The Indian Journal of Statistics, Series B, 185-190.
#' @importFrom stats weighted.mean pchisq
#' @examples
#' ruxton22_12_07 <- c(6, 8, 4, 7, 3)
#' chacko66_3 <- c(10L, 16L, 14L, 12L, 18L)
#' chacko66_5 <- c(12L, 14L, 18L, 16L, 22L, 20L, 18L, 24L, 26L, 30L)
#'
#' permChacko(ruxton22_12_07)
#' permChacko(chacko66_3)
#' permChacko(chacko66_5)
#' @export
permChacko <- function(x, n_perm = 1000L, verbose = FALSE) {
  # Ordering and reducing vector
  x_t <- reduceVector(x, verbose)
  k <- length(x)
  chisq_bar <- chackoStatistic(x_t, n = sum(x), k)

  # Calculating the mean of the current permutation
  perm_chisq_bar <- vapply(
    X = seq_len(n_perm),
    FUN = function(n, x, k) {
      perm_x <- permutateX(x)

      # For each such permutation we can go through the ordering procedure and
      # calculate the test statistic according to equation 5.
      perm_x_t <- reduceVector(perm_x, verbose)
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
  return(
    c(
      "chisq_bar" = chisq_bar,
      "analytic_p-value" = anal_p_value,
      "numeric_p-value" = perm_p_value,
      "tabular_p-value" = table_p_value
    )
  )
}
