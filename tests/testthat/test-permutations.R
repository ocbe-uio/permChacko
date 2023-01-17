test_that("Permutations contain expected properties", {
  chacko66_3 <- c(10L, 16L, 14L, 12L, 18L)
  chacko66_5 <- c(12L, 14L, 18L, 16L, 22L, 20L, 18L, 24L, 26L, 30L)
  ruxton22_12_07 <- c(6, 8, 4, 7, 3)
  for (i in seq_len(10)) {
    chacko66_3_perm <- permutateX(chacko66_3)
    chacko66_5_perm <- permutateX(chacko66_5)
    ruxton22_12_07_perm <- permutateX(ruxton22_12_07)
    expect_equal(sum(chacko66_3_perm), sum(chacko66_3))
    expect_equal(sum(chacko66_5_perm), sum(chacko66_5))
    expect_equal(sum(ruxton22_12_07_perm), sum(ruxton22_12_07))
    expect_equal(length(chacko66_3_perm), length(chacko66_3))
    expect_equal(length(chacko66_5_perm), length(chacko66_5))
    expect_equal(length(ruxton22_12_07_perm), length(ruxton22_12_07))
  }
})
