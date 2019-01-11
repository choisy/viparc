#' Effect of AMU on occurence of disease
#'
#' Uses a Fisher exact test to test whether AMU increases disease occurence.
#'
#' We consider only weeks with no diseases. Among these weeks, we make 2 groups:
#' one with AMU and one without AMU. The groups with AMU contains the weeks that
#' have AMU. The groups without AMU contains the weeks that do not have AMU as
#' well as no AMU of the \code{week_amu} weeks that precede. For these 2 groups,
#' we look at the presence of disease during the \code{week_disease} weeks that
#' follow. We thus end up with a contingency table of AMU and presence of
#' disease that we feed to a Fisher exact test.
#'
#' @param x a data frame.
#' @param time the name of the data frame variable that corresponds to time (the
#'             data frame will be orderd chronologically).
#' @param time the name of the data frame variable that corresponds to space (
#'             the computation of the presence of AMU and disease will be
#'             performed by spatial unit).
#' @param time the name of the data frame variable that corresponds to AMU
#'             (logical).
#' @param time the name of the data frame variable that corresponds to presence
#'             of disease (logical).
#' @param week_amu the number of weeks before the focal week we consider to
#'                 define the presence or absence of AMU.
#' @param week_disease the number of weeks after the focal week over which we
#'                     look for presence or absence of disease.
#'
#' @return A list containing the contingency table and the result of the Fisher
#'         exact test.
#'
#' @examples
#' library(dplyr)
#'
#' amu_with_disease %>%
#'   amu_causes_diseases()
#'
#' amu_with_disease %>%
#'   amu_causes_diseases(disease = "DIARRHOEA")
#'
#' amu_with_disease %>%
#'   mutate(Sick_yes = DIARRHOEA | RESPIRATORY ) %>%
#'   amu_causes_diseases()
#'
#' amu_with_disease %>%
#'   mutate(Sick_yes = DIARRHOEA | RESPIRATORY ) %>%
#'   amu_causes_diseases(week_disease = 3)
#'
#' @importFrom magrittr %>% %T>%
#' @importFrom dplyr mutate arrange select group_by ungroup filter
#' @export
amu_causes_disease <- function(x, time         = "WEEK",
                                  space        = "FlockID",
                                  amu          = "AMU",
                                  disease      = "Sick_yes",
                                  week_amu     = 1,
                                  week_disease = 2) {
  x %>%
    mutate(time    = !! sym(time),
           space   = !! sym(space),
           amu     = !! sym(amu),
           disease = !! sym(disease)) %>%
    arrange(time) %>%
    select(space, amu, disease) %>%
    group_by(space) %>%
    mutate(no_amu = no_amu(amu, week_amu),
           diseas = any_disease(disease, week_disease)) %>%
    ungroup() %>%
    na.exclude() %>%
    filter(! disease,
           amu + no_amu > 0) %>%
    mutate(amu = ! no_amu) %>%
    select(diseas, amu) %>%
    table() %T>% print() %>%
    fisher.test()
}
