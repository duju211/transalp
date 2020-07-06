#' Title
#'
#' @param df_meas
#'
#' @return
#' @export
#'
#' @examples
vis_altitude <- function(df_meas) {
  df_meas %>%
    dplyr::mutate(act_date_chr = as.character(act_date)) %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = distance, y = altitude, color = act_date_chr)) +
    ggplot2::geom_line() +
    ggplot2::facet_wrap(~ act_date, scales = "free_x", ncol = 1) +
    ggplot2::theme_light() +
    ggplot2::labs(
      title = "Höhenprofil",
      x = "Distanz", y = "Höhe")
}
