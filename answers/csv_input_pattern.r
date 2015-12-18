files <- list.files(input_directory, pattern = "^species_shares_.*\\.csv$",
                    full.names = TRUE)
for (file_path in files) {
    file_name <- basename(file_path)
    df_name <- sub(".csv", "", file_name)
    assign(df_name, read.csv2(file_path))
}

