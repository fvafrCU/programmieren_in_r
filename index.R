#!/usr/bin/Rscript --vanilla
print("hello, world")

source("answers/example.r")
## I turn off help. Restore it via
#  options(list(pager = file.path(R.home(), "bin/pager")))
options(list(pager = function(..., header,
                     title = "R Information",
               delete.file = FALSE){
               return(NULL)
               }
               )
               )
source("answers/hello.r")
help("help", package = "utils")
?help
help("Syntax", package = "base")
?Syntax
a_number <- 3
a_number <- "this is no number, it's a string!"
assign("a_number", 4)
source("answers/name.r")
for (pos in seq(along = searchpaths())) {
    print(lsf.str(pos))
}
a_number != 4 
a_number != 4 || a_number == 4
condition <- a_number <= 3
if (condition) {
  print("Consecution")
} else {
  print("Alternative")
}
randomly_true <- sample(x = c(TRUE, FALSE), size = 10, replace = TRUE)
print(randomly_true)
ifelse(randomly_true, "Consecution", "Alternative")
## set.seed(456432346)
## not_randomly_true <- sample(x = c(TRUE, FALSE), size = 10, replace = TRUE)
## print(not_randomly_true)
abbreviation <- "sALN"
switch(abbreviation, 
       FI = "Fichte",
       TA = "Tanne",   
       DGL = "Douglasie", 
       KIE = "Kiefer",  
       LAE = "Lärchen", 
       sNB = "sonst. Nadelholz",
       BU = "Buche",
       EI = "Eichen",
       REI = "Roteiche",
       ES = "Esche",
       BA = "Bergahorn",
       HB = "Hainbuche",
       sALH = "sonst. Hartholz",
       BI = "Birken",
       ER = "Erlen",
       PA = "Pappeln",
       sALN = "sonst. Weichholz",
       stop("Got unkown abbreviation \"", abbreviation, "\"!")
       )



my_number <- NULL
switch(2,
       my_number <- 1,
       {
           my_number <- 3
           message("This doesn't make any sense. It's just an example.")
       },
       stop("works only for 1 or 2")
       )
a_number * my_number



indices <- c(1, 2, 3)
for (index in indices) {
    print(index)
}
value <- 0
n <- 3
for (i in seq(1, n)) {
    value <- value + i - 1
}
print(value)


a  <- c(2, 3, 4, 10)
value <- 0
n <- 3
for (i in seq(1, n)) {
    value <- value + a[i] - 1
}
print(value)


a  <- c(2, 3, 4, 10)
value <- 0
for (i in seq(along = a)) {
    value <- value + a[i] - 1
}
print(value)


some_vector <- c("a", "b", "c")
for (index in seq(along = some_vector)) {
    cat("Element ", index, " contains ", some_vector[index], ".\n", sep = "")
}

some_vector <- c("a", "b", "c")
index <- 1
while (index <= length(some_vector)) {
    cat("Element ", index, " contains ", some_vector[index], ".\n", sep = "")
    index <- index + 1
}

some_vector <- c("a", "b", "c")
invisible(vapply(some_vector, 
       function(x) {
           cat("An Element contains ", x, ".\n", sep = "")
           return(unlist(x))
       },
       character(1)
       )
)


apply
temporary_file <- tempfile()
connection <- file(temporary_file)
writeLines(capture.output(apply), connection)
close(connection)
file.show(temporary_file)


## my_name  <- "Dominik Cullmann"
## max_tries <- 3
## 
## guess <- readline(prompt = "Guess my name: ")
## num_tries <- 1
## repeat {
##     if (num_tries > max_tries) {
##         print("Did I forget to tell you that you only had three tries?")
##         break
##     } else {
##         num_tries <- num_tries + 1
##     }
##     if (guess == my_name) {
##         print("You win!")
##         break
##     } else {
##         print("You loose!")
##         guess <- readline(prompt = "Try again: ")
##     }
## }
## 
## 
?source
?sink
file <- "src/hello_world.r"
if (file.exists(file)) {
    source(file)
} else {
    warning("You don't have ", file, " at hand!\n", 
            "This will crash!")
}


