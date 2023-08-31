#' @export
print.chacko_test <- function(x, ...) {
  cat("Chacko test for order-restriction with permutation test\n\n")
  cat("Test statistic (chisq_bar):",  x[["chisq_bar"]], "\n")
  cat("p-values:\n")
  cat("  Analytic p-value:        ", x[["analytic_p-value"]], "\n")
  cat("  Numeric p-value:         ", x[["numeric_p-value"]], "\n")
  cat("  Tabular p-value:         ", x[["tabular_p-value"]], "\n")
}
