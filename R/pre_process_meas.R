pre_process_meas <- function(df_act_meas) {
  df_act_meas |>
    arrange(act_date, time) |>
    mutate(
      act_date_chr = as.character(act_date),
      row_nr = row_number(), distance = distance / 1000)
}
