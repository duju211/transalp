library(tidyverse)
library(lubridate)
library(drake)
library(rava)

devtools::load_all()
expose_imports(transalp)
expose_imports(rava)

extrafont::font_import()
extrafont::loadfonts(device = "win")

theme_set(theme_light())

trans_alp_plan <- drake_plan(
  tour_start_date = ymd("2020-06-21"),
  tour_end_date = ymd("2020-06-26"),
  tolerance_bbox = 0.1,
  zoom_map = 11,

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
  sf_act_meas = convert_to_sf(df_act_meas),
  gg_altitude = vis_altitude(df_act_meas),
  gg_alpen = get_alpen_map(
    sf_act_meas, tol_bbox = tolerance_bbox, map_zoom = zoom_map),
  gg_rides = vis_ride(sf_act_meas, gg_alpen),
  out_gg_altitude = ggsave(
    file_out("altitude.png"),
    plot = gg_altitude +
      theme(text = element_text(family = "Fira Code Retina")))
)

drake_config(trans_alp_plan)
