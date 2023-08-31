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

#' @export
print.reduced_vector <- function(x, details = TRUE, ...) {
  if (x[["verbose"]] >= 1L) {
    cat(sprintf("Original vector has been reduced %d times", x[["reductions"]]))
  } else {
    cat(
      sprintf(
        paste0(
          "Original vector: %s\n",
          "Reduced vector : %s\n",
          "Final weights  : %s\n",
          "Original vector has been reduced %d times\n\n",
          "Run reduceVector() with verbosity > 1) to see the reduction process"
        ),
        paste0(x[["original_vector"]], collapse = "\t"),
        paste0(x[["reduced_vector"]], collapse = "\t"),
        paste0(x[["weights"]], collapse = "\t"),
        x[["reductions"]]
      )
    )
  }
}
