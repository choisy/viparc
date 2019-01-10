#' Fill gaps
#'
#' This function fills the gaps in a sequence of booleans.
#'
#' If \code{n = 1}, it will replace any \code{TRUE FALSE TRUE} sequence by
#' \code{TRUE TRUE TRUE}. If \code{n = 1}, it will additionally replace any
#' \code{TRUE FALSE FALSE TRUE} sequence by \code{TRUE TRUE TRUE TRUE} and so on.
#'
#' @param x A vector of boolean.
#' @param n A scalar integer specifying the length of gaps that we want to fill.
#'
#' @return A vector of boolean of the same size as \code{x}.
#'
#' @examples
#' x <- rep(c(rep(c(FALSE, TRUE), 7), FALSE),
#'          c(1, 3, 1, 1, 1, 2, 1, 2, 3, 2, 3, 1, 2, 3, 1))
#' fill_gaps(x)
#' fill_gaps(x, 2)
#'
#' @importFrom dplyr %>% mutate
#' @export
#'
fill_gaps <- function(x, n = 1) {
  require(magrittr)
  require(dplyr)
  x <- x %>%
    rle() %>%
    unclass() %>%
    as.data.frame()
  nr <- nrow(x)
  with(rbind(x[1, ],
             mutate(x[-c(1, nr), ],
                    values = ifelse(lengths < n + 1 & values == FALSE,
                                    TRUE,
                                    values)),
             x[nr, ]),
       rep(values, lengths))
}
