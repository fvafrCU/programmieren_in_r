## Sometimes in April ...
not_so_temporary_file <- file.path(not_so_temporary_directory, "readme.md")
cat("My first readme file.", file = not_so_temporary_file, sep = "\n")

## ... some days later
if (file.exists(not_so_temporary_file)) {
    file.rename(not_so_temporary_file, paste0(not_so_temporary_file, "1"))
}
cat("This is a directory created by 'Programmieren in R' .",
    file = not_so_temporary_file, sep = "\n")

