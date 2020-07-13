#' Function to preprocess measurements of the included activities.
#'
#' @param df_act_meas
#'
#' @return Preprocessed activities
#' @export
#'
#' @examples
#' pre_process_meas(df_act_meas)
pre_process_meas <- function(df_act_meas) {
  df_act_meas %>%
    dplyr::mutate(
      act_date_chr = as.character(act_date),
      altitude_norm = altitude / max(altitude)) %>%
    dplyr::group_by(id) %>%
    dplyr::mutate(distance_norm = distance / max(distance)) %>%
    dplyr::ungroup()
}
