tablePvalue <- function(k, m, chisq_bar) {
  table_chisq <- vapply(
    X = seq(2L, k),
    FUN = function(m) pchisq(chisq_bar, m - 1L, lower.tail = FALSE),
    FUN.VALUE = vector("double", 1L)
  )
  table_p <- chacko63_tab1[seq(2, k), k - 2]
  return(sum(table_chisq * table_p))
}
