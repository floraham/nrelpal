#' CSU Primary Palette
#'
#' Returns a vector of primary CSU/NREL lab colors.
#' @export
csu_primary_palette <- function() {
  c("#1E4D2B", "#C8C372", "#D9782D", "#FFFFFF", "#59595B")
}

#' CSU Energy Palette
#'
#' Returns a vector of colors used for CSU energy-themed graphics.
#' @export
csu_energy_palette <- function() {
  c("#008FB3", "#105456", "#006144", "#82C503", "#CFFC00", "#FFC038", "#E56A54", "#7E5475")
}

#' CSU Palettes
#'
#' Access and interpolate CSU color palettes.
#'
#' @param palette Which palette to use: "primary" or "energy".
#' @param n Number of colors to return. If `NULL`, returns all colors in the palette.
#' @return A vector of hex color codes.
#' @examples
#' csu_pal("primary")
#' csu_pal("energy", 10)
#' @export
csu_pal <- function(palette = c("primary", "energy"), n = NULL) {
  palette <- match.arg(palette)
  
  colors <- switch(palette,
                   primary = csu_primary_palette(),
                   energy = csu_energy_palette())
  
  if (is.null(n)) {
    return(colors)
  } else {
    return(colorRampPalette(colors)(n))
  }
}
