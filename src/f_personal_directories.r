create_personal_directories <- function(file, 
                                        path = file.path(dirname(tempdir()), 
                                                         "personal_directories")
                                        ){
    #% read the file containing the names
    lines <- readLines("files/names.txt")
    #% extract names, order them in FIRSTNAME_LASTNAME
    non_empty_lines <- lines[which(lines != "")]
    tmp <- sub("^ *", "", non_empty_lines)
    names <- sub(" *", "", tmp)
    last_names <- sapply(strsplit(names, ","), "[", 1)
    first_names <-  gsub(" ", "_", 
                         sub(" *$", "", 
                             sub("^ *", "", 
                                 sapply(strsplit(names, ","), "[", 2)
                                 )
                             )
                         )
    directories <- paste(first_names, last_names, sep = "_")
    #% create path 
    dir.create(path, showWarnings = FALSE, recursive = TRUE)
    #% create those personal directories
    for (directory in directories) {
        path <- file.path(path, directory)
        dir.create(path)
    }
}
