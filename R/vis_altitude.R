vis_altitude <- function(df_meas) {
  df_meas |>
    mutate(act_date_chr = as.character(act_date)) |>
    ggplot(aes(x = distance, y = altitude, color = act_date_chr)) +
    geom_line() +
    facet_wrap(~ act_date, scales = "free_x", ncol = 1) +
    theme_light() +
    labs(
      title = "Höhenprofil",
      x = "Distanz", y = "Höhe")
}
