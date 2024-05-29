vis_altitude <- function(sf_act_meas_points, sf_act_meas_lines) {
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

  ggsave("altitude_plot.png", gg_altitude)
}
