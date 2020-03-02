# Example                                                       |Phylogeny|Gen|Cand|Twin|TTM|DSL|STRAF|STWAF|Err |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)                                                                                                 |[![AppVeyor logo](pics/AppVeyor.png)](https://www.appveyor.com)
# --------------------------------------------------------------|---------|---|----|----|---|---|-----|-----|----|--------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# [10](https://github.com/richelbilderbeek/pirouette_example_10)|Fict     |N  |Y   |Y   |BD |1k |STD  |STDEQ|nLTT|[![Build Status](https://travis-ci.org/richelbilderbeek/pirouette_example_10.svg?branch=master)](https://travis-ci.org/richelbilderbeek/pirouette_example_10) | -
# Works under Linux and MacOS only
#
# Difference from standard:
# - no generative model
#
library(pirouette)

# Constants
is_testing <- is_on_travis()
example_no <- 10
rng_seed <- 314
folder_name <- paste0("example_", example_no, "_", rng_seed)

# Create phylogeny
phylogeny  <- ape::read.tree(
  text = "(((A:8, B:8):1, C:9):1, ((D:8, E:8):1, F:9):1);"
)

# Setup pirouette
pir_params <- create_std_pir_params(
  folder_name = folder_name
)
# Remove generative experiment
pir_params$experiments <- pir_params$experiments[-1]
if (is_testing) {
  pir_params <- shorten_pir_params(pir_params)
}

# Run pirouette
pir_out <- pir_run(
  phylogeny,
  pir_params = pir_params
)

# Save results
pir_save(
  phylogeny = phylogeny,
  pir_params = pir_params,
  pir_out = pir_out,
  folder_name = folder_name
)

