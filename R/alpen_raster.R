alpen_raster <- function(sf_lines) {
  get_elev_raster(sf_lines, z = 6, clip = "bbox", expand = 0.1) |>
    rast() |>
    wrap()
}