temporary_file <- tempfile()
{   # you don't need the braces in common R code, but I use rmarkdown::render()
    #  (which uses knitr::knit() which uses sink() to capture results. See 
    #   https://groups.google.com/forum/#!topic/knitr/TCz9vNLlslY) 
    # to parse an R/markdown file into this html file. 
    # So I need the braces here. 
    sink(temporary_file)
    directory <- "./src/"
    warning("message()s, warning()s and stop()s are not sink()ed.")
    cat("I use cat() instead of print() here to get rid of the indeces",
        "print()ed.\n", sep = " ")
    cat("This is the directory listing of '", directory, "':", "\n", sep = "")
    cat(list.files(directory), sep = "\n")
    sink()
}


readLines(temporary_file)
not_so_temporary_directory <- file.path(dirname(tempdir()) , "R_intro")
dir.create(not_so_temporary_directory, showWarnings = FALSE)


## Sometimes in April ...
not_so_temporary_file <- file.path(not_so_temporary_directory, "readme.md")
cat("My first readme file.", file = not_so_temporary_file, sep = "\n")

## ... some days later
if (file.exists(not_so_temporary_file)) {
    file.rename(not_so_temporary_file, paste0(not_so_temporary_file, "1"))
}
cat("This is a directory created by 'Programmieren in R' .",
    file = not_so_temporary_file, sep = "\n")



?files
?basename
#% set the root directory and read the file containing the names
root <- file.path(dirname(tempdir()), "personal_directories")
lines <- readLines("files/names.txt")

#% make sure root does not exist
if(file.exists(root) && file.info(root)$isdir) {
    unlink(root, recursive = TRUE, force = TRUE)
}
#% create root directory
dir.create(root)
#% extract names, order them in FIRSTNAME_LASTNAME
non_empty_lines <- lines[which(lines != "")]
tmp <- sub("^ *", "", non_empty_lines)
names <- sub(" *", "", tmp)
last_names <- sapply(strsplit(names, ","), "[", 1)
first_names <-  gsub(" ", "_", 
                     sub(" *$", "", 
                         sub("^ *", "", 
                             sapply(strsplit(names, ","), "[", 2)
                                   )
                         )
)
directories <- paste(first_names, last_names, sep = "_")
#% create those personal directories
for (directory in directories) {
    path <- file.path(root, directory)
    dir.create(path)
}


input_directory <- file.path(not_so_temporary_directory, "data", "input")
dir.create(input_directory, recursive = TRUE)
if (Sys.info()[["nodename"]] %in% c("foobar", "h5")) {
    # local machines only
    file.copy(from = "data/input", to = dirname(input_directory),
              recursive = TRUE)

} else {
    dependencies <- c("XML", "RCurl", "httr")
    for (dependency in dependencies) {
        if (! require(dependency, character.only = TRUE)) {
            install.packages(dependency)
        }
        library(dependency, character.only = TRUE)
    }
    input_url <- "http://10.33.50.43/R_Intro/data/input/"
    proxy <- Sys.getenv("http_proxy")
    Sys.setenv("http_proxy" = "")
    content <- getURLContent(input_url, verbose = TRUE)
    files <- readHTMLTable(content, skip.rows = 1, 
                           stringsAsFactors = FALSE)[[1]][["Name"]]
    for (file in files) {
        file_url <- file.path(input_url, file)
        file_path <- file.path(input_directory, file)
        if (Sys.info()["sysname"] == "Windows") {
            download.file(file_url, file_path, method = "wininet", mode = "wb")  
        } else {
            download.file(file_url, file_path, method = "curl")  
        }
    }

    Sys.setenv("http_proxy" = proxy)
}


species_shares_1987 <- read.csv2(file.path(input_directory, 
                                           "species_shares_1987.csv"))
species_shares_2002 <- read.csv2(file.path(input_directory, 
                                           "species_shares_2002.csv"))
species_shares_2012 <- read.csv2(file.path(input_directory, 
                                           "species_shares_2012.csv"))



