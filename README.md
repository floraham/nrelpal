# nrelpal

`nrelpal` is an R package providing official **CSU brand color palettes** for use in plots and visualizations.  
It includes both primary and secondary (“energy”) palettes, along with helper functions for interpolation and visualization.

---

## Installation

Install the development version directly from GitHub:

```r
remotes::install_github("floraham/nrelpal")
```

---

## Usage

Load the package:

```r
library(nrelpal)
library(ggplot2)
```

### 1. View available palettes

```r
csu_primary_palette()
csu_energy_palette()
```

### 2. Interpolate a palette

```r
# Get 10 interpolated colors from the primary palette
csu_pal("primary", 10)
```

### 3. Visualize a palette

```r
show_csu_palette("primary")
show_csu_palette("energy")
```

---

## Example: Ecological Dataset

This example shows how to assign CSU brand colors to a **categorical ecological variable** (`functional_group`) and use it in a `ggplot2` plot.

```r
# Example dataset: functional groups
df <- data.frame(
  functional_group = c("Grass", "Shrub", "Tree", "Forb", "Lichen"),
  biomass = c(120, 80, 200, 60, 10)
)

# Map CSU primary colors to functional groups
category_colors <- setNames(
  csu_pal("primary", n = length(df$functional_group)),
  df$functional_group
)

category_colors
# Example output:
# Grass Shrub Tree Forb Lichen
# "#1E4D2B" "#C8C372" "#D9782D" "#FFFFFF" "#59595B"

# Plot using ggplot2
ggplot(df, aes(x = functional_group, y = biomass, fill = functional_group)) +
  geom_col() +
  scale_fill_manual(values = category_colors) +
  theme_minimal() +
  labs(
    title = "Biomass by Functional Group (CSU Palette)",
    x = "Functional Group",
    y = "Biomass (g/m²)"
  )
```

---

## Functions

- `csu_primary_palette()` — returns CSU primary brand colors (named vector)  
- `csu_energy_palette()` — returns secondary/energy palette (named vector)  
- `csu_pal(palette, n)` — interpolates a palette to `n` colors  
- `show_csu_palette(palette)` — plots a palette with color names

---

## License

MIT License
