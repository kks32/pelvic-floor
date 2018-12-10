library(ggplot2)
# Set working directory, put the path to the folder containing your files inbetween the inverted commas
setwd("./")
#Import your data, save it as a csv in excel with the column headings
df <- read.csv("effect-radius-deflection-airy.csv", sep=",", header=TRUE)

# Line plot with error bar
p <- ggplot(df, aes(df$parameter)) + 
     geom_line(aes(y = df$radius, colour = "radius (r)")) + 
     geom_line(aes(y = df$thickness, colour = "r + thickness (t)")) +
     geom_line(aes(y = df$all_const_mass, colour = "r + t + P (const mass)")) +
     geom_line(aes(y = df$pressure, colour = "r + pressure (P)")) +
     geom_line(aes(y = df$all, colour = "r + t + P")) +
     scale_colour_manual("Sensitivity", values = c("black", "red", "orange", "green", "blue")) +
     theme_bw() +
     scale_y_continuous(breaks = seq(-50.0, 1200.0, 50.0)) + 
     # Specify axis labels
     labs(x = "Change in parameter (%)", y = "Change in deflection (%)", title="Effect of change in the radius on the displacement of the pelvic floor") +
     # Font size
     theme(axis.text=element_text(size=14), axis.title=element_text(size=14))


# Save file and scale axis
ggsave("deflection-airy.pdf",p)