for (index in 1:3) {
    name <- paste0("v_", index)
    assign(name, index)
}
ls(pattern = "v_.")
print(v_2)
list.files(path = "./src")
list.files(path = "./src", pattern = "^s.*\\.r$")
if (.Platform$OS.type == "windows") {
if (! require("RODBC")) install.packages("RODBC")
library("RODBC")
channel <- odbcConnectAccess2007(file.path(input_directory, 
                                           "species_shares.accdb"))
species_shares_1987 <- sqlFetch(channel, "Species_shares_1987")
species_shares_2002 <- sqlFetch(channel, "Species_shares_2002")
species_shares_2012 <- sqlFetch(channel, "Species_shares_2012")
odbcClose(channel)

}
## if (! require("RODBC")) install.packages("RODBC")
## library("RODBC")
## channel <- odbcConnectAccess2007(file.path(input_directory,
##                                            "species_shares.accdb"))
## species_shares_1987 <- sqlFetch(channel, "Species_shares_1987")
## species_shares_2002 <- sqlFetch(channel, "Species_shares_2002")
## species_shares_2012 <- sqlFetch(channel, "Species_shares_2012")
## odbcClose(channel)
## 
R.version["arch"]
if (.Platform$OS.type == "windows") {
if (! require("xlsx")) install.packages("xlsx")
library("xlsx")
xlsx_file <- file.path(input_directory, "species_shares.xlsx")
species_shares_1987 <- read.xlsx(xlsx_file, sheetName = "1987")
species_shares_2002 <- read.xlsx(xlsx_file, sheetName = "2002")
species_shares_2012 <- read.xlsx(xlsx_file, sheetName = "2012")

}
## if (! require("xlsx")) install.packages("xlsx")
## library("xlsx")
## xlsx_file <- file.path(input_directory, "species_shares.xlsx")
## species_shares_1987 <- read.xlsx(xlsx_file, sheetName = "1987")
## species_shares_2002 <- read.xlsx(xlsx_file, sheetName = "2002")
## species_shares_2012 <- read.xlsx(xlsx_file, sheetName = "2012")
## 
mode(species_shares_1987)
class(species_shares_1987)
print(species_shares_2002)
species_shares_2002[3, 2]
species_shares_2002[nrow(species_shares_1987), ncol(species_shares_1987)]
dimnames(species_shares_2002)
species_shares_2002["3", "prediction"]
species_shares_2002[3, "error"]
(random_logical_index <- sample(c(TRUE, FALSE), nrow(species_shares_2002),
replace = TRUE))
species_shares_2002[random_logical_index, "prediction"]
species_shares_2002[3:6, c("prediction", "error")]
species_shares_2002[3:6, ]
logical_index <- species_shares_2002["grouping"] == "deciduous" &
  (species_shares_2002 ["prediction"] >= 5 | 
   species_shares_2002 ["error"] / species_shares_2002 ["prediction"] 
   <= 0.05 ) | 
  species_shares_2002["species_group_label"] == "DGL" 
species_shares_2002[logical_index, ]
subset(species_shares_2002, grouping == "deciduous" & 
       (prediction > 5 | error / prediction < 0.05) | 
       species_group_label == "DGL" )
species_shares_2002[logical_index, "flag"]  <- TRUE
print(species_shares_2002)
species_shares_2002[is.na(species_shares_2002["flag"]), "flag"]  <- FALSE
species_shares_2002
species_shares_2002[[3, 2]]
species_shares_2012["prediction"]
(v3 <- species_shares_2012[["prediction"]])
species_shares_2012$prediction
name  <- "prediction"
species_shares_2012[[name]]
name  <- "prediction"
species_shares_2012$name
v3[c(1,3)]
names(v3) <- species_shares_2012[["species_group_label"]]
v3[c("FI", "DGL")]
v3 <- c(v3[2:length(v3)], v3[1])
v3[c(1,3)]
v3[c("FI", "DGL")]
species_shares_1987[["species_group_label"]] 
mode(species_shares_1987[["species_group_label"]])
class(species_shares_1987[["species_group_label"]])
# we need to convert the factor's values to character!
(abbreviation <- as.character(species_shares_1987["1", "species_group_label"]))
(text  <- 
switch(abbreviation, 
       FI = "Fichte",
       TA = "Tanne",   
       DGL = "Douglasie", 
       KIE = "Kiefer",  
       LAE = "Lärchen", 
       sNB = "sonst. Nadelholz",
       BU = "Buche",
       EI = "Eichen",
       REI = "Roteiche",
       ES = "Esche",
       BA = "Bergahorn",
       HB = "Hainbuche",
       sALH = "sonst. Hartholz",
       BI = "Birken",
       ER = "Erlen",
       PA = "Pappeln",
       sALN = "sonst. Weichholz",
       stop("Got unkown abbreviation \"", abbreviation, "\"!")
       )


)

