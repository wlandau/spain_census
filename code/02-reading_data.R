write_census <- function(file_path, save_path) {
  ## Download the Spanish data

  if (!file.exists(file_path)) {
    message("The data is being downloaded")
    
    data_link <- "ftp://www.ine.es/temas/censopv/cen11/Microdatos_personas_nacional.zip"
    download.file(data_link, destfile = "./data/raw_data.zip")
    unzip("./data/raw_data.zip", exdir = "./data/")
  }

  censo <-
    suppressWarnings(
      censo2010(
        file_path
      )
    )

  # Because this data is so big, we save it to avoid rerunning censo2010
  # that way we save all the proprocessing of columns (which takes up
  # a lot of time).
  write_rds(censo, save_path)
}
