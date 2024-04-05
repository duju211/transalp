source("libraries.R")

out_folder <- dir_create("data")
g_board <- board_gdrive("strava")

df_act <- pin_read(g_board, "df_act_26845822") |>
  mutate(start_date = as_date(start_date)) |>
  filter(start_date >= ymd("2020-06-21") & start_date <= ymd("2020-06-26")) |>
  select(
    id, act_date = start_date, name, elapsed_time, moving_time,
    distance, total_elevation_gain, start_latlng, end_latlng)

df_meas <- pin_read(g_board, "df_meas_26845822") |>
  semi_join(df_act, by = join_by(id))

write_rds(df_act, path(out_folder, "act.rds"))
write_rds(df_meas, path(out_folder, "meas.rds"))
