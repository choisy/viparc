#' Define weeks with no AMU
#'
#' The definition of a week without antimicrobial use (AMU) is based not only on
#' the status of AMU during that week, but also potentially on the AMU during
#' the n weeks that preceed.
#'
#' @param x A boolean vector describing the presence / absence of AMU.
#' @param n An scalar integer specifying the number of weeks to consider before
#'          a focal week in order to define AMU.
#'
#' @return A boolean vector of the same length as x, with the first n values
#'         equal to NA.
#'
#' @examples
#' no_amu(c(TRUE, rep(FALSE, 3)), 2)
#' amu <- rep(rep(c(TRUE, FALSE), 6), c(7, 2, 1, 2, 3, 1, 2, 1, 1, 1, 1, 3))
#' cbind(amu, no_amu(amu, 1))
#' # Note that each line is either c(FALSE, FALSE), c(TRUE, FALSE) or
#' # c(FALSE, TRUE), but there is no line that is c(TRUE, TRUE).
#'
#' @export
#'
no_amu <- function(x, n = 0) {
  x <- ! x
  if (n < 1) return(x)
  f <- function(y) {
    sel <- seq_len(y)
    c(rep(NA, y), rev(rev(x)[-sel]) & x[-sel])
  }
  rowSums(sapply(seq_len(n), f)) == n
}
