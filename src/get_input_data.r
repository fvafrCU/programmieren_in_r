not_so_temporary_directory <- file.path(dirname(tempdir()) , "R_intro")
dir.create(not_so_temporary_directory, showWarnings = FALSE)
input_directory <- file.path(not_so_temporary_directory, "data", "input")
dir.create(input_directory, recursive = TRUE)
dependencies <- c("XML", "RCurl", "httr")
for (dependency in dependencies) {
    if (! require(dependency, character.only = TRUE)) {
        install.packages(dependency)
    }
    library(dependency, character.only = TRUE)
}
input_url <- "http://fvafrcu.github.io/programmieren_in_r/data/input/"
proxy <- Sys.getenv("http_proxy")
Sys.setenv("http_proxy" = "")
content <- getURLContent(input_url, verbose = TRUE)
hrefs <- grep("/", 
              grep("href", 
                   strsplit(as.character(content), "<")[[1]]
                   , value = TRUE
                   )
              , value = TRUE, invert = TRUE
              )
files  <- sapply( strsplit(hrefs, "\\\"") ,"[[", 2)  
for (file in files) {
    file_url <- file.path(input_url, file)
    file_path <- file.path(input_directory, file)
    if (Sys.info()["sysname"] == "Windows") {
        download.file(file_url, file_path, method = "wininet", mode = "wb")  
    } else {
        download.file(file_url, file_path, method = "curl")  
    }
}

Sys.setenv("http_proxy" = proxy)
