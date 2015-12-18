some_vector <- c("a", "b", "c")
index <- 1
while (index <= length(some_vector)) {
    cat("Element ", index, " contains ", some_vector[index], ".\n", sep = "")
    index <- index + 1
}
