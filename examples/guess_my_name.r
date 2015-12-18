#!/usr/bin/Rscript --vanilla
my_name  <- "Dominik Cullmann"
guess <- readline(prompt = "Guess my name: ")
if (guess == my_name) {
    print("You win!")
} else {
    print("You loose!")
}
