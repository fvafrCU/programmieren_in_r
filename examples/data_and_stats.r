#% a T-Test
plot(prediction ~ grouping, data = species_shares_1987)
var.test(prediction ~ grouping, data = species_shares_1987)
sink(file.path(dirname(tempdir()), "hypothesis_test.txt"))
(
 # This is really just a silly example.")
 wilcox.test(prediction ~ grouping, data = species_shares_1987)
 )
sink()

#% calculate some difference and write table to csv
tmp <- merge(species_shares_1987[, c("species_group_label", "prediction")] ,
             species_shares_2012[, c("species_group_label", "prediction")] , 
             by = "species_group_label", suffixes = c("_1987", "_2012"))
tmp["difference"]  <- tmp[, "prediction_2012"] - tmp[, "prediction_1987"]
write.csv(tmp, file.path(dirname(tempdir()), "difference.csv"))
