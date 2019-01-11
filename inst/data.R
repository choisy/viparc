diseases <- read.csv2("inst/extdata/DISEASE_GridEvent.csv", sep = ",",
                      na.strings = "na", header = TRUE, stringsAsFactors = FALSE)
amu <- read.csv2("inst/extdata/AMU_week.csv", sep=",", na.strings = "na",
                 header = TRUE, stringsAsFactors = FALSE)
amu_with_diseases <- merge(amu, diseases, by = "WeekID", all.X = TRUE)
devtools::use_data(diseases, amu, amu_with_diseases)
