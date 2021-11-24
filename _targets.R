source("libraries.R")

walk(dir_ls("R"), source)

theme_set(theme_light())

list(
  tar_target(tour_start_date, ymd("2020-06-21")),
  tar_target(tour_end_date, ymd("2020-06-26")),
  tar_target(tolerance_bbox, 0.1),
  tar_target(zoom_map, 9),

  tar_target(act_meas_path, "data/df_act_meas.rds", format = "file"),
  tar_target(df_act_meas, read_rds(act_meas_path)),
  tar_target(df_act_meas_pro, pre_process_meas(df_act_meas)),
  tar_target(sf_act_meas, convert_to_sf(df_act_meas_pro)),
  tar_target(df_poi, extract_poi(sf_act_meas)),
  tar_target(gg_altitude, vis_altitude(df_act_meas_pro)),
  tar_target(gg_altitude_ridges, vis_altitude_ridge(sf_act_meas)),
  tar_target(
    gg_alpen,
    get_alpen_map(sf_act_meas, tol_bbox = tolerance_bbox, map_zoom = zoom_map)),
  tar_target(gg_rides, vis_ride(sf_act_meas, gg_alpen, df_poi))
  # out_gg_altitude = ggsave(
  #   file_out("trans_alp_2020.png"),
  #   plot = (gg_rides + gg_altitude_ridges) +
  #     plot_annotation(
  #       title = "Transalp 2020",
  #       subtitle = "Albstadt - Lugano") &
  #     theme(text = element_text(family = "Fira Code Retina")),
  #   width = 10, height = 7),
  #
  # transalp_report = target(
  #   command = {
  #     rmarkdown::render(knitr_in("trans_alp_2020.Rmd"))
  #     file_out("trans_alp_2020.Rmd.html")
  #   })
)
