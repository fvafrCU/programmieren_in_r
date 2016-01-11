#% set the root directory and read the file containing the names
root <- file.path(dirname(tempdir()), "personal_directories")
lines <- readLines("files/names.txt")

#% make sure root does not exist
if(file.exists(root) && file.info(root)$isdir) {
    unlink(root, recursive = TRUE, force = TRUE)
}
#% create root directory
dir.create(root)
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
#% create those personal directories
for (directory in directories) {
    path <- file.path(root, directory)
    dir.create(path)
}

