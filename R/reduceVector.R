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
#' @return A list containing the original vector, the reduced vector, their
#' weights and the number of reductions performed. Use [names()] and [str()]
#' on the output for more details.
#' @author Waldir Leoncio
#' @export
#' @examples
#' reduceVector(c(10, 16, 14, 12, 18))
#' reduceVector(c(10, 8, 4, 2, 1))
#' reduceVector(chacko66_sec3)
#' reduceVector(chacko66_sec5)
#' reduceVector(chacko66_sec5, verbosity = 1)
reduceVector <- function(x, verbosity = 0L) {
  if (!is.null(dim(x))) stop("Input must be a vector")
  x_t <- cbind("x" = unname(x), "t" = unname(x) ^ 0L)
  reductions <- 0L
  while (nrow(x_t) > 1L && isMonotoneIncreasing(x_t[, "x"])) {
    if (verbosity >= 1L) {
      message("Vector needs reduction\nInitial vector")
      print(t(x_t))
    }
    reductions <- reductions + 1L
    x_t <- orderingProcess(x_t, verbosity)
  }
  out <- list(
    "original_vector" = x,
    "reduced_vector" = x_t[, "x"],
    "weights" = x_t[, "t"],
    "x_t" = x_t,
    "reductions" = reductions,
    "verbosity" = verbosity
  )
  class(out) <- "reduced_vector"
  return(out)
}
