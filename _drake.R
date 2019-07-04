source("code/01-packages.R")
source("code/02-reading_data.R")
source("code/plan.R")

drake_config(
  plan,
  memory_strategy = "memory", # will become "autoclean" next release
  console_log_file = "drake.log"
)
