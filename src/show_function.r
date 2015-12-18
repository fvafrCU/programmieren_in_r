temporary_file <- tempfile()
connection <- file(temporary_file)
writeLines(capture.output(apply), connection)
close(connection)
file.show(temporary_file)

