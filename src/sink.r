temporary_file <- tempfile()
{   # you don't need the braces in common R code, but I use rmarkdown::render()
    #  (which uses knitr::knit() which uses sink() to capture results. See 
    #   https://groups.google.com/forum/#!topic/knitr/TCz9vNLlslY) 
    # to parse an R/markdown file into this html file. 
    # So I need the braces here. 
    sink(temporary_file)
    directory <- "./src/"
    warning("message()s, warning()s and stop()s are not sink()ed.")
    cat("I use cat() instead of print() here to get rid of the indeces",
        "print()ed.\n", sep = " ")
    cat("This is the directory listing of '", directory, "':", "\n", sep = "")
    cat(list.files(directory), sep = "\n")
    sink()
}

