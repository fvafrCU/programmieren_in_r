my_name  <- "Dominik Cullmann"
guess <- readline(prompt = "Guess my name: ")
# "identical(my_name, guess)" is better than "guess == my_name" but harder to
# read, so I stick with the inferior "==".
guess == my_name
