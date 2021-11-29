source("libraries.R")

walk(dir_ls("R"), source)

list(
  tar_target(tour_start_date, ymd("2020-06-21")),
  tar_target(tour_end_date, ymd("2020-06-26")),
  tar_target(tolerance_bbox, 0.1),
  tar_target(zoom_map, 9),

  tar_target(act_meas_path, "data/df_act_meas.rds", format = "file"),
  tar_target(df_act_meas, read_data(act_meas_path)),
  tar_target(df_act_meas_pro, pre_process_meas(df_act_meas)),
  tar_target(sf_act_meas, convert_to_sf(df_act_meas_pro)),
  tar_target(df_poi, extract_poi(df_act_meas_pro)),
  tar_target(gg_altitude, vis_altitude(df_act_meas_pro, df_poi)),
  tar_target(gg_altitude_ridges, vis_altitude_ridge(sf_act_meas)),
  tar_target(
    gg_alpen,
    get_alpen_map(sf_act_meas, tol_bbox = tolerance_bbox, map_zoom = zoom_map)),
  tar_target(gg_rides, vis_ride(sf_act_meas, gg_alpen, df_poi)),
  tar_target(
    gg_transalp,
    vis_transalp(gg_rides, gg_altitude, tour_start_date, tour_end_date)),
  tar_target(
    png_gg_transalp, save_gg_transalp(gg_transalp), format = "file"),

  tar_render(transalp_report, "trans_alp_2020.Rmd")
)
