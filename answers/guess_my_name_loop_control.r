my_name  <- "Dominik Cullmann"
max_tries <- 3

guess <- readline(prompt = "Guess my name: ")
num_tries <- 2
while (my_name != guess && num_tries <= max_tries) {
    print("You loose!")
    guess <- readline(prompt = "Try again: ")
    num_tries <- num_tries + 1
}

if (my_name == guess) {
    print("You win!")
} else {
    print("Did I forget to tell you that you only had three tries?")
}
