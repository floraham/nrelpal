remotes::install_github("floraham/nrelpal")

# ----------------------------------------------------------
# 1. View available palettes
# ----------------------------------------------------------
csu_primary_palette()
csu_energy_palette()

# ----------------------------------------------------------
# 2. Use csu_pal() to get a palette with a specific number of colors
# ----------------------------------------------------------
# Default palette (returns all colors)
csu_pal("primary")

# Interpolated palette with 10 colors
csu_pal("energy", n = 10)

# ----------------------------------------------------------
# 3. Visualize the palettes in base R
# ----------------------------------------------------------
show_palette <- function(colors, title = "Palette") {
  n <- length(colors)
  image(1:n, 1, as.matrix(1:n), col = colors, axes = FALSE, xlab = "", ylab = "")
  title(main = title, line = 0.5)
}

par(mfrow = c(1, 2))
show_palette(csu_primary_palette(), "CSU Primary")
show_palette(csu_energy_palette(), "CSU Energy")

# ----------------------------------------------------------
# 4. Use in ggplot2
# ----------------------------------------------------------
library(ggplot2)

# Example dataset
df <- data.frame(
  x = 1:8,
  y = c(5, 7, 6, 9, 10, 8, 12, 11),
  group = factor(1:8)
)

# Using CSU Energy palette manually
ggplot(df, aes(x, y, color = group)) +
  geom_point(size = 5) +
  scale_color_manual(values = csu_pal("energy")) +
  theme_minimal() +
  labs(title = "CSU Energy Palette in ggplot2")

# Using CSU Primary palette interpolated to 8 colors
ggplot(df, aes(x, y, fill = group)) +
  geom_col() +
  scale_fill_manual(values = csu_pal("primary", n = 8)) +
  theme_minimal() +
  labs(title = "CSU Primary Palette for Fill")

# ----------------------------------------------------------
# 5. Generate palettes dynamically
# ----------------------------------------------------------
# Example: Create a 20-color energy gradient
energy_grad <- csu_pal("energy", 20)
show_palette(energy_grad, "CSU Energy (20-color gradient)")