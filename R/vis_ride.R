vis_ride <- function(sf_act_meas_lines, raster_alpen) {
  gg_ride <- ggplot(sf_act_meas_lines) +
    geom_spatraster_contour(data = raster_alpen, binwidth = 200) +
    geom_sf(aes(color = id)) +
    geom_label_repel(
      aes(x = lng_poi, y = lat_poi, label = poi_name),
      size = 2.5, fill = alpha(c("white"), 0.5)) +
    labs(
      x = "Longitude", y = "Latitude") +
    theme(
      legend.position = "none", panel.grid.major = element_blank(),
      axis.text.x = element_text(angle = 90))

  ggsave("ride_plot.png", gg_ride)
}
