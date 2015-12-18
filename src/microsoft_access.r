if (! require("RODBC")) install.packages("RODBC")
library("RODBC")
channel <- odbcConnectAccess2007(file.path(input_directory, 
                                           "species_shares.accdb"))
species_shares_1987 <- sqlFetch(channel, "Species_shares_1987")
species_shares_2002 <- sqlFetch(channel, "Species_shares_2002")
species_shares_2012 <- sqlFetch(channel, "Species_shares_2012")
odbcClose(channel)
