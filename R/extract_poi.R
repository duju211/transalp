extract_poi <- function(sf_act_meas) {
  sf_act_meas |>
    as_tibble() |>
    transmute(
      id, first_row = map(act_data, ~ .x[1,]),
      last_row = map(act_data, ~ .x[nrow(.x), ]),
      decisive_row = if_else(id == "3669729902", last_row, first_row)) |>
    unnest(decisive_row) |>
    select(where(negate(is_list))) |>
    mutate(
      poi_name = case_when(
        act_date == "2020-06-21" ~ "Albstadt",
        act_date == "2020-06-22" ~ "Winterthur",
        act_date == "2020-06-23" ~ "Flüelen",
        act_date == "2020-06-24" ~ "Andermatt",
        act_date == "2020-06-25" ~ "Lugano",
        TRUE ~ NA_character_)) |>
    rename(lon = lng)
}
