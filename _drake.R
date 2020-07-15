library(patchwork)
library(tidyverse)
library(lubridate)
library(devtools)
library(usethis)
library(drake)
library(rava)

load_all()

extrafont::font_import()
extrafont::loadfonts(device = "win")

theme_set(theme_light())

trans_alp_plan <- drake_plan(
  tour_start_date = ymd("2020-06-21"),
  tour_end_date = ymd("2020-06-26"),
  tolerance_bbox = 0.1,
  zoom_map = 9,

  my_app = define_strava_app(),
  my_endpoint = define_strava_endpoint(),
  my_sig = target(
    define_strava_sig(my_endpoint, my_app),
    trigger = trigger(condition = FALSE)),
  df_act = read_all_activities(my_sig),
  df_act_rel = df_act %>%
    mutate(act_date = as_date(start_date)) %>%
    filter(act_date >= tour_start_date, act_date <= tour_end_date),
  df_act_stream_raw =
    dplyr::mutate(
      df_act_rel,
      id = as.character(id),
      stream = purrr::map(id, ~ read_activity_stream(.x, my_sig))),
  df_act_stream = tidy_streams(df_act_stream_raw),
  df_act_meas = extract_meas(df_act_stream),
  include_data = use_data(df_act_meas, overwrite = TRUE),
  df_act_meas_pro = pre_process_meas(df_act_meas),
  sf_act_meas = convert_to_sf(df_act_meas_pro),
  df_poi = extract_poi(sf_act_meas),
  gg_altitude = vis_altitude(df_act_meas_pro),
  gg_altitude_ridges = vis_altitude_ridge(sf_act_meas),
  gg_alpen = get_alpen_map(
    sf_act_meas, tol_bbox = tolerance_bbox, map_zoom = zoom_map),
  gg_rides = vis_ride(sf_act_meas, gg_alpen, df_poi),
  out_gg_altitude = ggsave(
    file_out("trans_alp_2020.png"),
    plot = (gg_rides + gg_altitude_ridges) +
      plot_annotation(
        title = "Transalp 2020",
        subtitle = "Albstadt - Lugano") &
      theme(text = element_text(family = "Fira Code Retina")),
    width = 10, height = 7)
)

drake_config(trans_alp_plan, envir = getNamespace('transalp'))
