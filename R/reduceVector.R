# Notice that Chacko was entirely comfortable with this ordering process
# ending with a single value. If you look at their table on page 188 then he
# suggests that under the null hypothesis – if you start with a list of 5
# values, then you have a 20% chance that this process that the order process
# results in a single value.

#' @title Reduce a vector using the ordering process
#' @description This function implements the ordering process described in
#' Chacko (1963) and Chacko (1966).
#' @param x a vector of numeric values
#' @param verbosity a natural number indicating the amount of output to print
#' @return A matrix with two columns: the first one is the reduced vector and
#' the second one is its weight
#' @author Waldir Leoncio
#' @export
#' @examples
#' reduceVector(c(10, 16, 14, 12, 18))
#' reduceVector(c(10, 8, 4, 2, 1))
#' reduceVector(chacko66_sec3)
#' reduceVector(chacko66_sec5)
reduceVector <- function(x, verbosity = 0L) {
  x_t <- cbind("x" = unname(x), "t" = unname(x) ^ 0L)
  while (nrow(x_t) > 1L && isMonotoneIncreasing(x_t[, "x"])) {
    if (verbosity >= 1L) {
      message("\nVector needs reduction\nInitial vector")
      print(t(x_t))
    }
    x_t <- orderingProcess(x_t, verbosity)
  }
  return(x_t)
}
