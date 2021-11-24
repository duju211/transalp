pre_process_meas <- function(df_act_meas) {
  df_act_meas |>
    mutate(
      act_date_chr = as.character(act_date),
      altitude_norm = altitude / max(altitude)) |>
    group_by(id) |>
    mutate(distance_norm = distance / max(distance)) |>
    ungroup()
}
