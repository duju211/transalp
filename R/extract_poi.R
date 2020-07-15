#' Extract points of interest
#'
#' @param sf_act_meas
#'
#' @return
#' @export
#'
#' @examples
extract_poi <- function(sf_act_meas) {
  sf_act_meas %>%
    tibble::as_tibble() %>%
    dplyr::transmute(
      id, first_row = purrr::map(act_data, ~ .x[1,]),
      last_row = purrr::map(act_data, ~ .x[nrow(.x), ]),
      decisive_row = dplyr::if_else(id == "3669729902", last_row, first_row)) %>%
    tidyr::unnest(decisive_row) %>%
    dplyr::select(where(purrr::negate(purrr::is_list))) %>%
    dplyr::mutate(
      poi_name = dplyr::case_when(
        act_date == "2020-06-21" ~ "Albstadt",
        act_date == "2020-06-22" ~ "Winterthur",
        act_date == "2020-06-23" ~ "Flüelen",
        act_date == "2020-06-24" ~ "Andermatt",
        act_date == "2020-06-25" ~ "Lugano",
        TRUE ~ NA_character_)) %>%
    dplyr::rename(lon = lng)
}
