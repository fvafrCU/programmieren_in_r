abbreviations <- levels(species_shares_1987[["species_group_label"]])
levels(species_shares_1987[["species_group_label"]])[abbreviations == abbreviation] <-
    text

