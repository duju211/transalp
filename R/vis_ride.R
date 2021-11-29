vis_ride <- function(sf_act_meas, gg_alpen, df_poi) {
  ggmap(gg_alpen, darken = c(.5, "#f8eed1")) +
    geom_sf(
      data = sf_act_meas, inherit.aes = FALSE,
      mapping = aes(color = act_date_chr), size = 1.2) +
    geom_text(
      data = filter(df_poi, poi_type %in% c("start_location", "end_location")),
      mapping = aes(x = lng + offset, label = poi_name), alpha = 0.6,
      family = "Homemade Apple", size = 6.5, min.segment.length = 0,
      box.padding = 1.5) +
    geom_point(
      data = filter(df_poi, poi_type == "mountain"),
      mapping = aes(x = lng), shape = 17) +
    labs(x = "Longitude", y = "Latitude")
}
