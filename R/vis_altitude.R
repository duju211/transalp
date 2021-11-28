vis_altitude <- function(df_meas) {
  df_meas |>
    mutate(act_date_chr = as.character(act_date)) |>
    ggplot(aes(
      x = distance, y = altitude, color = act_date_chr, fill = act_date_chr,
      group = act_date_chr)) +
    geom_line(size = 1.2) +
    geom_area(position = "identity", alpha = 0.1) +
    labs(x = "Distance [km]", y = "Height [m]") +
    scale_y_continuous(position = "right") +
    scale_x_continuous(breaks = breaks_width(10))
}
