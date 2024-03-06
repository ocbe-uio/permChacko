#' @export
print.chacko_test <- function(x, ...) {
  p_values <- x[["p_values"]]
  cat(
    sprintf(
      paste0(
        "\n        Chacko Test for Order-restriction with Permutation Test\n\n",
        "Null hypothesis           : %s\n",
        "Alternative hypothesis    : %s\n\n",
        "Test statistic (chisq_bar): %f\n",
        "p-values:\n",
        "  Analytic p-value        : %f\n",
        "  Numeric p-value (<=)    : %f (%d permutations)\n",
        "  Numeric p-value (<)     : %f (%d permutations)\n",
        "  Tabular p-value         : %f\n"
      ),
      printHypothesis("p", seq_along(x$observed_data), "=="),
      printHypothesis("p", seq_along(x$observed_data), "<="),
      x[["statistic"]],
      p_values[["analytic"]],
      p_values[["numeric"]], x[["n_perm"]],
      p_values[["numeric_alt"]], x[["n_perm"]],
      p_values[["tabular"]]
    )
  )
}

#' @export
print.reduced_vector <- function(x, details = TRUE, ...) {
  cat(
    sprintf(
      paste0(
        "\n",
        "Original vector: %s\n",
        "Reduced vector : %s\n"
      ),
      paste0(x[["original_vector"]], collapse = "\t"),
      paste0(round(x[["reduced_vector"]], 3), collapse = "\t")
    )
  )
}

printHypothesis <- function(x_name, x_indices, operator = "==") {
  operator <- paste0(" ", operator, " ")
  if (length(x_indices) < 6) {
    return(paste0(x_name, x_indices, collapse = operator))
  } else {
    first_idx <- 1:2
    last_idx <- seq(length(x_indices) - 1, length(x_indices))
    first_x <- paste0(x_name, x_indices[first_idx], collapse = operator)
    last_x <- paste0(x_name, x_indices[last_idx], collapse = operator)
    paste0(first_x, operator, "...", operator, last_x)
  }
}
