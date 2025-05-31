#' @title illustrate_edges
#' @description Convert a ggplot2 chart into an edge-detected sketch using magick.
#' @param plot A ggplot2 object
#' @param out_path File path to save the edge-detected image
#' @return Opens the result image
#' @export
illustrate_edges <- function(plot, out_path = "edge_output.png") {
  # Save the plot temporarily
  temp_plot_path <- tempfile(fileext = ".png")
  ggplot2::ggsave(temp_plot_path, plot = plot, width = 6, height = 4, dpi = 300)

  # Read and apply edge detection
  img <- magick::image_read(temp_plot_path)
  edge_img <- magick::image_edge(img, radius = 1)

  # Save and show result
  magick::image_write(edge_img, path = out_path, format = "png")
  utils::browseURL(out_path)
}
