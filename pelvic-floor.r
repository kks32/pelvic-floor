library(ggplot2)

# r^{3.5}
eqx3.5 = function(x){(((x)/100+1)^3.5 - 1) * 100}
# r^{3}
eqx3 = function(x){(((x)/100+1)^3 - 1) * 100}
# r^{2}
eqx2 = function(x){(((x)/100+1)^2 - 1) * 100}
# r^{2.5}
eqx2.5 = function(x){(((x)/100+1)^2.5 - 1) * 100}
# linear r
eqx  = function(x){(((x)/100+1) - 1) * 100}

# Line plot with error bar
p <- ggplot(data.frame(x=seq(0, 100, 1)), aes(x=x), ymin = 1.0) +
     stat_function(fun=eqx3.5,  geom="line", size = 1, linetype="dashed", aes(colour = "x^3.5")) +
     stat_function(fun=eqx3,  geom="line", size = 1, linetype="dotdash", aes(colour = "x^3")) +
     stat_function(fun=eqx2.5,  geom="line", aes(colour = "x^2.5")) +
     stat_function(fun=eqx2,  geom="line", size = 1, linetype="longdash", aes(colour = "x^2")) +
     stat_function(fun=eqx,  geom="line", size = 0.5, linetype="dashed", aes(colour = "x")) +
     scale_colour_manual("Functions", values = c("black", "red", "orange", "blue", "green")) +
     theme_bw() + scale_y_continuous(breaks = seq(0.0, 1200.0, 100.0)) + 
     # Specify axis labels
     labs(x = "change in radius (r) %", y = "change in deflection (%)", title="Effect of size on the displacement of pelvic floor") +
     # Font size
     theme(axis.text=element_text(size=14), axis.title=element_text(size=14))

# Save file and scale axis
ggsave("pelvic-floor.pdf",p)

