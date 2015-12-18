#!/usr/bin/Rscript --vanilla
if (FALSE) {
    get_bagr_spec <- function() {
        bagr.spec <-  list(bagr.lab = c("FI", "TA", "DGL", "KIE", 
                                        "LAE", 
                                        "sNB", 
                                        "BU", "EI", 
                                        "REI", "ES", "BA", "HB", 
                                        "sALH", 
                                        "BI", "ER", "PA",  
                                        "sALN"
                                        ), 
                           ba.grupp =list(c(10), c(30), c(40), c(20), 
                                          c(50, 51), 
                                          c(11:19, 21:29, 31:39, 90:99), 
                                          c(100), c(110, 111), 
                                          c(112), c(120), c(140), c(130), 
                                          c(141:199), 
                                          c(200, 201), c(210:213), c(220:224), 
                                          c(230:299)
                                          ), 
                           colors = c(BAGR.BWI$ba.colors[1:5],
                                      '#DC143C',
                                      BAGR.BWI$ba.colors[6:7],
                                      '#00BFFF', '#483D8B', '#008B8B','#6B8E23', 
                                      BAGR.BWI$ba.colors[8], 
                                      '#F5DEB3', '#D2691E', '#BC8F8F', 
                                      BAGR.BWI$ba.colors[9]
                                      ),
                           bagr.text = c("Fichte", "Weißtanne", "Douglasie", "Kiefer", 
                                              "Lärchen", 
                                              "sonst. Nadelholz", 
                                              "Buche", "Eichen", 
                                              "Roteiche", "Esche", "Bergahorn", "Hainbuche", 
                                              "sonst. Hartholz", 
                                              "Birken", "Erlen", "Pappeln",  
                                              "sonst. Weichholz"
                                              ) 
                           )

             return(bagr.spec)
    }


    FVBN.bagr.spec.gw.3 <-
        FVBN.bagrupp.akl.dkl.stratum.fun.2e(
                                            baeume.3,ecken.3,trakte.3,A,2,get_bagr_spec(),
                                            list(A.ob=500,A.b=500),list(D.unt=0,D.ob=500,D.b=500,Ndh=F),
                                            list(Wa=c(3,5),Begehbar=1))
    FVBN.bagr.spec.gw.2 <-
        FVBN.bagrupp.akl.dkl.stratum.fun.2e(
                                            baeume.2,ecken.2,trakte.2,A.12,2,get_bagr_spec(),
                                            list(A.ob=500,A.b=500),list(D.unt=0,D.ob=500,D.b=500,Ndh=F),
                                            list(Wa=c(1,2,3),Begehbar=1))
    FVBN.bagr.spec.gw.1 <-
        FVBN.bagrupp.akl.dkl.stratum.fun.2e(
                                            baeume.1,ecken.1,trakte.1,A.12,1,get_bagr_spec(),
                                            list(A.ob=500,A.b=500),list(D.unt=0,D.ob=500,D.b=500,Ndh=F),
                                            list(Wa=c(1,2,3),Begehbar=1))


    get_species_areas <- function(statistics_list){
        data_frame <- data.frame(species_group_label = factor(get_bagr_spec()[["bagr.lab"]], 
                                                  levels = rev(get_bagr_spec()[["bagr.lab"]])),
                                 prediction = get('FVBN.ha.Bagr.Akl.Dkl', 
                                                  statistics_list
                                                  )[1, 1, seq(along = get_bagr_spec()[["bagr.lab"]]), , ],
                                 error = get('FVBN.ha.Bagr.Akl.Dkl', 
                                             statistics_list
                                             )[1, 2, seq(along = get_bagr_spec()[["bagr.lab"]]), , ]
                                 )
        return(data_frame)
    }

    dput(get_species_areas(FVBN.bagr.spec.gw.1))
    dput(get_species_areas(FVBN.bagr.spec.gw.2))
    dput(get_species_areas(FVBN.bagr.spec.gw.3))

}

source("structures.r")
subdirectory <- file.path("..", "data", "input")
if (! dir.exists(subdirectory)) dir.create(subdirectory, recursive = TRUE)

for (year in c(1987, 2002, 2012)) {
    data <- eval(parse(text = paste0("species_areas_", year)))
    idx <- which(data[["species_group_label"]] == "sNB")
    data[["grouping"]] <- 
        c(rep("conifer", idx),
          rep("deciduous", length(data[["species_group_label"]]) - idx)
          )

    file <- file.path(subdirectory, paste0("species_shares_", year, ".csv"))
    write.csv2(data, file = file, row.names = FALSE)
    Sys.chmod(file, mode="0644", use_umask=FALSE)
}

