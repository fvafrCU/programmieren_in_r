a  <- c(2, 3, 4, 10)
value <- 0
for (i in seq(along = a)) {
    value <- value + a[i] 
}
print(value)

