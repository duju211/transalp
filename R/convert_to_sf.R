#' Title
#'
#' @param df_act_meas
#'
#' @return
#' @export
#'
#' @examples
convert_to_sf <- function(df_act_meas) {
  df_act_meas %>%
    tidyr::nest(act_data = -c(id, act_date)) %>%
    dplyr::mutate(
      line = purrr::map(
        act_data,
        ~ sf::st_linestring(as.matrix(.x[, c("lng", "lat", "altitude")]))),
      geom = purrr::map(line, sf::st_sfc, crs = 4326)) %>%
    sf::st_as_sf()
}
