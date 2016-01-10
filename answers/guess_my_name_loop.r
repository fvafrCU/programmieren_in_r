my_name  <- "Dominik Cullmann"
guess <- readline(prompt = "Guess my name: ")
# "! identical(my_name, guess)" is better than "my_name != guess" but harder to
# read, so I stick with the inferior "!=".
while (my_name != guess) {
    print("You loose!")
    guess <- readline(prompt = "Try again: ")
}
print("You win!")
