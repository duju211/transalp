extract_meas <- function(df_act_stream) {
  df_act_stream |>
    select(id, act_date, stream) |>
    unnest(stream) |>
    select(-c(original_size, resolution, series_type)) |>
    unnest(where(is_list))
}
