convert_to_sf <- function(df_act_meas) {
  df_act_meas |>
    nest(act_data = -c(id, act_date_chr)) |>
    mutate(
      line = map(
        act_data,
        ~ st_linestring(as.matrix(.x[, c("lng", "lat", "altitude")]))),
      geom = map(line, st_sfc, crs = 4326)) |>
    st_as_sf()
}
