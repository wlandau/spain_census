write_census <- function(file_path, save_path) {
  ## Download the Spanish data

  if (!file.exist(file_path)) {
    message("The data is being downloaded")
    
    data_link <- "ftp://www.ine.es/temas/censopv/cen11/Microdatos_personas_nacional.zip"
    download.file(data_link, destfile = "./data/raw_data.zip")
    unzip("./data/raw_data.zip", exdir = "./data/")
  }

  message("The microdatos file is being read. This can take some time but",
          "this is only run if the preprocessed file is not saved. Once this",
          "is run once it will not run again.")
  
  censo <-
    censo2010(
      file_path
    )

  # Because this data is so big, we save it to avoid rerunning censo2010
  # that way we save all the proprocessing of columns (which takes up
  # a lot of time).
  write_rds(censo, save_path)
}
