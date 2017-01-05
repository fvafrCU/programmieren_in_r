create_personal_directories <- function(file, 
                                        root = file.path(dirname(tempdir()), 
                                                         "personal_directories")
                                        ) {
    status <- logical(length(directories))
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
    for (i in seq(along = paths)) {
         status[i] <- dir.create(paths[i])
    }
    return(invisible(status))
}
