#read data
path <- here::here("02_build","data","stock.obj")
data <- readRDS(path)

library(KFAS)

#Local level model
mod_Local_Nintendo <- SSModel(data$Nintendo[1:40] ~ SSMtrend(1, Q = NA), H = NA)
fit_Local_Nintendo <- fitSSM(mod_Local_Nintendo, numeric(2), method = "BFGS")
conf_Local_Nintendo <- predict(fit_Local_Nintendo$model, interval ="confidence", n.ahead = 10)
pre_Local_Nintendo <- predict(fit_Local_Nintendo$model, interval ="prediction", n.ahead = 10)

mod_Local_Tokyo <- SSModel(data$Tokyo_denryoku[1:40] ~ SSMtrend(1, Q = NA), H = NA)
fit_Local_Tokyo <- fitSSM(mod_Local_Tokyo, numeric(2), method = "BFGS")
conf_Local_Tokyo <- predict(fit_Local_Tokyo$model, interval ="confidence", n.ahead = 10)
pre_Local_Tokyo <- predict(fit_Local_Tokyo$model, interval ="prediction", n.ahead = 10)

mod_Local_Topix <- SSModel(data$Topix[1:40] ~ SSMtrend(1, Q = NA), H = NA)
fit_Local_Topix <- fitSSM(mod_Local_Topix, numeric(2), method = "BFGS")
conf_Local_Topix <- predict(fit_Local_Topix$model, interval ="confidence", n.ahead = 10)
pre_Local_Topix <- predict(fit_Local_Topix$model, interval ="prediction", n.ahead = 10)

Local <- list(conf_Local_Nintendo, pre_Local_Nintendo, conf_Local_Tokyo,
              pre_Local_Tokyo, conf_Local_Topix, pre_Local_Topix)


#Trend  model
mod_Trend_Nintendo <- SSModel(data$Nintendo[1:40] ~ SSMtrend(2, Q = c(list(0), list(NA))), H = NA)
fit_Trend_Nintendo <- fitSSM(mod_Trend_Nintendo, numeric(2), method = "BFGS")
conf_Trend_Nintendo <- predict(fit_Trend_Nintendo$model, interval ="confidence", n.ahead = 10)
pre_Trend_Nintendo <- predict(fit_Trend_Nintendo$model, interval ="prediction", n.ahead = 10)

mod_Trend_Tokyo <- SSModel(data$Tokyo_denryoku[1:40] ~ SSMtrend(2, Q = c(list(0), list(NA))), H = NA)
fit_Trend_Tokyo <- fitSSM(mod_Trend_Tokyo, numeric(2), method = "BFGS")
conf_Trend_Tokyo <- predict(fit_Trend_Tokyo$model, interval ="confidence", n.ahead = 10)
pre_Trend_Tokyo <- predict(fit_Trend_Tokyo$model, interval ="prediction", n.ahead = 10)

mod_Trend_Topix <- SSModel(data$Topix[1:40] ~ SSMtrend(2, Q = c(list(0), list(NA))), H = NA)
fit_Trend_Topix <- fitSSM(mod_Trend_Topix, numeric(2), method = "BFGS")
conf_Trend_Topix <- predict(fit_Trend_Topix$model, interval ="confidence", n.ahead = 10)
pre_Trend_Topix <- predict(fit_Trend_Topix$model, interval ="prediction", n.ahead = 10)

Trend <- list(conf_Trend_Nintendo, pre_Trend_Nintendo, conf_Trend_Tokyo,
              pre_Trend_Tokyo, conf_Trend_Topix, pre_Trend_Topix)


#Trend Component model
mod_LocalTrend_Nintendo <- SSModel(data$Nintendo[1:40] ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Nintendo <- fitSSM(mod_LocalTrend_Nintendo, numeric(3), method = "BFGS")
conf_LocalTrend_Nintendo <- predict(fit_LocalTrend_Nintendo$model, interval ="confidence", n.ahead = 10)
pre_LocalTrend_Nintendo <- predict(fit_LocalTrend_Nintendo$model, interval ="prediction", n.ahead = 10)

mod_LocalTrend_Tokyo <- SSModel(data$Tokyo_denryoku[1:40] ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Tokyo <- fitSSM(mod_LocalTrend_Tokyo, numeric(3), method = "BFGS")
conf_LocalTrend_Tokyo <- predict(fit_LocalTrend_Tokyo$model, interval ="confidence", n.ahead = 10)
pre_LocalTrend_Tokyo <- predict(fit_LocalTrend_Tokyo$model, interval ="prediction", n.ahead = 10)

mod_LocalTrend_Topix <- SSModel(data$Topix[1:40] ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Topix <- fitSSM(mod_LocalTrend_Topix, numeric(3), method = "BFGS")
conf_LocalTrend_Topix <- predict(fit_LocalTrend_Topix$model, interval ="confidence", n.ahead = 10)
pre_LocalTrend_Topix <- predict(fit_LocalTrend_Topix$model, interval ="prediction", n.ahead = 10)

LocalTrend <- list(conf_LocalTrend_Nintendo, pre_LocalTrend_Nintendo, conf_LocalTrend_Tokyo,
              pre_LocalTrend_Tokyo, conf_LocalTrend_Topix, pre_LocalTrend_Topix)


#save results
results <- list(Local, Trend, LocalTrend)
path <- here::here("03_analyze", "Prediction", "output", "results.obj")
saveRDS(results, path)