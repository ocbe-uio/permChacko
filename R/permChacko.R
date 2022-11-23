permChacko <- function(x) {
  # TODO: implement original algo following Graeme's notes:
  #
  # We begin with a list of k values x1,…xk with associated weights t1 = t2  =
  # …. = tk = 1.
  #
  # If for any 1≤i ≤ (k-1), we have that xk > xk+1 then we replace both values
  # xk and xk+1 by a single value which is their weighted average (using the
  # weights tk and tk+1), this new value takes the combined weight of the two
  # values it replaces tk + tk+1. The list is now one shorter, so k becomes k-1
  #
  # We repeat this process until k = 1 or we have a monotone increasing sequence
  # of numbers.
  #
  # This procedure allows me to recreate the two ordering process examples shown
  # on pages 187 and 189 of Chacko (1966).
  #
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
  #
  # That is – imagine that the sum of our original K values is N, then by a
  # permutation I mean a stochastic distribution of N objects (independently)
  # across the k categories (with each category being equally likely under the
  # null hypothesis). For each such permutation we can go through the ordering
  # procedure and calculate the test statistic according to equation 5. The
  # p-value is simply the fraction of such permutations that yield a test
  # statistic equal to or greater than the one we originally observed.
}
