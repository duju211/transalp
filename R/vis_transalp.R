vis_transalp <- function(gg_rides, gg_altitude, tour_start_date,
                         tour_end_date) {
  (gg_rides + gg_altitude) +
    plot_annotation(
      title = "Transalp 2020: Albstadt - Lugano",
      subtitle = str_glue(
        "{format(tour_start_date, '%d.')} - ",
        "{format(tour_end_date, '%d. %B% %Y')}, 491 Kilometers, ",
        "8260 Altitude Meters"),
      caption = "datannery.com/posts/transalp/") &
    theme_pomological_fancy(base_size = 30) &
    theme(
      legend.position = "none",
      axis.title.y.right = element_text(margin = margin(l = 35))) &
    scale_color_manual(values = ggpomological:::pomological_palette[-4]) &
    scale_fill_manual(values = ggpomological:::pomological_palette[-4])
}
