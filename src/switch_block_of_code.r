my_number <- NULL
switch(2,
       my_number <- 1,
       {
           my_number <- 3
           message("This doesn't make any sense. It's just an example.")
       },
       stop("works only for 1 or 2")
       )
a_number * my_number


