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

## ----message = FALSE-----------------------------------------------------
library(viparc)
library(dplyr)

## ----message = FALSE, eval = FALSE---------------------------------------
#  data("chcknfarms")
#  chcknfarms %>%
#    filter(CYCLE == 1) %>%
#    transmute(space   = FARMCODE,
#              time    = WEEK,
#              disease = SRespiratory,
#              drug    = AntibioticUse) %>%
#    heat_map()

## ------------------------------------------------------------------------
amu <- rep(rep(c(TRUE, FALSE), 6), c(7, 2, 1, 2, 3, 1, 2, 1, 1, 1, 1, 3))

## ------------------------------------------------------------------------
data.frame(amu) %>%
  mutate(
    with_amu = amu,
    wout_amu = no_amu(amu, 1)) %>%
  select(-amu)

## ------------------------------------------------------------------------
data.frame(amu) %>%
  mutate(
    with_amu = amu,
    wout_amu = no_amu(amu, 1)) %>%
  select(-amu) %>% 
  filter(with_amu + wout_amu > 0)

