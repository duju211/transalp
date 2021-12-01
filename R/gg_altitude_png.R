gg_altitude_png <- function(gg_altitude) {
  path <- "README_files/gg_altitude.png"
  ggsave(filename = path, plot = gg_altitude)
  return(path)
}
