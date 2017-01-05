#% set the root directory 
root <- file.path(dirname(tempdir()), "personal_directories")

#% read the file containing the names
lines <- readLines(file.path("files", "names.txt"))
#% extract names, order them in given_name surname.
non_empty_lines <- lines[which(lines != "")]
surnames <- trimws(sapply(strsplit(non_empty_lines, ","), "[", 1))
given_names <- trimws(sapply(strsplit(non_empty_lines, ","), "[", 2))
names <- paste(given_names, surnames)
#% create path 
dir.create(root, showWarnings = FALSE, recursive = TRUE)
#% create those personal directories
directories <- gsub(" ", "_", names)
paths <- file.path(root, directories)
for (path in paths) {
    dir.create(path)
}

list.files(root, full.names = TRUE)
