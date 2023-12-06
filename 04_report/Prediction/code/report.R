#read data and results
data_path <-here::here("02_build","data","stock.obj")
data <- readRDS(data_path)

result_path <- here::here("03_analyze","Prediction","output","result.obj")
result <- readRDS(result_path)

library(ggplot2)


#get Local level model prediction
Nintendo_pre <- result[[1]][[2]]
days <- 50
Nintendo_df <- data.frame("t" = seq(1,days,1),
                          "real" = data$Nintendo[1:50],
                          "pred" = c(rep(NA, days-10), Nintendo_pre[,1]),
                          "upper" = c(rep(NA, days-10), Nintendo_pre[,3]),
                          "lower" = c(rep(NA, days-10), Nintendo_pre[,2]))

Nintendo_local <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = real, linetype = "real") , data = Nintendo_df) +
  geom_line(aes(y = pred, linetype = "pred"), data = Nintendo_df) +
  geom_line(aes(y = upper, linetype = "upper"), data = Nintendo_df) +
  geom_line(aes(y = lower, linetype = "lower"), data = Nintendo_df) +
  scale_linetype_manual(values = c("real" = "solid", "pred" ="dashed",
                                   "upper" ="dotted", "lower" ="dotted")) + 
  theme_classic() + 
  ylab("株価")+
  xlab("time")

Nintendo_Local_path <- here::here("04_report","Prediction","output","Nintendo_local.pdf")
ggsave(filename = Nintendo_Local_path, plot = Nintendo_local, device = "pdf",
       width = 8, height = 5, family = "Japan1")

#get trend model prediction
Nintendo_pre <- result[[2]][[2]]
days <- 50
Nintendo_df <- data.frame("t" = seq(1,days,1),
                          "real" = data$Nintendo[1:50],
                          "pred" = c(rep(NA, days-10), Nintendo_pre[,1]),
                          "upper" = c(rep(NA, days-10), Nintendo_pre[,3]),
                          "lower" = c(rep(NA, days-10), Nintendo_pre[,2]))

Nintendo_trend <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = real, linetype = "real") , data = Nintendo_df) +
  geom_line(aes(y = pred, linetype = "pred"), data = Nintendo_df) +
  geom_line(aes(y = upper, linetype = "upper"), data = Nintendo_df) +
  geom_line(aes(y = lower, linetype = "lower"), data = Nintendo_df) +
  scale_linetype_manual(values = c("real" = "solid", "pred" ="dashed",
                                   "upper" ="dotted", "lower" ="dotted")) + 
  theme_classic() + 
  ylab("株価")+
  xlab("time")

Nintendo_Trend_path <- here::here("04_report","Prediction","output","Nintendo_Trend.pdf")
ggsave(filename = Nintendo_Trend_path, plot = Nintendo_trend, device = "pdf",
       width = 8, height = 5, family = "Japan1")


#get Local trend model prediction
Nintendo_pre <- result[[3]][[2]]
days <- 50
Nintendo_df <- data.frame("t" = seq(1,days,1),
                          "real" = data$Nintendo[1:days],
                          "pred" = c(rep(NA, days-10), Nintendo_pre[,1]),
                          "upper" = c(rep(NA, days-10), Nintendo_pre[,3]),
                          "lower" = c(rep(NA, days-10), Nintendo_pre[,2]))

Nintendo_Localtrend <- ggplot(data = Nintendo_df, mapping = aes(x = t)) +
  geom_line(aes(y = real, linetype = "real") , data = Nintendo_df) +
  geom_line(aes(y = pred, linetype = "pred"), data = Nintendo_df) +
  geom_line(aes(y = upper, linetype = "upper"), data = Nintendo_df) +
  geom_line(aes(y = lower, linetype = "lower"), data = Nintendo_df) +
  scale_linetype_manual(values = c("real" = "solid", "pred" ="dashed",
                                   "upper" ="dotted", "lower" ="dotted")) + 
  theme_classic() + 
  ylab("株価")+
  xlab("time")

Nintendo_LocalTrend_path <- here::here("04_report","Prediction","output","Nintendo_LocalTrend.pdf")
ggsave(filename = Nintendo_LocalTrend_path, plot = Nintendo_Localtrend, device = "pdf",
       width = 8, height = 5, family = "Japan1")
