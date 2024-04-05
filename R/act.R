act <- function(act_file) {
  read_rds(act_file) |>
    mutate(
      start_name = case_when(
        id == "3650448726" ~ "Albstadt",
        id == "3654245140" ~ "Winterthur",
        id == "3659045033" ~ "Fluelen",
        id == "3664650034" ~ "Andermatt",
        id == "3669729902" ~ "Andermatt",
        TRUE ~ NA_character_),
      end_name = case_when(
        id == "3650448726" ~ "Winterthur",
        id == "3654245140" ~ "Fluelen",
        id == "3659045033" ~ "Andermatt",
        id == "3664650034" ~ "Andermatt",
        id == "3669729902" ~ "Lugano",
        TRUE ~ NA_character_),
      poi_name = if_else(end_name == "Lugano", "Lugano", start_name),
      name = str_glue("{start_name} - {end_name}"),
      lat_poi = if_else(
        poi_name == "Lugano",
        map_dbl(end_latlng, 1),
        map_dbl(start_latlng, 1)),
      lng_poi = if_else(
        poi_name == "Lugano",
        map_dbl(end_latlng, 2),
        map_dbl(start_latlng, 2))) |>
    select(-distance)
}
