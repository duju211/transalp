#' Title
#'
#' @param df_act_meas
#'
#' @return
#' @export
#'
#' @examples
vis_altitude_ridge <- function(df_act_meas) {
  df_act_meas %>%
    tibble::as_tibble() %>%
    tidyr::unnest_legacy(act_data) %>%
    dplyr::mutate(distance = distance / 1000) %>%
    ggplot2::ggplot(ggplot2::aes(
      x = distance, y = act_date_chr, height = altitude,
      group = act_date_chr, color = act_date_chr)) +
    ggridges::geom_ridgeline(scale = 0.0025, alpha = 0.2) +
    ggplot2::labs(
      x = "Distanz [km]", y = ggplot2::element_blank()) +
    ggplot2::theme_light() +
    ggplot2::theme(
      legend.position = "none") +
    ggplot2::scale_y_discrete(position = "right") +
    ggplot2::scale_x_continuous(breaks = scales::breaks_width(10))
}
