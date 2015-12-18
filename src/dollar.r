cars <- mtcars[, c("mpg", "cyl", "drat")]
# mtcars$m is set (partial name expansion) to mtcars$mpg where the index is
# FALSE
cars$m[cars$cyl == 6]  <- 1000
# Is this a feature?
# If the index is all FALSE, I get a complete copy of the expanded variable!
cars$mp[FALSE]  <- 1000


# If I avoid the dollar sign and its partial name expansion, I get what I want:
cars[["c"]][cars$cyl == 6]  <- 1000

# What if partial name expansion doesn't give a result?
cars$draft <- 3
cars$d[FALSE]  <- 1000
# As expected, I get NA...

cars
