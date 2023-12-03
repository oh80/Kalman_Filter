#read data
path <- here::here("02_build","data","stock.obj")
data <- readRDS(path)

library(KFAS)

#Local level model
mod_Local_Nintendo <- SSModel(data$Nintendo ~ SSMtrend(1, Q = NA), H = NA)
fit_Local_Nintendo <- fitSSM(mod_Local_Nintendo, numeric(2), method = "BFGS")
ksf_Local_Nintendo <- KFS(fit_Local_Nintendo$model)

mod_Local_Tokyo <- SSModel(data$Tokyo_denryoku ~ SSMtrend(1, Q = NA), H = NA)
fit_Local_Tokyo <- fitSSM(mod_Local_Tokyo, numeric(2), method = "BFGS")
ksf_Local_Tokyo <- KFS(fit_Local_Tokyo$model)

mod_Local_Topix <- SSModel(data$Topix ~ SSMtrend(1, Q = NA), H = NA)
fit_Local_Topix <- fitSSM(mod_Local_Topix, numeric(2), method = "BFGS")
ksf_Local_Topix <- KFS(fit_Local_Topix$model)

Local <- list(ksf_Local_Nintendo, ksf_Local_Tokyo, ksf_Local_Topix)


#Trend Component model
mod_Trend_Nintendo <- SSModel(data$Nintendo ~ SSMtrend(2, Q = c(list(0), list(NA))), H = NA)
fit_Trend_Nintendo <- fitSSM(mod_Trend_Nintendo, numeric(2), method = "BFGS")
ksf_Trend_Nintendo <- KFS(fit_Trend_Nintendo$model)

mod_Trend_Tokyo <- SSModel(data$Tokyo_denryoku ~ SSMtrend(2, Q = c(list(0), list(NA))), H = NA)
fit_Trend_Tokyo <- fitSSM(mod_Trend_Tokyo, numeric(2), method = "BFGS")
ksf_Trend_Tokyo <- KFS(fit_Trend_Tokyo$model)

mod_Trend_Topix <- SSModel(data$Topix ~ SSMtrend(2, Q = c(list(0), list(NA))), H = NA)
fit_Trend_Topix <- fitSSM(mod_Trend_Topix, numeric(2), method = "BFGS")
ksf_Trend_Topix <- KFS(fit_Trend_Topix$model)

Trend <- list(ksf_Trend_Nintendo, ksf_Trend_Tokyo, ksf_Trend_Topix)


#Trend Component model
mod_LocalTrend_Nintendo <- SSModel(data$Nintendo ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Nintendo <- fitSSM(mod_LocalTrend_Nintendo, numeric(3), method = "BFGS")
ksf_LocalTrend_Nintendo <- KFS(fit_LocalTrend_Nintendo$model)

mod_LocalTrend_Tokyo <- SSModel(data$Tokyo_denryoku ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Tokyo <- fitSSM(mod_LocalTrend_Tokyo, numeric(3), method = "BFGS")
ksf_LocalTrend_Tokyo <- KFS(fit_LocalTrend_Tokyo$model)

mod_LocalTrend_Nintendo <- SSModel(data$Nintendo ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Nintendo <- fitSSM(mod_LocalTrend_Nintendo, numeric(3), method = "BFGS")
ksf_LocalTrend_Nintendo <- KFS(fit_LocalTrend_Nintendo$model)

mod_LocalTrend_Topix <- SSModel(data$Topix ~ SSMtrend(2, Q = c(list(NA), list(NA))), H = NA)
fit_LocalTrend_Topix <- fitSSM(mod_LocalTrend_Topix, numeric(3), method = "BFGS")
ksf_LocalTrend_Topix <- KFS(fit_LocalTrend_Topix$model)

LocalTrend <- list(ksf_LocalTrend_Nintendo, ksf_LocalTrend_Tokyo, ksf_LocalTrend_Topix)

#save results
results <- list(Local, Trend, LocalTrend)
path <- here::here("03_analyze", "Trend", "output", "results.obj")
saveRDS(results, path)
