my_name  <- "Dominik Cullmann"
guess <- readline(prompt = "Guess my name: ")
while (my_name != guess) {
    print("You loose!")
    guess <- readline(prompt = "Try again: ")
}
print("You win!")
