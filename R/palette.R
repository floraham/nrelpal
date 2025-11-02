#' CSU Primary Palette
#'
#' Returns the official CSU primary brand colors.
#' Each color is named according to CSU branding guidelines.
#' @return Named character vector of hex codes
#' @export
csu_primary_palette <- function() {
  c(
    "Colorado State Green" = "#1E4D2B",
    "Colorado State Gold"  = "#C8C372",
    "Aggie Orange"         = "#D9782D",
    "80% Black"            = "#59595B",
    "White"                = "#FFFFFF"
  )
}

#' CSU Energy Palette
#'
#' Returns the official CSU energy / secondary brand colors.
#' Each color is named according to CSU branding guidelines.
#' @return Named character vector of hex codes
#' @export
csu_energy_palette <- function() {
  c(
    "Oval Green"       = "#006144",
    "Lovers Lane"      = "#82C503",
    "Energy Green"     = "#CFFC00",
    "Flower Trial Red" = "#E56A54",
    "Powered Purple"   = "#7E5475",
    "Horsetooth Blue"  = "#008FB3",
    "Stalwart Slate"   = "#105456",
    "Sunshine"         = "#FFC038"
  )
}

#' Get Colors from a CSU Palette
#'
#' Interpolate colors from a CSU palette.
#' @param palette Character: "primary" or "energy"
#' @param n Number of colors to return. If NULL, returns all colors in the palette.
#' @return Character vector of hex codes
#' @examples
#' csu_pal("primary")
#' csu_pal("energy", 10)
#' @export
csu_pal <- function(palette = c("primary", "energy"), n = NULL) {
  palette <- match.arg(palette)
  
  pal <- switch(palette,
                primary = csu_primary_palette(),
                energy  = csu_energy_palette())
  
  if (is.null(n)) {
    return(pal)
  } else {
    return(colorRampPalette(unname(pal))(n))
  }
}

#' Display a CSU Palette
#'
#' Show a palette as a horizontal color strip with names.
#' @param palette Character: "primary" or "energy"
#' @export
show_csu_palette <- function(palette = c("primary", "energy")) {
  palette <- match.arg(palette)
  pal <- csu_pal(palette)
  pal_names <- names(switch(palette,
                            primary = csu_primary_palette(),
                            energy  = csu_energy_palette()))
  
  n <- length(pal)
  op <- par(mar = c(2, 2, 2, 2))
  image(1:n, 1, as.matrix(1:n), col = pal, axes = FALSE, xlab = "", ylab = "")
  text(x = 1:n, y = rep(0.5, n), labels = pal_names, srt = 45, adj = c(1, 0.5), cex = 0.8, xpd = TRUE)
  title(main = paste("CSU", toupper(palette), "Palette"), line = 0.5)
  par(op)
}
