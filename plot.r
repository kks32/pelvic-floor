library(ggplot2)
# Set working directory, put the path to the folder containing your files inbetween the inverted commas
setwd("./")
#Import your data, save it as a csv in excel with the column headings
df <- read.csv("effect-radius-deflection.csv", sep=",", header=TRUE)

# Line plot with error bar
p <- ggplot(df, aes(df$parameter)) + 
     geom_line(aes(y = df$radius, colour = "radius")) + 
     geom_line(aes(y = df$thickness, colour = "thickness")) +
     geom_line(aes(y = df$pressure, colour = "pressure")) +
     scale_colour_manual("Sensitivity", values = c("red", "black", "blue")) +
     theme_bw() +
     # Specify axis labels
     labs(x = "Change in parameter (%)", y = "Change in deflection (%)", title="Effect of change in the radius on the displacement of the pelvic floor") +
     # Font size
     theme(axis.text=element_text(size=14), axis.title=element_text(size=14))


# Save file and scale axis
ggsave("deflection.pdf",p)

