#' Look for presence of disease
#'
#' Look for the presence of disease over a period that follows a given time
#' point.
#'
#' @param x A boolean vector informing about the presence or absence of disease
#'          at a given point in time. This implies that this vector is
#'          considered to be chronologically ordered, the most recent
#'          observations being first.
#' @param n A integer scalar telling the number of time points after the current
#'          one to look for for defining the period of time over which we want
#'          to look for presence of disease.
#'
#' @return A boolean of vector of the same length as x, the n final values of
#'         which are NA.
#'
#' @examples
#' disease <- rep(rep(c(FALSE, TRUE), 7),
#'                c(rep(1, 4), 2, 3, 2, 2, 1, 1, 3, 2, 2, 3))
#' cbind(disease, any_disease(disease, 3))
#'
#' @export
#'
any_disease <- function(x, n = 1) {
  if (n < 1) stop("n should be higher than zero.")
  rowSums(sapply(seq_len(n), function(y) c(rev(rev(x)[-seq_len(y)]), rep(NA, y))) > 0)
}
