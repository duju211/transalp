source("libraries.R")

walk(dir_ls("R"), source)

list(
  tar_target(act_file, "data/act.rds", format = "file"),
  tar_target(meas_file, "data/meas.rds", format = "file"),

  tar_target(df_act, act(act_file)),
  tar_target(df_meas, meas(meas_file)),
  tar_target(sf_act_meas_points, act_meas_points(df_meas, df_act)),
  tar_target(sf_act_meas_lines, act_meas_lines(sf_act_meas_points)),
  tar_target(raster_alpen, alpen_raster(sf_act_meas_lines)),
  tar_target(
    gg_ride, vis_ride(sf_act_meas_lines, sf_act_meas_points, raster_alpen),
    format = "file"),

  tar_render(
    trans_alp_post, "trans_alp_2020.Rmd", params = list(gg_ride = gg_ride))
)
