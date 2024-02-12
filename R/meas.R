meas <- function(meas_file) {
  df_meas_raw <- read_rds(meas_file)

  df_distance_max <- df_meas_raw |>
    group_by(id) |>
    summarise(distance_max = max(distance)) |>
    mutate(
      distance_max = lag(distance_max, default = 0),
      distance_max = cumsum(distance_max))

  df_meas_raw |>
    left_join(df_distance_max, by = join_by(id)) |>
    mutate(distance_cum = distance + distance_max)
}
