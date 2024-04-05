act_meas_lines <- function(sf_act_meas_points) {
  sf_act_meas_points |>
    group_by(id, name, lng_poi, lat_poi, poi_name) |>
    summarise(
      mean_speed = mean(velocity_smooth),
      mean_altitude = mean(altitude),
      mean_distance = mean(distance_cum),
      do_union = FALSE, .groups = "drop") |>
    st_cast("LINESTRING")
}
