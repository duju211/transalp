vis_transalp <- function(gg_rides, gg_altitude, tour_start_date,
                         tour_end_date, df_poi) {
  font_add_google("Homemade Apple", "home")
  out_path <- "gg_transalp.png"

  gg_rides_txt <- gg_rides +
    geom_text(
      data = filter(df_poi, poi_type %in% c("start_location", "end_location")),
      mapping = aes(x = lng + offset, label = poi_name), alpha = 0.6,
      min.segment.length = 0, box.padding = 1.5, family = "home", size = 60) +
    geom_point(
      data = filter(df_poi, poi_type == "mountain"),
      mapping = aes(x = lng), shape = 17)

  gg_altitude_txt <- gg_altitude +
    geom_text(
      data = filter(df_poi, poi_type == "mountain"),
      mapping = aes(label = poi_name), nudge_y = 80, family = "home",
      size = 60)

  gg_final <- (gg_rides_txt + gg_altitude_txt) +
    plot_annotation(
      title = "Transalp 2020: Albstadt - Lugano",
      subtitle = str_glue(
        "{format(tour_start_date, '%d.')} - ",
        "{format(tour_end_date, '%d. %B% %Y')}, 491 Kilometers, ",
        "8260 Altitude Meters"),
      caption = "datannery.com/posts/transalp/") &
    theme_pomological_plain() &
    theme(
      legend.position = "none",
      axis.title.y.right = element_text(margin = margin(l = 35)),
      text = element_text(family = "home", size = 182)) &
    scale_color_manual(values = ggpomological:::pomological_palette[-4]) &
    scale_fill_manual(values = ggpomological:::pomological_palette[-4])

  ggsave(out_path, gg_final, width = 80, height = 60, dpi = 500, units = "cm")
}
