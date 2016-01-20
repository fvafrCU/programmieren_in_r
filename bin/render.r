#!/usr/bin/Rscript --vanilla
library("rmarkdown")
#% helper functions
render_html<- function(rmd_file) {
    render(rmd_file, html_document(number_sections = TRUE, toc = TRUE))
}

clean_code_chunks <- function(input, output) {
    writeLines(sub("``` \\{r.*","``` \\{\\.r}", readLines(input), 
                   fixed = FALSE),
               con = file(output))
}

#% get file name and options
arguments <- commandArgs(trailingOnly = TRUE)
if (any(c("-h", "--help") %in% arguments)){
    cat("this is not documented but precompiles, knits and renders md to html 
        and pdf.
        Options:
        --file: give a file name (otherwise, the last command line arguments
                                  that's not starting with '-' is taken to be
                                  the file name)
        --knit: run knitr's knitting on the file
        --pandoc: runs pandoc_gpp.cl
        --render: run render on precompiled md\n")
    quit()
}
file_arguments <- c("-f", "--file")
if (all(file_arguments %in% arguments)) stop(paste("got both", 
                                                   paste(file_arguments,
                                                         collapse = " and ")))
for (file_argument in file_arguments) {
    if (file_argument %in% arguments) {
        file_name <- arguments[which(file_argument == arguments) + 1]
    }
}
missing_file_name <- ! exists("file_name")
missing_file_options <- ! any(file_arguments %in% arguments)
if (missing_file_name && missing_file_options) {
    # get file_name as last argument not starting with "-"
    left_over <- grep("^-", arguments, invert = TRUE, value = TRUE)
    num_left_over <- length(left_over)
    if (num_left_over > 0) {
        file_name <- left_over[num_left_over]
    }
}
if (! exists("file_name")) stop("don't know which file to use")
if (! file.exists(file_name)) stop(paste("there is no file", file_name))

#% get a copy of Rmd input
if (grepl(".*\\.Rmd", file_name)) {
    md_file <- sub("\\.Rmd", "\\.md", file_name)
    file.copy(file_name, md_file, overwrite = TRUE)
} else {
    md_file <- file_name
}

#% precompile [r]md to Rmd to include source files
rmd_file <-  sub("\\.r?md", "\\.Rmd", md_file)
system(paste("gpp.cl", md_file, ">", rmd_file))

#% knit the code
if (any(c("-k", "--knitr") %in% arguments)){
    knitr::purl(rmd_file, documentation = 0)
}

#% render only
# pandoc and render give differently formated versions of the md:
if (any(c("-p", "--pandoc") %in% arguments)){
    output_file <-  paste0("pandoc_", md_file)
    # I write Rmd with ``` {r} since vim does not recognise ```{.r}, which is
    # the pandoc version. So I replace it to get highlighted output from pandoc.
    # TODO: tell vim to handle ```{.r}
    clean_code_chunks(md_file, output_file)
    system(paste("pandoc_gpp.cl", output_file))
}
if (any(c("-r", "--render") %in% arguments)){
    output_file <-  paste0("render_", rmd_file)
    warning(output_file)
    warning(rmd_file)
    # I write Rmd with ``` {r} since vim does not recognise ```{.r}, which is
    # the pandoc version. So I replace it to get highlighted output from pandoc.
    # TODO: tell vim to handle ```{.r}
    # And use the precompiled rmd version!
    file.copy(rmd_file, output_file, overwrite = TRUE)
    render_html(output_file)
    render(output_file, pdf_document(toc = TRUE, number_sections = TRUE))
}

#% knit and render
render_html(rmd_file)

# WARNING: we set files to 644!
Sys.chmod(list.files(pattern = ".*\\.html"), mode="0644", use_umask=FALSE)
Sys.chmod(list.files(pattern = ".*\\.Rmd"), mode="0644", use_umask=FALSE)
