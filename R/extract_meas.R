#' Title
#'
#' @param df_act_stream
#'
#' @return
#' @export
#'
#' @examples
extract_meas <- function(df_act_stream) {
  df_act_stream %>%
    dplyr::select(id, act_date, stream) %>%
    tidyr::unnest(stream) %>%
    dplyr::select(-c(original_size, resolution, series_type)) %>%
    tidyr::unnest(where(purrr::is_list))
}
