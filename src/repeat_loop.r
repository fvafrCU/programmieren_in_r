my_name  <- "Dominik Cullmann"
max_tries <- 3

guess <- readline(prompt = "Guess my name: ")
num_tries <- 1
repeat {
    if (num_tries > max_tries) {
        print("Did I forget to tell you that you only had three tries?")
        break
    } else {
        num_tries <- num_tries + 1
    }
    if (guess == my_name) {
        print("You win!")
        break
    } else {
        print("You lose!")
        guess <- readline(prompt = "Try again: ")
    }
}

