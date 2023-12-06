#read data and results
data_path <- here::here("02_build","data","stock.obj")
data <- readRDS(data_path)

long_data_path <- here::here("02_build","data","stock_long.obj")
long_data <- readRDS(long_data_path)

results_path <- here::here("03_analyze","Regression","output","result.obj")
results <- readRDS(results_path)

library(ggplot2)

#get plot
Nintendo <- results[[1]]
days = length(data$Nintendo)
Nintendo_df <- data.frame("t" = seq(1,days,1),
                          "coef_kf" = Nintendo$a[,2][1:days+1],
                          "coef_smo" = Nintendo$alphahat[,2])

plot_Nintendo <- ggplot(data =Nintendo_df, mapping = aes(x = t))+
  geom_line(aes(y = coef_kf, linetype = "カルマンフィルタ")) +
  geom_line(aes(y = coef_smo, linetype = "平滑化")) +
  theme_classic()+
  labs(title = "任天堂のベータの推移")+
  xlab("time")+
  ylab("beta")+
  scale_linetype_manual(values = c("カルマンフィルタ" = "dashed",
                                   "平滑化" = "solid"))

Tokyo <- results[[2]]
days = length(data$Nintendo)
Tokyo_df <- data.frame("t" = seq(1,days,1),
                          "coef_kf" = Tokyo$a[,2][1:days+1],
                          "coef_smo" = Tokyo$alphahat[,2])

plot_Tokyo <- ggplot(data = Tokyo_df, mapping = aes(x = t))+
  geom_line(aes(y = coef_kf, linetype = "カルマンフィルタ")) +
  geom_line(aes(y = coef_smo, linetype = "平滑化")) +
  theme_classic()+
  labs(title = "東京電力のベータの推移")+
  xlab("time")+
  ylab("beta")+
  scale_linetype_manual(values = c("カルマンフィルタ" = "dashed",
                                   "平滑化" = "solid"))

Nintendo_path <- here::here("04_report","Regression","output","Nintendo.pdf")
ggsave(filename = Nintendo_path, plot = plot_Nintendo, device = "pdf",
       width = 8, height = 5, family = "Japan1")

Tokyo_path <- here::here("04_report","Regression","output","Tokyo_denryoku.pdf")
ggsave(filename = Tokyo_path, plot = plot_Tokyo, device = "pdf",
       width = 8, height = 5, family = "Japan1")


#get long time plot
Nintendo_long <- results[[3]]
long_days = length(long_data$Nintendo)
long_Nintendo_df <- data.frame("t" = seq(1,long_days,1),
                          "coef_kf" = Nintendo_long$a[,2][1:long_days+1],
                          "coef_smo" = Nintendo_long$alphahat[,2])

plot_Nintendo_long <- ggplot(data = long_Nintendo_df, mapping = aes(x = t))+
  geom_line(aes(y = coef_kf, linetype = "カルマンフィルタ")) +
  geom_line(aes(y = coef_smo, linetype = "平滑化")) +
  theme_classic() +
  ylim(c(0, 1.8)) +
  labs(title = "任天堂のベータの推移")+
  xlab("time")+
  ylab("beta")+
  scale_linetype_manual(values = c("カルマンフィルタ" = "dashed",
                                   "平滑化" = "solid"))+
  geom_vline(xintercept = 530, linetype="dotted")
  

Tokyo_long <- results[[4]]
long_Tokyo_df <- data.frame("t" = seq(1,long_days,1),
                       "coef_kf" = Tokyo_long$a[,2][1:long_days+1],
                       "coef_smo" = Tokyo_long$alphahat[,2])

plot_Tokyo_long <- ggplot(data = long_Tokyo_df, mapping = aes(x = t))+
  geom_line(aes(y = coef_kf, linetype = "カルマンフィルタ")) +
  geom_line(aes(y = coef_smo, linetype = "平滑化")) +
  theme_classic() + 
  ylim(c(0, 1.3)) +
  labs(title = "東京電力のベータの推移")+
  xlab("time")+
  ylab("beta")+
  scale_linetype_manual(values = c("カルマンフィルタ" = "dashed",
                                   "平滑化" = "solid"))+
  geom_vline(xintercept = 530, linetype="dotted")

plot_Tokyo_long_smo <- ggplot(data = long_Tokyo_df, mapping = aes(x = t))+
  geom_line(aes(y = coef_smo, linetype = "平滑化")) +
  theme_classic() + 
  #ylim(c(0, 1.3)) +
  labs(title = "東京電力のベータの推移")+
  xlab("time")+
  ylab("beta")+
  scale_linetype_manual(values = c("平滑化" = "solid"))+
  geom_vline(xintercept = 530, linetype="dotted")


#save 
Nintendo_path <- here::here("04_report","Regression","output","Nintendo_long.pdf")
ggsave(filename = Nintendo_path, plot = plot_Nintendo_long, device = "pdf",
       width = 8, height = 5, family = "Japan1")

Tokyo_path <- here::here("04_report","Regression","output","Tokyo_denryoku_long.pdf")
ggsave(filename = Tokyo_path, plot = plot_Tokyo_long, device = "pdf",
       width = 8, height = 5, family = "Japan1")

Tokyo_path <- here::here("04_report","Regression","output","Tokyo_denryoku_long_smo.pdf")
ggsave(filename = Tokyo_path, plot = plot_Tokyo_long_smo, device = "pdf",
       width = 8, height = 5, family = "Japan1")
