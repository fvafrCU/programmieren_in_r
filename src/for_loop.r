some_vector <- c("a", "b", "c")
for (index in seq(along = some_vector)) {
    cat("Element ", index, " contains ", some_vector[index], ".\n", sep = "")
}
