act_meas_points <- function(df_meas, df_act) {
  df_meas |>
    st_as_sf(coords = c("lng", "lat"), crs = 4326) |>
    left_join(df_act, by = join_by(id))
}
