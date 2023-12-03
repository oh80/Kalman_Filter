#read data
path <- here::here("02_build","data","stock.obj")
data <- readRDS(path)

data$t <- seq(1, 226, 1)

plot <- ggplot2::ggplot(data = data, mapping = ggplot2::aes(x = t, y = Topix)) +
  ggplot2::geom_line() 
  
plot

