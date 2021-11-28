vis_altitude <- function(df_meas, df_poi) {
  df_meas |>
    mutate(act_date_chr = as.character(act_date)) |>
    ggplot(aes(
      x = distance, y = altitude, color = act_date_chr, group = act_date_chr)) +
    geom_line(size = 1.2) +
    geom_label(
      data = filter(df_poi, poi_type == "mountain"),
      mapping = aes(label = poi_name), alpha = 0.6,
      family = "Homemade Apple", size = 6.5, nudge_y = 80) +
    geom_area(aes(fill = act_date_chr), position = "identity", alpha = 0.1) +
    labs(x = "Distance [km]", y = "Height [m]") +
    scale_y_continuous(
      position = "right", expand = expansion(mult = c(0, .05))) +
    scale_x_continuous(breaks = breaks_width(10))
}
