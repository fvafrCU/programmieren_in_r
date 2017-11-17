source <- file.path(dirname(tempdir()) , "r_intro", "data", "input")
sink <- file.path("k:", "transpor", "programmieren_in_r", "nik", "data", 
                  "input")
files <- list.files(source, pattern = "^species_shares_20[01]2\\.csv",
                    full.names = TRUE)

# file_names <- c("species_shares.xlsx", "species_shares.accdb")
# files <- file.path(source, file_names)


dir.create(sink, recursive = TRUE, showWarnings = FALSE)
file.copy(files, sink, overwrite = TRUE)



convert_csv <- function(path) {
  csv_files <- list.files(path, pattern = ".*\\.csv", full.names = TRUE)
  for (file_path in csv_files) {
    tryCatch(write.csv(read.csv2(file_path), file = file_path),
             error = function(e) return(e))
  }
}
convert_csv(sink)
