#' NREL Core Palette
#'
#' Returns a vector of hex colors used by the lab.
#' @export
nrel_palette <- function() {
  c("#355834", "#6B8E23", "#C2B280", "#D9BF77", "#EAE0C8")
}

#' Get n Colors from NREL Palette
#'
#' Interpolates the NREL palette to n colors.
#' @param n Number of colors to return
#' @export
nrel_pal <- function(n) {
  colorRampPalette(nrel_palette())(n)
}