abbreviations <- levels(species_shares_1987[["species_group_label"]])
levels(species_shares_1987[["species_group_label"]])[abbreviations == abbreviation] <-
    text


get_species_group_text <- function (abbreviation) {
    text <-  switch(abbreviation, 
                    FI = "Fichte",
                    TA = "Tanne",   
                    DGL = "Douglasie", 
                    KIE = "Kiefer",  
                    LAE = "Lärchen", 
                    sNB = "sonst. Nadelholz",
                    BU = "Buche",
                    EI = "Eichen",
                    REI = "Roteiche",
                    ES = "Esche",
                    BA = "Bergahorn",
                    HB = "Hainbuche",
                    sALH = "sonst. Hartholz",
                    BI = "Birken",
                    ER = "Erlen",
                    PA = "Pappeln",
                    sALN = "sonst. Weichholz",
                    abbreviation
                    )
    return(text)
}



get_species_group_factor <- function(x) {
    levels(x) <- vapply(levels(x), 
                        get_species_group_text,
                        character(length = 1)
                        )
    return(x)

}


get_species_group_factor(species_shares_1987[["species_group_label"]])
species_shares_1987[["species_group_label"]] <- 
    get_species_group_factor(species_shares_1987[["species_group_label"]])
species_shares_2002[["species_group_label"]] <- 
    get_species_group_factor(species_shares_2002[["species_group_label"]])
species_shares_2012[["species_group_label"]] <- 
    get_species_group_factor(species_shares_2012[["species_group_label"]])


