my_sum <- function(x) {
    value <- 0
    for (i in seq(along = x)) {
        value <- value + x[i] 
    }
    return(value)
}
