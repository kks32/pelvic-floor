library(ggplot2)

# r^{3.5}
eqx35 = function(x){x^3.5}
# linear r
eqx  = function(x){x}
# sqrt (r)
eqsqrtx  = function(x){x^0.5}

# Line plot with error bar
p <- ggplot(data.frame(x=seq(0, 1, 0.1)), aes(x=x), ymin = 1.0) +
     stat_function(fun=eqx35,  geom="line", aes(colour = "x^3.5")) +
     stat_function(fun=eqx,  geom="line", linetype="dashed", aes(colour = "x")) +
     stat_function(fun=eqsqrtx,  geom="line", aes(colour = "sqrt(x)")) +
     scale_colour_manual("Functions", values = c("red", "black", "green")) +
     theme_bw() + scale_y_continuous(breaks = seq(0.0, 12.0, 1.0)) +
     # Specify axis labels
     labs(x = "radius (r)", y = "change in quantity", title="Effect of size on the displacement of pelvic floor") +
     # Font size
     theme(axis.text=element_text(size=14), axis.title=element_text(size=14))

# Save file and scale axis
ggsave("pelvic-floor.pdf",p)

