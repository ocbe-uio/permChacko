#' @title Table I
#' @description Table of \eqn{p_{m, k}}. Gives the values of \eqn{p_{m, k}} for
#' equal sample sizes and \eqn{k = 3, 4, \ldots, 10}.
#' @references
#' Chacko, V. J. (1963). Testing homogeneity against ordered alternatives. The
#' Annals of Mathematical Statistics, 945-956.
#' @name chacko_1963_table_1
#' @docType data
chacko_1963_table_1 <- matrix(
  c(
    .333333, .500000, .166667, rep(NA, 7),
    .250000, .458333, .250000, .041667, rep(NA, 6),
    .200000, .416667, .291667, .083333, .008333, rep(NA, 5),
    .166667, .380556, .312500, .118055, .020833, .001389, rep(NA, 4),
    .142857, .350000, .322222, .145833, .034722, .004167, .000198, rep(NA, 3),
    .125000, .324107, .325694, .167882, .048611, .007986, .000694, .000025, rep(NA, 2),
    .111111, .301984, .325519, .185417, .061863, .012500, .001505, .000099, .000003, rep(NA, 1),
    .100000, .282897, .323165, .199427, .074219, .017436, .002604, .000240, .000012, .000000
  ),
  nrow = 10,
  ncol = 8,
  dimnames = list(paste("m =", seq_len(10)), paste("k =", seq(3, 10)))
)

#' @title Chacko (1966), section 3
#' @description A multinomial example with 5 cell frequencies
#' @references
#' Chacko, V. J. (1966). Modified chi-square test for ordered alternatives.
#' Sankhyā: The Indian Journal of Statistics, Series B, 185-190.
#' @name chacko66_3
#' @docType data
chacko66_3 <- c("x1" = 10L, "x2" = 16L, "x3" = 14L, "x4" = 12L, "x5" = 18L)

#' @title Chacko (1966), section 5
#' @description A plate with the humidity values continuously decreasing was
#' divided into 10 equal parts and 20 termites introduced on each part. The
#' number of termites counted as a specified time interval on each of the 10
#' parts of the plate are shown in the dataset
#' @references
#' Chacko, V. J. (1966). Modified chi-square test for ordered alternatives.
#' Sankhyā: The Indian Journal of Statistics, Series B, 185-190.
#' @name chacko66_5
#' @docType data
chacko66_5 <- c(
  "x1" = 12L, "x2" = 14L, "x3" = 18L, "x4" = 16L, "x5" = 22L,
  "x6" = 20L, "x7" = 18L, "x8" = 24L, "x9" = 26L, "x10" = 30L
)

#' @title Example by Graeme Ruxton
#' @description A simple example showing how a vector can be reduced to one
#' element.
#' @name ruxton22_12_07
#' @docType data
ruxton22_12_07 <- c(6, 8, 4, 7, 3)
