#' @title Prints welcome message on package attachment
#' @description Prints package version number and welcome message on package
#' load
#' @param libname library location. See `?base::.onAttach` for details
#' @param pkgname package name. See `?base::.onAttach` for details
.onAttach <- function(libname, pkgname) {
  version <- read.dcf(
    file   = system.file("DESCRIPTION", package = pkgname),
    fields = "Version"
  )
  packageStartupMessage(
    "This is ", paste(pkgname, version), "\n",
    "To learn more about the package, please run help(\"permChacko-package\"),",
    " help(\"permChacko\"), and help(\"reduceVector\")."
  )
}
