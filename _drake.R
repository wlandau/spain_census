source("code/01-packages.R")
source("code/02-reading_data.R")
source("code/plan.R")

drake_config(
  plan,
  memory_strategy = "memory", # select "autoclean" or "preclean" next release
  garbage_collection = TRUE,
  console_log_file = "drake.log"
)
