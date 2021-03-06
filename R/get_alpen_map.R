#' Get the ground map for the visualisation of the spatial data.
#'
#' @param sf_act_meas
#' @param tol_bbox
#' @param map_zoom
#'
#' @return
#' @export
#'
#' @examples
get_alpen_map <- function(sf_act_meas, tol_bbox = 0.015, map_zoom = 10) {
  bbox <- sf::st_bbox(sf_act_meas)

  stamen_map <- ggmap::get_stamenmap(
    bbox = c(
      left = bbox$xmin[[1]] - tol_bbox,
      right = bbox$xmax[[1]] + tol_bbox,
      bottom = bbox$ymin[[1]] - tol_bbox,
      top = bbox$ymax[[1]] + tol_bbox),
    maptype = "terrain-background", zoom = map_zoom, color = "bw")
}
