dbh <- c(-1.4, 10.7, 30.3, 15.8, 70, 41.7, 358, 16.9)
min <- 0
max <- 200
cutoff <- 70
possible <- dbh > 0
probable <- dbh <= 200


m <- data.frame(dbh, possible, probable)
print(possible[3:8] && probable[3:8])
m[["okay"]] <- possible & probable
m


if (dbh >= cutoff) {
  print("abhacken")
  } else {
  print("stehenlassen")
}
m[["entscheidung"]] <- ifelse(dbh >= cutoff, "abhacken", "stehenlassen")

