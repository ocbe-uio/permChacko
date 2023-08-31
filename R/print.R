#' @export
print.chacko_test <- function(x, ...) {
  p_values <- x[["p_values"]]
  cat(
    sprintf(
      paste0(
        "          Chacko Test for Order-restriction with Permutation Test\n\n",
        "Null hypothesis       : %s\n",
        "Alternative hypothesis: %s\n\n",
        "Test statistic (chisq_bar): %f\n",
        "p-values:\n",
        "  Analytic p-value:         %f\n",
        "  Numeric p-value:          %f (%d permutations)\n",
        "  Tabular p-value:          %f\n\n"
      ),
      paste0("p", seq_along(x$observed_data), collapse = " == "),
      paste0("p", seq_along(x$observed_data), collapse = " <= "),
      x[["statistic"]], p_values[["analytic"]],
      p_values[["numeric"]], x[["n_perm"]], p_values[["tabular"]]
    )
  )
}
