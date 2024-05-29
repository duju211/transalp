vis_transalp <- function(gg_ride, gg_altitude) {
  image_append(c(image_read(gg_ride), image_read(gg_altitude))) |>
    image_write("transalp.png")
}
