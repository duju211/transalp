pre_process_meas <- function(df_act_meas) {
  df_act_meas |>
    arrange(act_date, time) |>
    mutate(
      act_date_chr = as.character(act_date),
      altitude_norm = altitude / max(altitude),
      row_nr = row_number()) |>
    group_by(id) |>
    mutate(
      distance = distance / 1000,
      distance_norm = distance / max(distance)) |>
    ungroup()
}
