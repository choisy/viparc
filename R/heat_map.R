#' Tuned version of base::data.frame
#' @noRd
data.frame2 <- function(...) {
  data.frame(..., stringsAsFactors = FALSE)
}


#' Adds 2 matrices, taking dimensions names from the second one
#' @noRd
add_mat <- function(x, y) {
  out <- x + y
  rownames(out) <- rownames(y)
  colnames(out) <- colnames(y)
  out
}


#' Processes surveillance data according to one disease
#' @noRd
#' @importFrom magrittr %>% %$%
#' @importFrom dplyr filter mutate right_join select mutate_all
put_in_shape <- function(df) {
  surveyed_weeks <- df %$%
    table(space, time) %>%
    unclass()
  df %>%
    filter(disease >0) %$%
    table(space, time) %>%
    unclass() %>%
    as.data.frame() %>%
    mutate(space = rownames(.)) %>%
    right_join(data.frame2(space = rownames(surveyed_weeks)), "space") %>%
    select(-space) %>%
    t() %>%
    as.data.frame() %>%
    mutate(time = rownames(.)) %>%
    right_join(data.frame2(time = colnames(surveyed_weeks)), "time") %>%
    select(-time) %>%
    t() %>%
    as.data.frame() %>%
    mutate_all(funs(ifelse(is.na(.), 0, .))) %>%
    add_mat(surveyed_weeks) %>%
    as.matrix()
}


#' order the rows of a matrix according to the column index of the last non null value.
#' @noRd
order_rows <- function(mat, dec) {
  mat[order(apply(mat, 1, function(x) last(which(x > 0))), decreasing = dec), ]
}


#' Tuned version of the graphics::image function
#' @noRd
image2 <- function(z, ...) {
  image(seq_len(ncol(z)), seq_len(nrow(z)), t(z), ...)
}


#' Transforms a vector into a hash table
#' @noRd
make_hash <- function(x) {
  setNames(seq_along(x), x)
}

#' Heatmap of disease and antimicrobial usage of surveillance data
#'
#' blablabla
#'
#' @param df data frame with 4 variable named "time", "space", "disease" and
#'           "drug". "time" and "space" are considered as integer and character
#'           respectively and "disease" and "drug" are both considered as
#'           logical.
#'
#' @param xlab label of the x axis. Default to "time".
#'
#' @param ylab label of the y axis. Default to "space".
#'
#' @param col_na color used for non surveyed time/space.
#'
#' @param col_surv_no_dis color used for surveyed time/space with no disease.
#'
#' @param col_surv_dis color used for surveyed time/space with disease
#'
#' @param ... additional parameters passed to the "points" function that add
#'            the "drug" information.
#'
#' @author Marc Choisy
#'
#' @importFrom magrittr %>% %$%
#' @importFrom dplyr filter transmute
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' chcknfarms %>%
#'   filter(CYCLE == 1) %>%
#'   transmute(space   = FARMCODE,
#'             time    = WEEK,
#'             disease = SRespiratory,
#'             drug    = AntibioticUse) %>%
#'   heat_map(xlab = "week", ylab = "farm")
#'
heat_map <- function(df, dec = FALSE, xlab = "time", ylab = "space",
                     col_na = "lightgrey", col_surv_no_dis = "blue",
                     col_surv_dis = "red", ...) {
  disease_weeks <- put_in_shape(df)
  image2(order_rows(disease_weeks, dec), xlab = xlab, ylab = ylab, bty = "n",
         col = c(col_na, col_surv_no_dis, col_surv_dis))
  abline(v = seq(.5, ncol(disease_weeks) - .5),
         h = seq(.5, nrow(disease_weeks) - .5), col = "white", lwd = .5)
  df %>%
    filter(drug > 0) %>%
    transmute(x = as.integer(time),
              y = make_hash(rownames(order_rows(disease_weeks, dec)))[space]) %$%
    points(x, y, ...)
  box(bty = "o")
}
