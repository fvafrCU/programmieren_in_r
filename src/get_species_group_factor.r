get_species_group_factor <- function(x) {
    levels(x) <- vapply(levels(x), 
                        get_species_group_text,
                        character(length = 1)
                        )
    return(x)

}

