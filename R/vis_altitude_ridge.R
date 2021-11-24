vis_altitude_ridge <- function(df_act_meas) {
  df_act_meas |>
    as_tibble() |>
    unnest_legacy(act_data) |>
    mutate(distance = distance / 1000) |>
    ggplot(aes(
      x = distance, y = act_date_chr, height = altitude,
      group = act_date_chr, color = act_date_chr)) +
    ggridges::geom_ridgeline(scale = 0.0025, alpha = 0.2) +
    labs(
      x = "Distance [km]", y = element_blank()) +
    theme_light() +
    theme(
      legend.position = "none") +
    scale_y_discrete(position = "right") +
    scale_x_continuous(breaks = scales::breaks_width(10))
}
