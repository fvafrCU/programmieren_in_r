boolean_vector <- sample(c(TRUE, FALSE), 12, replace = TRUE)
mode(boolean_vector)

integer_vector <- 1:12
mode(integer_vector)

character_vector <- letters[1:12]
mode(character_vector)
dim(character_vector)
attributes(character_vector) <- list(dim = c(1,length(character_vector)))
is.vector(character_vector)
is.array(character_vector)
(character_matrix <- matrix(character_vector, nrow = 2))
mode(character_matrix)
dim(character_matrix)

mode("Hello, world!")
mode(3)

(character_array <- array(character_vector, c(2,3,2)))
mode(character_array)
dim(character_array)
dim(character_matrix)
length(character_matrix)
character_matrix[1, 3]
character_matrix[5]
tryCatch(character_array[2, 3], error = function(e) print(e))
things <- list(alphabet = letters,
               digits = 0:9,
               me = "I")
str(things)
length(things)
things_and_more <- list(things = things, an_array = character_array)
str(things_and_more)
str(things_and_more[1])
str(things_and_more[[1]])
things_and_more[[1]][[1]][[3]]
things_and_more[[1]][c(2,3)]
data(cars)
head(cars)
dim(cars)
names(cars)[1]
all.equal(cars[[1]], cars$speed) 

all.equal(cars[[2]][2], cars[2, "dist"])
(a <- factor(substring("statistics", 1:10, 1:10), levels = letters, 
                                                  ordered = TRUE))
(b <- factor(substring("statistics", 1:10, 1:10), levels = letters, 
                                                  ordered = FALSE))
factor(c("s", "t", "a", "t", "i", "s", "t", "i", "c", "s")) 
v <- c("s", "t", "a", "t", "i", "s", "t", "i", "c", "s")
factor(v, levels = unique(v))
trials <- c(paste(c("Erste", "Zweite", "Dritte"), "Aufnahme"))
repetitions <- c(40, 30, 20)

set.seed(1234); mortality <- data.frame(trial = rep(trials, repetitions),
                        percent = sample(1:100, sum(repetitions), 
                                         replace = TRUE)
                        ) 
tapply(mortality$percent, mortality$trial, mean) 
levels(mortality$trial) <- trials
tapply(mortality$percent, mortality$trial, mean) 

set.seed(1234); mortality <- data.frame(trial = rep(trials, repetitions),
                        percent = sample(1:100, sum(repetitions), 
                                         replace = TRUE)
                        ) 
mortality$trial <- factor(mortality$trial, levels = trials)
tapply(mortality$percent, mortality$trial, mean) 

