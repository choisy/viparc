#' Give the index of a sequence
#'
#' From a sequence \code{A A A B B C A A C C C} it will returns \code{1 2 3 1 2
#' 1 1 2 1 2 3}.
#'
#' This is basically a wrapper around the \code{\link[base]{rle}} function.
#'
#' @param x a vector.
#'
#' @return A vector of integers of the same length as \code{x}.
#'
#' @examples
#' x <- c("A", "A", "A", "B", "B", "C", "A", "A", "C", "C", "C")
#' index(x)
#'
#' @export
#'
index <- function(x) {
  unlist(sapply(rle(x)$lengths, seq_len))
}
