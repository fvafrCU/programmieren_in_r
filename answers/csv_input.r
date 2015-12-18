files  <- c("species_shares_1987.csv", "species_shares_2002.csv", 
            "species_shares_2012.csv")
for (file in files) {
    df_name <- sub(".csv", "", file)
    assign(df_name, read.csv2(file.path(input_directory, file)))
}

