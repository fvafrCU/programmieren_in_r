#% set the root directory 
root <- file.path(dirname(tempdir()), "numbered_directories")

#% simple version
##% create root directory
dir.create(root)

##% create numbered directories, wrong name 
for (i in seq(from = 1, to = 365)) {
    #% add leading zeros
    number <- formatC(i, width = 3, format = "d", flag = "0")
    directory_name <- paste("a_crap_name", number, sep = "_")
    path <- file.path(root, directory_name)
    dir.create(path)
}

##% those names were crappy, let's rename them:
for (old_path in list.files(root, full.names = TRUE)) {
    new_path <- sub("a_crap_name", "day_of_year", old_path) 
    file.rename(old_path, new_path)
}

#% again, with a directory not to be renamed:
##% get rid of all these
unlink(root, recursive = TRUE)
##% create root directory
dir.create(root)
##% create numbered directories, wrong name 
for (i in seq(from = 1, to = 365)) {
    #% add leading zeros
    number <- formatC(i, width = 3, format = "d", flag = "0")
    directory_name <- paste("a_crap_name", number, sep = "_")
    path <- file.path(root, directory_name)
    dir.create(path)
}
##% create one 'good' directory':
path <- file.path(root, "but_this_is_not_a_crap_name_at_all")
dir.create(path)

##% those names were crappy, let's rename them:
for (old_path in list.files(root, full.names = TRUE)) {
    if (grepl("but_this_is_not_a_crap_name_at_all", old_path)) {
        blabla <- paste0("You really should haveread ?list.files, especially ", 
                      "about the 'pattern' option. \nAnd see ?regex as well!")
        warning(blabla)
    }
    new_path <- sub("a_crap_name", "day_of_year", old_path) 
    file.rename(old_path, new_path)
}
