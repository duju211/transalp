vis_ride <- function(sf_act_meas_lines, sf_act_meas_points, raster_alpen) {
  theme_set(theme_light(base_size = 12))

  raster_alpen_unpacked <- raster_alpen |>
    unwrap()

  gg_ride <- ggplot(sf_act_meas_lines) +
    geom_spatraster_contour(data = raster_alpen_unpacked, binwidth = 200) +
    geom_sf(aes(color = id)) +
    geom_label_repel(
      aes(x = lng_poi, y = lat_poi, label = poi_name),
      size = 2.5, fill = alpha(c("white"), 0.5)) +
    labs(
      x = "Longitude", y = "Latitude") +
    theme(
      legend.position = "none", panel.grid.major = element_blank(),
      axis.text.x = element_text(angle = 90))

  gg_altitude <- sf_act_meas_points |>
    filter(moving) |>
    ggplot(aes(x = distance_cum, y = altitude, color = id, group = id)) +
    geom_line() +
    geom_label(
      data = sf_act_meas_lines,
      mapping = aes(x = mean_distance, y = mean_altitude, label = name),
      fill = alpha(c("white"), 0.5)) +
    labs(x = "Distance [km]", y = "Height [m]") +
    theme(legend.position = "none") +
    expand_limits(y = 0) +
    scale_x_continuous(
      labels = label_number(scale = 0.001),
      breaks = breaks_width(50000)) +
    scale_y_continuous(position = "right")

  gg_final <- gg_ride + gg_altitude +
    plot_layout(widths = c(1, 3)) +
    plot_annotation(
      title = "Transalp 2020",
      subtitle = "Albstadt - Lugano") &
    theme(text = element_text(family = "Fira Code", size = 12))

  ggsave(
    "transalp.png", gg_final,
    width = 40, height = 25, units = "cm", scale = 0.8)
}
