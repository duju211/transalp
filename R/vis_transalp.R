vis_transalp <- function(gg_rides, gg_altitude) {
  (gg_rides + gg_altitude) +
    plot_annotation(
      title = "Transalp 2020",
      subtitle = "Albstadt - Lugano") &
    theme_pomological_fancy(base_size = 30) &
    theme(legend.position = "none") &
    scale_color_manual(values = ggpomological:::pomological_palette[-4]) &
    scale_fill_manual(values = ggpomological:::pomological_palette[-4])
}
