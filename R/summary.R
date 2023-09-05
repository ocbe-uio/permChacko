#' @export
summary.reduced_vector  <- function(object, ...) {
  cat(
    sprintf(
      paste0(
        "\n",
        "Original vector: %s\n",
        "Reduced vector : %s\n",
        "Final weights  : %s\n\n",
        "Original vector has been reduced %d times\n\n",
        "Run reduceVector() with verbosity > 1) to see the reduction process",
        "\n"
      ),
      paste0(object[["original_vector"]], collapse = "\t"),
      paste0(object[["reduced_vector"]], collapse = "\t"),
      paste0(object[["weights"]], collapse = "\t"),
      object[["reductions"]]
    )
  )
}
