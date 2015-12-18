file <- "src/hello_world.r"
if (file.exists(file)) {
    source(file)
} else {
    warning("You don't have ", file, " at hand!\n", 
            "This will crash!")
}

