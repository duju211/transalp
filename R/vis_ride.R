vis_ride <- function(sf_act_meas, gg_alpen, df_poi) {
  ggmap(gg_alpen, darken = c(.5, "#f8eed1")) +
    geom_sf(
      data = sf_act_meas, inherit.aes = FALSE,
      mapping = aes(color = act_date_chr), size = 1.2) +
    geom_label_repel(
      data = df_poi, mapping = aes(label = poi_name), alpha = 0.6,
      family = "Homemade Apple", size = 6.5) +
    labs(x = "Longitude", y = "Latitude")
}
