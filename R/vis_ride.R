#' Title
#'
#' @param sf_act_meas
#' @param gg_alpen
#'
#' @return
#' @export
#'
#' @examples
vis_ride <- function(sf_act_meas, gg_alpen) {
  ggmap::ggmap(gg_alpen) +
    ggplot2::geom_sf(
      data = sf_act_meas, inherit.aes = FALSE,
      mapping = aes(color = act_date_chr), size = 1.2) +
    ggplot2::theme_light() +
    ggplot2::labs(
      x = "Longitude", y = "Latitude") +
    ggplot2::theme(legend.position = "none")
}
