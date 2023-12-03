#read data and results
data_path <-here::here("02_build","data","stock.obj")
data <- readRDS(data_path)

results_path <- here::here("03_analyze","Trend","output","results.obj")
results <- readRDS(results_path)

library(ggplot2)



Nintendo <- results[[3]][[1]]
Nintendo_df <- data.frame("date" = data$date,
                          "a" = Nintendo$a[,1][2:227],
                          "a_hat" = Nintendo$alphahat[,1],
                          "real" = data$Nintendo,
                          "t" = seq(1,226,1))

plot <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a_hat, colour = "filter") , data = Nintendo_df) +
  geom_line(aes(y = real, colour = "real"), data = Nintendo_df)

plot

