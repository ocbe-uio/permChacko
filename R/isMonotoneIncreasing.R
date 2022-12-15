isMonotoneIncreasing <- function(x) {
  any(diff(x) < 0L)
}
