input_directory <- file.path(not_so_temporary_directory, "data", "input")
dir.create(input_directory, recursive = TRUE)
if (Sys.info()[["nodename"]] %in% c("foobar", "h5")) {
    # local machines only
    file.copy(from = "data/input", to = dirname(input_directory),
              recursive = TRUE)

} else {
    dependencies <- c("XML", "RCurl", "httr")
    for (dependency in dependencies) {
        if (! require(dependency, character.only = TRUE)) {
            install.packages(dependency)
        }
        library(dependency, character.only = TRUE)
    }
    input_url <- "http://10.33.50.43/R_Intro/data/input/"
    proxy <- Sys.getenv("http_proxy")
    Sys.setenv("http_proxy" = "")
    content <- getURLContent(input_url, verbose = TRUE)
    files <- readHTMLTable(content, skip.rows = 1, 
                           stringsAsFactors = FALSE)[[1]][["Name"]]
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
}
