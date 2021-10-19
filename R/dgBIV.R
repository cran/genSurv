dgBIV <- function(n, dist, corr, dist.par) {
  return(
    .Call(Rf_dgBIV, as.integer(n), dist, as.double(corr), as.double(dist.par), PACKAGE="genSurv")
  )
}
