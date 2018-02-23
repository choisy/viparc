## ----setup, include = FALSE----------------------------------------------
knitr::knit_hooks$set(margin = function(before, options, envir) {
  if (before) par(mgp = c(1.5, .5, 0), bty = "n", plt = c(.105, .97, .13, .97))
  else NULL
})

knitr::opts_chunk$set(margin = TRUE, prompt = TRUE, comment = "#>",
                      collapse = TRUE, cache = FALSE, autodep = TRUE,
                      dev.args = list(pointsize = 11), fig.height = 3.5,
                      fig.width = 4.24725, fig.retina = 2,
                      fig.align = "center", fig.path = "README-")

## ----message = FALSE, eval = FALSE---------------------------------------
#  library(viparc)
#  library(dplyr) # for %>%, filter and transmute
#  data("chcknfarms")
#  chcknfarms %>%
#    filter(CYCLE == 1) %>%
#    transmute(space   = FARMCODE,
#              time    = WEEK,
#              disease = SRespiratory,
#              drug    = AntibioticUse) %>%
#    heat_map()

