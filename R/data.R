#' Disease and antimicrobial surveillance in chicken farms
#'
#' Data collected in the ViParc project (http://viparc.org).
#'
#' @format A data frame with 2226 rows and 9 variables:
#' \describe{
#'   \item{FARMCODE}{code of the farm, character.}
#'   \item{CYCLE}{number of the cycle, integer.}
#'   \item{WEEK}{number of the week, integer}
#'   \item{SRepiratory}{presence of respiratory infection, logical.}
#'   \item{SDiarrhoea}{presence of diarrhoea, logical.}
#'   \item{SCNS}{presence of central nervous system infection, logical.}
#'   \item{SMalaise}{presence of malaise, logical.}
#'   \item{Week_Mt}{weekly mortality, numeric.}
#'   \item{AntibioticUse}{use of antibiotic, logical.}
#' }
#' @source \url{http://viparc.org}
"chcknfarms"

#' Antimicrobial usage (AMU)
#'
#' Data collected in the ViParc project (http://viparc.org).
#'
#' Generated from \code{amu <- read.csv2(system.file("extdata", "AMU_week.csv", package = "viparc"), sep=",", na.strings = "na", header = TRUE, stringsAsFactors = FALSE)}
#'
#' @format A data frame with 3664 rows and 2 variables:
#' \describe{
#'   \item{WeekID}{number of the week, integer.}
#'   \item{AMU}{usage of antimicrobials, logical.}
#' }
#' @source \url{http://viparc.org}
"amu"



#' Diseases data
#'
#' Data collected in the ViParc project (http://viparc.org).
#'
#' Generated from \code{diseases <- read.csv2(system.file("extdata", "DISEASE_GridEvent.csv", package = "viparc"), sep=",", na.strings = "na", header = TRUE, stringsAsFactors = FALSE)}
#'
#' @format A data frame with 4271 rows and 17 variables:
#' \describe{
#'   \item{FarmID}{ID of farm.}
#'   \item{FlockID}{ID of flock, combining ID of farm with ID of cycle.}
#'   \item{Cycle}{ID of cycle.}
#'   \item{WEEK}{Week number.}
#'   \item{WeekID}{ID of week, combining ID of flock with ID of week.}
#'   \item{RESPIRATORY}{Presence / absence of respiratory symptoms.}
#'   \item{DIARRHOEA}{Presence / absence of diarrhoea symptoms.}
#'   \item{CNS}{Presence / absence of central nervous system infection symptoms.}
#'   \item{MALAISE}{Presence / absence of malaise.}
#'   \item{LEGLESIONS}{Presence / absence of leg lesions.}
#'   \item{SUDDENDEATH}{Presence / absence of sudden death.}
#'   \item{NoSign}{Presence / absence of  symptoms.}
#'   \item{Sick_yes}{Presence / absence of symptoms (any symptom).}
#'   \item{OTHDISEASE}{Presence / absence of other disease.}
#'   \item{CHICKENSICKNO}{Number of sick chicken.}
#'   \item{CHICKENDISEASEDEATH}{Number of chicken dead, excluding sudden death.}
#'   \item{CHICKENSUDDENDEATH}{Number of chicken dying from sudden death.}
#' }
#' @source \url{http://viparc.org}
"diseases"

#' AMU and Diseases data
#'
#' Data collected in the ViParc project (http://viparc.org).
#'
#' Generated from \code{amu_with_diseases <- merge(AMU, diseases, by = c("WeekID"), all.X = TRUE)}
#'
#' @format A data frame with 3663 rows and 18 variables:
#' \describe{
#'   \item{WeekID}{ID of week, combining ID of flock with ID of week.}
#'   \item{AMU}{usage of antimicrobials, logical.}
#'   \item{FarmID}{ID of farm.}
#'   \item{FlockID}{ID of flock, combining ID of farm with ID of cycle.}
#'   \item{Cycle}{ID of cycle.}
#'   \item{WEEK}{Week number.}
#'   \item{RESPIRATORY}{Presence / absence of respiratory symptoms.}
#'   \item{DIARRHOEA}{Presence / absence of diarrhoea symptoms.}
#'   \item{CNS}{Presence / absence of central nervous system infection symptoms.}
#'   \item{MALAISE}{Presence / absence of malaise.}
#'   \item{LEGLESIONS}{Presence / absence of leg lesions.}
#'   \item{SUDDENDEATH}{Presence / absence of sudden death.}
#'   \item{NoSign}{Presence / absence of  symptoms.}
#'   \item{Sick_yes}{Presence / absence of symptoms (any symptom).}
#'   \item{OTHDISEASE}{Presence / absence of other disease.}
#'   \item{CHICKENSICKNO}{Number of sick chicken.}
#'   \item{CHICKENDISEASEDEATH}{Number of chicken dead, excluding sudden death.}
#'   \item{CHICKENSUDDENDEATH}{Number of chicken dying from sudden death.}
#' }
#' @source \url{http://viparc.org}
"amu_with_diseases"
