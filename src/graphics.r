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

