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

  # Notice that Chacko was entirely comfortable with this ordering process
  # ending with a single value. If you look at their table on page 188 then he
  # suggests that under the null hypothesis – if you start with a list of 5
  # values, then you have a 20% chance that this process that the order process
  # results in a single value.
  #
  # Even if the outcome is a single value, the test statistic can be calculated
  # from equation 5 on page 188.
  #
  # The question then becomes how do we obtain a p-value associated with this
  # test statistic.
  #
  # I agree that just under equation 5, Chacko says that the test statistic is
  # asymptotically chi-squared with m- 1 degrees of freedom (where m is the
  # length of the final order list of values). However, he does not discuss what
  # this means in the event on m = 1. However, as I discuss above, they clearly
  # expect that this will happen sometimes.
  #
  # If you look at their final example on how they evaluate significance – they
  # say that you reject the null hypothesis if the  observed calculated value
  # obtained from equation (5) is greater than the value c obtained from
  # equation 6. This approach does work when m = 1 but seems very cumbersome –
  # requiring calculation of the probability values given on the table on page
  # 188, which requires consultation of Chacko (1963).
  #
  # I think with the computing power now we would simply obtain the p-value
  # using a permutation test.

  # That is – imagine that the sum of our original K values is N, then by a
  # permutation I mean a stochastic distribution of N objects (independently)
  # across the k categories (with each category being equally likely under the
  # null hypothesis).
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
