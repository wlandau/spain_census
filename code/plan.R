data_path <- here("data", "MicrodatosCP_NV_per_nacional_3VAR.txt")
labels_path <- here("data", "variable_labels.xls")
processed_path <- here("output", "microdatos_censo.rds")

# If file hasn't been processed, do it. This reads the raw
# txt file and saves it as .rds file because the preprocessing
# from census2010 function takes up a lot of time. By saving it
# we save all the time of preprocessing columns.
if (!file.exists(processed_path)) write_census(data_path, processed_path)

message("Reading the data (heavy, takes up to a few minutes)")
read_data <- read_rds(processed_path)

plan <-
  drake_plan(
    read_codebook = read_codebook_labels(file_in(labels_path)),
    process_data = select_few(read_data)
  )
