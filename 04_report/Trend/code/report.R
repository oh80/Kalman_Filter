#read data and results
data_path <-here::here("02_build","data","stock.obj")
data <- readRDS(data_path)

result_path <- here::here("03_analyze","Trend","output","result.obj")
result <- readRDS(result_path)

library(ggplot2)

#get Local level model  Nintendo plot 
Nintendo <- result[[1]][[1]]
days = length(Nintendo$a)-1
Nintendo_df <- data.frame(
  "a" = Nintendo$a[,1][1:days+1],
  "a_hat" = Nintendo$alphahat[,1],
  "real" = data$Nintendo[1:days],
  "t" = seq(1,days,1))

Nintendo_kf_local <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a, linetype = "filter") , data = Nintendo_df) +
  geom_line(aes(y = real, linetype = "real"), data = Nintendo_df) +
  scale_linetype_manual(values = c("filter" = "solid", "real" ="dashed")) + 
  theme_classic() + 
  ylab("株価")+
  xlab("time")


Nintendo_smo_local <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a_hat, linetype = "smoother") , data = Nintendo_df) +
  geom_line(aes(y = real, linetype = "real"), data = Nintendo_df)+
  scale_linetype_manual(values = c("smoother"= "solid", "real" ="dashed")) +
  theme_classic() + 
  ylab("株価") +
  xlab("time")


Nintendo_kf_path <- here::here("04_report","Trend","output","Nintendo_kf_local.pdf")
ggsave(filename = Nintendo_kf_path, plot = Nintendo_kf_local, device = "pdf",
       width = 8, height = 5, family = "Japan1")

Nintendo_smo_path <- here::here("04_report","Trend","output","Nintendo_smo_local.pdf")
ggsave(filename = Nintendo_smo_path, plot = Nintendo_smo_local, device = "pdf",
       width = 8, height = 5, family = "Japan1")


#get trend model  Nintendo plot
Nintendo <- result[[2]][[1]]
days = length(Nintendo$a[,1])-1
Nintendo_df <- data.frame(
  "a" = Nintendo$a[,1][1:days+1],
  "a_hat" = Nintendo$alphahat[,1],
  "real" = data$Nintendo[1:days],
  "t" = seq(1,days,1))

Nintendo_kf_trend <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a, linetype = "filter") , data = Nintendo_df) +
  geom_line(aes(y = real, linetype = "real"), data = Nintendo_df) +
  scale_linetype_manual(values = c("filter" = "solid", "real" ="dashed")) + 
  theme_classic() + 
  ylab("株価")+
  xlab("time")

Nintendo_smo_trend <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a_hat, linetype = "smoother") , data = Nintendo_df) +
  geom_line(aes(y = real, linetype = "real"), data = Nintendo_df)+
  scale_linetype_manual(values = c("smoother"= "solid", "real" ="dashed")) +
  theme_classic() + 
  ylab("株価") +
  xlab("time")


Nintendo_kf_path <- here::here("04_report","Trend","output","Nintendo_kf_trend.pdf")
ggsave(filename = Nintendo_kf_path, plot = Nintendo_kf_trend, device = "pdf",
       width = 8, height = 5, family = "Japan1")

Nintendo_smo_path <- here::here("04_report","Trend","output","Nintendo_smo_trend.pdf")
ggsave(filename = Nintendo_smo_path, plot = Nintendo_smo_trend, device = "pdf",
       width = 8, height = 5, family = "Japan1")


#get Local trend model  Nintendo plot
Nintendo <- result[[3]][[1]]
days = length(Nintendo$a[,1])-1
Nintendo_df <- data.frame(
  "a" = Nintendo$a[,1][1:days+1],
  "a_hat" = Nintendo$alphahat[,1],
  "real" = data$Nintendo[1:days],
  "t" = seq(1,days,1))

Nintendo_kf_Localtrend <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a, linetype = "filter") , data = Nintendo_df) +
  geom_line(aes(y = real, linetype = "real"), data = Nintendo_df) +
  scale_linetype_manual(values = c("filter" = "solid", "real" ="dashed")) + 
  theme_classic() + 
  ylab("株価")+
  xlab("time")

Nintendo_smo_Localtrend <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = a_hat, linetype = "smoother") , data = Nintendo_df) +
  geom_line(aes(y = real, linetype = "real"), data = Nintendo_df)+
  scale_linetype_manual(values = c("smoother"= "solid", "real" ="dashed")) +
  theme_classic() + 
  ylab("株価") +
  xlab("time")


Nintendo_kf_path <- here::here("04_report","Trend","output","Nintendo_kf_Localtrend.pdf")
ggsave(filename = Nintendo_kf_path, plot = Nintendo_kf_Localtrend, device = "pdf",
       width = 8, height = 5, family = "Japan1")

Nintendo_smo_path <- here::here("04_report","Trend","output","Nintendo_smo_Localtrend.pdf")
ggsave(filename = Nintendo_smo_path, plot = Nintendo_smo_Localtrend, device = "pdf",
       width = 8, height = 5, family = "Japan1")