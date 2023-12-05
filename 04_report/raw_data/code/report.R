#read data
path <- here::here("02_build","data","stock.obj")
data <- readRDS(path)

library(ggplot2)

#get Nintendo plot
days = length(data$Nintendo)
Nintendo_df <- data.frame("time" = seq(1, days, 1),
                          "stock_price" = data$Nintendo)

plot_Nintendo <- ggplot(data = Nintendo_df,
                        mapping = aes(x = time, y = stock_price))+
  geom_line() +
  labs(title = "任天堂の株価の推移") +
  ylab(label = "株価")　+
  theme_classic()


#get Tpkyo denryoku plot
Tokyo_df <- data.frame("time" = seq(1, days, 1),
                        "stock_price" = data$Tokyo_denryoku)

plot_Tokyo <- ggplot(data = Tokyo_df,
                        mapping = aes(x = time, y = stock_price))+
  geom_line() +
  labs(title = "東京電力の株価の推移") +
  ylab(label = "株価")　+
  theme_classic()


#save plot
Nintendo_path <- here::here("04_report", "raw_data", "output", "Nintendo.pdf")
ggsave(filename = Nintendo_path, plot = plot_Nintendo, device = "pdf",
       width = 8, height = 5, family = "Japan1")
 
Tokyo_path <- here::here("04_report", "raw_data", "output", "Tokyo_denryoku.pdf")
ggsave(filename = Tokyo_path, plot = plot_Tokyo, device = "pdf",
       width = 8, height = 5, family = "Japan1")