plot_species_shares <- function(df, error_bars = TRUE) {
    #% prepare data
    year <- strsplit(deparse(substitute(df)), "_")[[1]][[3]]
    ##% sort data by prediction
    sorted_data <- df[order(df[["prediction"]]), ]
    #% prepare plot
    ##% set up common colors
    greens <-  c("deciduous" = rgb(124, 252, 0, maxColorValue = 255), 
                 "conifers" = rgb(0, 100, 0, maxColorValue = 255))
    ##% set the limits of the abscissa
    x_width <-  5
    x_max  <- ceiling(max(sorted_data[["prediction"]]) / x_width) * x_width
    x_min  <- 0
    par(omi = c(0.65, 0.95, 0.75, 0.75), mai = c(0.3, 2.2, 0.35, 0), 
        mgp = c(5, 3, 0), las = 1)  
    #% create plot
    ##% plot deciduous
    deciduous <- sorted_data[["prediction"]]
    deciduous[which(sorted_data[["grouping"]] != "deciduous")] <- 0
    x1 <- barplot(deciduous, names.arg = FALSE, horiz = TRUE, border = NA, 
                  xlim = c(x_min, x_max), col = greens["deciduous"],
                  cex.names = 0.85, axes = FALSE)
    ##% plot conifers in different color
    conifers <- sorted_data[["prediction"]]
    conifers[which(sorted_data[["grouping"]] != "conifer")] <- 0
    x2 <- barplot(conifers, names.arg = FALSE, horiz = TRUE, border = NA, 
                  xlim = c(x_min, x_max), col = greens["conifers"],
                  cex.names = 0.85, axes = FALSE, add = TRUE)
    ##% add error bars
    if (error_bars) {
        error <- 1.96 * sqrt(df[["error"]])
        arrows(sorted_data[["prediction"]] - error, x1, 
               sorted_data[["prediction"]] + error, x1, 
               angle = 90, code = 3, length = 0.03)
        text(x_max, 22.5, "Fehlerbalken: 1.96 Standardabweichungen", adj = 1, 
             xpd = TRUE, cex = 0.65, font = 3)
    }
    ##% add title and note
    mtext(paste0(year, ": Baumartenflächen im Gesamtwald"),  3,  line = 1.3,  
          adj = 0,  cex = 1.2, 
          outer = TRUE)
    text(x_max, 21.5, "Alle Angaben in Prozent", adj = 1, xpd = TRUE,
         cex = 0.65, font = 3)
    ##% create ordinate labels
    for (i in 1:length(sorted_data[["species_group_label"]])) {
        if (sorted_data[[i, "grouping"]] %in% c("conifer")) {
            font_type <- 2 #"bold"
        } else {
            font_type <- 1 #"plain"
        }
        text(-9, x1[i], sorted_data[i, "species_group_label"], xpd = TRUE, 
             adj = 1, cex = 0.85, font = font_type)
        text(-3.5, x1[i], round(sorted_data[[i, "prediction"]], 1), xpd = TRUE, 
             adj = 1, cex = 0.85, font = font_type)
    }
    ##% create shading rectangles
    steps <- (x_max - x_min) / x_width
    for (i in (1:steps) - 1) {
        if (i %% 2 == 0) {
            rect(i * x_width, -0.5, (i + 1) * x_width, 28, 
                 col = rgb(191, 239, 255, 120, maxColorValue = 255), 
                 border = NA
                 )
        } else {
            rect(i * x_width, -0.5, (i + 1) * x_width, 28, 
                 col = rgb(191, 239, 255, 80, maxColorValue = 255), 
                 border = NA
                 )
        }
    }
    ##% create abscissa labels
    width <-  10
    x <- seq(from = x_min, to = x_max, by = width)
    mtext(x, at = x, 1, line = 0, cex = 0.8)
}





plot_species_shares(species_shares_1987)
plot_species_shares(species_shares_2002, error_bars = FALSE)
plot_species_shares(species_shares_2012)

