# Example                                                       |Phylogeny|Gen|Cand|Twin|TTM|DSL|STRAF|STWAF|Err |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)                                                                                                 |[![AppVeyor logo](pics/AppVeyor.png)](https://www.appveyor.com)
# --------------------------------------------------------------|---------|---|----|----|---|---|-----|-----|----|--------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# [10](https://github.com/richelbilderbeek/pirouette_example_10)|Fict     |N  |Y   |Y   |BD |1k |STD  |STDEQ|nLTT|[![Build Status](https://travis-ci.org/richelbilderbeek/pirouette_example_10.svg?branch=master)](https://travis-ci.org/richelbilderbeek/pirouette_example_10) | -
# Works under Linux and MacOS only
#
# Difference from standard: 
# - no generative model
#

library(pirouette)
suppressMessages(library(ggplot2))

################################################################################
# Constants
################################################################################
is_testing <- is_on_travis()
example_no <- 10
rng_seed <- 314
folder_name <- paste0("example_", example_no, "_", rng_seed)

################################################################################
# Create phylogeny
################################################################################
phylogeny  <- ape::read.tree(
  text = "(((A:8, B:8):1, C:9):1, ((D:8, E:8):1, F:9):1);"
)

################################################################################
# Setup pirouette
################################################################################
pir_params <- create_std_pir_params(
  folder_name = folder_name
)
stop("Remove generative experiment here")

if (is_testing) {
  pir_params <- shorten_pir_params(pir_params)
}

################################################################################
# Run pirouette
################################################################################
errors <- pir_run(
  phylogeny,
  pir_params = pir_params
)

utils::write.csv(
  x = errors,
  file = file.path(folder_name, "errors.csv"),
  row.names = FALSE
)

pir_plot(errors) +
  ggsave(file.path(folder_name, "errors.png"))

pir_to_pics(
  phylogeny = phylogeny,
  pir_params = pir_params,
  folder = folder_name
)

pir_to_tables(
  pir_params = pir_params,
  folder = folder_name
)
