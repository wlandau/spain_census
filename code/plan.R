data_path <- here("data", "MicrodatosCP_NV_per_nacional_3VAR.txt")
labels_path <- here("data", "variable_labels.xls")
processed_path <- here("output", "microdatos_censo.rds")

plan <- drake_plan(
  download_step = write_census(file_out(!!data_path), file_out(!!processed_path)),
  downloaded_data = readRDS(file_in(!!processed_path)),
  processed_data = select(downloaded_data, c("CPRO", "CMUN", "IDHUECO"))
)
