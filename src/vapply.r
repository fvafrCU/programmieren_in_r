some_vector <- c("a", "b", "c")
invisible(vapply(some_vector, 
       function(x) {
           cat("An Element contains ", x, ".\n", sep = "")
           return(unlist(x))
       },
       character(1)
       )
)

