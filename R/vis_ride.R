vis_ride <- function(sf_act_meas, gg_alpen, df_poi) {
  ggmap(gg_alpen) +
    geom_sf(
      data = sf_act_meas, inherit.aes = FALSE,
      mapping = aes(color = act_date_chr), size = 1.2) +
    geom_label_repel(
      data = df_poi, mapping = aes(label = poi_name), alpha = 0.6,
      family = "Fira Code Retina", size = 2.5) +
    theme_light() +
    labs(
      x = "Longitude", y = "Latitude") +
    theme(legend.position = "none")
}
