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


