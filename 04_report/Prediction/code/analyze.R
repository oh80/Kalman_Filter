#read data
path <- here::here("02_build","data","stock.obj")
data <- readRDS(path)

long_path <- here::here("02_build","data","stock_long.obj")
long_data <- readRDS(long_path)

library(KFAS)

#Regression 
mod_Nintendo <- SSModel(data$Nintendo_rate
                        ~ SSMregression(~data$Topix_rate, Q = NA),H = NA)
fit_Nintendo <- fitSSM(mod_Nintendo, numeric(2), method = "BFGS")
kfs_Nintendo <- KFS(fit_Nintendo$model)

mod_Tokyo <- SSModel(data$Tokyo_denryoku_rate
                        ~ SSMregression(~data$Topix_rate, Q = NA),H = NA)
fit_Tokyo <- fitSSM(mod_Tokyo, numeric(2), method = "BFGS")
kfs_Tokyo <- KFS(fit_Tokyo$model)

#long time Regression 
long_mod_Nintendo <- SSModel(long_data$Nintendo_rate
                        ~ SSMregression(~long_data$Topix_rate, Q = NA),H = NA)
long_fit_Nintendo <- fitSSM(long_mod_Nintendo, numeric(2), method = "BFGS")
long_kfs_Nintendo <- KFS(long_fit_Nintendo$model)

long_mod_Tokyo <- SSModel(long_data$Tokyo_denryoku_rate
                     ~ SSMregression(~long_data$Topix_rate, Q = NA),H = NA)
long_fit_Tokyo <- fitSSM(long_mod_Tokyo, numeric(2), method = "BFGS")
long_kfs_Tokyo <- KFS(long_fit_Tokyo$model)


#save result
result <- list(kfs_Nintendo, kfs_Tokyo, long_kfs_Nintendo, long_kfs_Tokyo)
path <- here::here("03_analyze", "Regression", "output", "result.obj")
saveRDS(result, path)
