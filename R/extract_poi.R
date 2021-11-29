extract_poi <- function(df_act_meas_pro) {
  tribble(
    ~row_nr, ~poi_name, ~poi_type,
    1, "Albstadt", "start_location",
    16280, "Winterthur", "start_location",
    32727, "Flueelen", "start_location",
    70385, "Andermatt", "start_location",
    90917, "Lugano", "end_location",
    53677, "Furka Pass", "mountain",
    61606, "Nufenen Pass", "mountain",
    69335, "Gotthard Pass", "mountain",
    43888, "Goescheneralp", "mountain",
    74266, "Gotthard Pass", "mountain",
    27223, "Aegerisee", "mountain",
    47338, "Andermatt", "mountain",
    88225, "Monte Ceneri", "mountain",
    1640, "Messstetten", "mountain") |>
    mutate(
      offset = case_when(
        poi_name == "Albstadt" ~ -0.22,
        poi_name == "Winterthur" ~ -0.2,
        poi_name == "Flueelen" ~ 0.2,
        poi_name == "Andermatt" ~ 0.21,
        TRUE ~ 0)) |>
    left_join(df_act_meas_pro, by = "row_nr")
}