## species_areas_1987 <-
##     structure(list(species_group_label = structure(c(8L, 17L, 4L,
##                                                      10L, 11L, 16L, 3L, 5L, 13L,
##                                                      7L, 1L, 9L, 14L, 2L, 6L,
##                                                      12L, 15L),
##                                                    .Label = c("BA", "BI", "BU",
##                                                               "DGL", "EI", "ER",
##                                                               "ES", "FI", "HB",
##                                                               "KIE", "LAE",
##                                                               "PA", "REI",
##                                                               "sALH", "sALN",
##                                                               "sNB", "TA"),
##                                                    class = "factor"),
##                    prediction = c(43.4629284667027, 7.86415232656841,
##                                   2.26216297553824, 8.06265606914114,
##                                   1.98345551354271, 0.258119453661548,
##                                   18.6633590554827, 6.44221004707153,
##                                   0.35059803997222, 3.10977158731384,
##                                   1.97088355582993, 0.869602592792654,
##                                   1.42365460297862, 0.718482907631762,
##                                   0.830511613550428, 0.835781310286287,
##                                   0.891669881935334),
##                    error = c(0.536743142764836, 0.262752386955493,
##                              0.129393158401086, 0.281028879558596,
##                              0.0957647501950789, 0.0400083812731542,
##                              0.389178612482042, 0.226936220859848,
##                              0.0488116148358875, 0.137538118708037,
##                              0.097771346923237, 0.0594793138895747,
##                              0.0904682635067747, 0.055752264926238,
##                              0.0736516611206084, 0.0868833933034175,
##                              0.0604548633623663),
##                    grouping = structure(c(1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L,
##                                           2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L),
##                                         .Label = c("conifer", "deciduous"),
##                                         class = "factor")
##                    ),
##               .Names = c("species_group_label", "prediction", "error",
##                          "grouping"),
##               class = "data.frame", row.names = c(NA, -17L)
##               )
## 
## species_areas_2002 <-
##     structure(list(species_group_label = structure(c(8L, 17L, 4L, 10L, 11L, 16L,
##                                                      3L, 5L, 13L, 7L, 1L, 9L,
##                                                      14L, 2L, 6L, 12L, 15L),
##                                                    .Label = c("BA", "BI", "BU",
##                                                               "DGL", "EI", "ER",
##                                                               "ES", "FI", "HB",
##                                                               "KIE", "LAE",
##                                                               "PA", "REI",
##                                                               "sALH", "sALN",
##                                                               "sNB", "TA"),
##                                                    class = "factor"),
##                    prediction = c(37.6541737569276, 7.7972024041839,
##                                   2.84416204823979, 6.50871828897042,
##                                   1.89646865974553, 0.445212707829209,
##                                   21.2065514011396, 6.91947701194286,
##                                   0.427773788150808, 4.21173366638045,
##                                   2.83784794317384, 1.18034501600187,
##                                   1.92995628756537, 0.837975958160955,
##                                   0.983188665990165, 0.705704472718757,
##                                   1.61350792287878),
##                    error = c(0.516872726399891, 0.256407272426103,
##                              0.148641313940045, 0.24019309828729,
##                              0.0923020697386302, 0.0596218555415915,
##                              0.394877125787159, 0.231660735729548,
##                              0.0542174195188222, 0.161229780433931,
##                              0.122025049342518, 0.0719240232167699,
##                              0.105193197027116, 0.0620204258221561,
##                              0.0798713826799925, 0.0719370996103648,
##                              0.0886195995701987),
##                    grouping = structure(c(1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L,
##                                           2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L),
##                                         .Label = c("conifer", "deciduous"),
##                                         class = "factor")
##                    ),
##               .Names = c("species_group_label", "prediction", "error",
##                          "grouping"),
##               class = "data.frame", row.names = c(NA, -17L)
##               )
## 
## 
## species_areas_2012 <-
##     structure(list(species_group_label = structure(c(8L, 17L, 4L, 10L, 11L, 16L,
##                                                      3L, 5L, 13L, 7L, 1L, 9L,
##                                                      14L, 2L, 6L, 12L, 15L),
##                                                    .Label = c("BA", "BI", "BU",
##                                                               "DGL", "EI", "ER",
##                                                               "ES", "FI", "HB",
##                                                               "KIE", "LAE",
##                                                               "PA", "REI",
##                                                               "sALH", "sALN",
##                                                               "sNB", "TA"),
##                                                    class = "factor"),
##                    prediction = c(33.9691456012294, 7.99971033422974,
##                                   3.37185094122167, 5.58481905493661,
##                                   1.76833653476758, 0.469877064925086,
##                                   21.8136258163657, 7.05250096043027,
##                                   0.538397233960815, 4.91372646945832,
##                                   3.65022666154437, 1.43595082597003,
##                                   2.17737610449481, 1.24868228966577,
##                                   1.08279677295428, 0.724697656550135,
##                                   2.19827967729543),
##                    error = c(0.497512506586033, 0.253156122081137,
##                              0.157245423563603, 0.218553145335019,
##                              0.0865678202466183, 0.0572587889177698,
##                              0.392239679332439, 0.226761402556839,
##                              0.059160429882746, 0.169849882166813,
##                              0.137906630574863, 0.0806802789826653,
##                              0.109612521393389, 0.0805661157918473,
##                              0.0852946611195881, 0.0765991333570295,
##                              0.104578534434981),
##                    grouping = structure(c(1L, 1L, 1L, 1L,
##                                           1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L,
##                                           2L, 2L, 2L, 2L),
##                                         .Label = c("conifer", "deciduous"),
##                                         class = "factor")
##                    ),
##               .Names = c("species_group_label", "prediction", "error",
##                          "grouping"),
##               class = "data.frame", row.names = c(NA, -17L)
##               )
## 
## 
## 
# I turn help back on.
options(list(pager = file.path(R.home(), "bin/pager")))
# I turn help back on.
options(list(pager = file.path(R.home(), "bin/pager")))
