# Function to create and save a violin plot 
create_violin_plot <- function(data, output_filename_png, output_filename_svg) {
  violin_plot <- data %>%
    ggplot(aes(x = species, y = culmen_length_mm, fill = species)) +
    geom_violin(trim = FALSE, alpha = 0.7) +
    geom_jitter(width = 0.2, color = "black", alpha = 0.6) +
    labs(
      title = "Distribution of Culmen Length by Species",
      x = "Species",
      y = "Culmen Length (mm)",
      fill = "Species"
    ) +
    theme_minimal() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.border = element_rect(colour = "black", fill = NA, linewidth = 1),
      axis.line = element_line(colour = "black")
    )
  

  
  # Save as SVG
  ggsave(output_filename_svg, violin_plot, width = 8, height = 6)
  
  return(violin_plot)
}



# Function to create and save a box plot with significance bars 
create_box_plot <- function(data, output_filename_png = NULL, output_filename_svg = NULL) {
  # Determine the maximum y value for placing significance bars
  y_max <- max(data$transformed_length, na.rm = TRUE)
  
  # Generate the box plot with significance bars
  box_plot <- ggplot(data, aes(x = species, y = transformed_length, fill = species)) +
    geom_boxplot(outlier.shape = NA, colour = "black") +
    labs(
      title = "Boxplot of Transformed Culmen Length by Species",
      x = "Species",
      y = "Transformed Culmen Length"
    ) +
    theme_minimal() +
    theme(
      panel.grid.major.y = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.border = element_rect(colour = "black", fill = NA, linewidth = 1),
      axis.line = element_line(colour = "black"),
      plot.margin = margin(20, 10, 20, 10) # Extra space at the top for significance lines
    ) +
    scale_y_continuous(
      limits = c(3.7, y_max + 0.6), # Adjust y-axis scale
      expand = c(0, 0)
    ) +
    geom_signif(
      comparisons = list(c("Adelie", "Chinstrap")), 
      map_signif_level = TRUE,
      y_position = y_max + 0.2, # Adjust position for each comparison
      textsize = 4,
      tip_length = 0.02,
      colour = "black"
    ) +
    geom_signif(
      comparisons = list(c("Adelie", "Gentoo")), 
      map_signif_level = TRUE,
      y_position = y_max + 0.3, 
      textsize = 4,
      tip_length = 0.02,
      colour = "black"
    ) +
    geom_signif(
      comparisons = list(c("Chinstrap", "Gentoo")), 
      map_signif_level = TRUE,
      y_position = y_max + 0.4, 
      textsize = 4,
      tip_length = 0.02,
      colour = "black"
    )
  
  
  # Save the plot as SVG if a filename is provided
  if (!is.null(output_filename_svg)) {
    ggsave(output_filename_svg, box_plot, width = 8, height = 6)
  }
  
  # Return the plot
  return(box_plot)
}
