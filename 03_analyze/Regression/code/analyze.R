#read data
data_path <- here::here("02_build","data","stock.obj")
data <- readRDS(data_path)

long_data_path <- here::here("02_build","data","stock_long.obj")
long_data <- readRDS(long_data_path)

library(KFAS)


#Regression
mod_Nintendo <- SSModel(data$Nintendo_rate ~ 
                          SSMregression( ~ data$Topix_rate, Q =NA), H = NA)
fit_Nintendo <- fitSSM(mod_Nintendo, numeric(2), method = "BFGS")
kfs_Nintendo <- KFS(fit_Nintendo$model)

mod_Tokyo <- SSModel(data$Tokyo_denryoku_rate ~ 
                          SSMregression( ~ data$Topix_rate, Q =NA), H = NA)
fit_Tokyo <- fitSSM(mod_Tokyo, numeric(2), method = "BFGS")
kfs_Tokyo <- KFS(fit_Tokyo$model)


#long data Regression
mod_Nintendo_long <- SSModel(long_data$Nintendo_rate ~ 
                          SSMregression( ~ long_data$Topix_rate, Q =NA), H = NA)
fit_Nintendo_long <- fitSSM(mod_Nintendo_long, numeric(2), method = "BFGS")
kfs_Nintendo_long <- KFS(fit_Nintendo_long$model)

mod_Tokyo_long <- SSModel(long_data$Tokyo_denryoku_rate ~ 
                       SSMregression( ~ long_data$Topix_rate, Q =NA), H = NA)
fit_Tokyo_long <- fitSSM(mod_Tokyo_long, numeric(2), method = "BFGS")
kfs_Tokyo_long <- KFS(fit_Tokyo_long$model)

result <- list(kfs_Nintendo, kfs_Tokyo, kfs_Nintendo_long, kfs_Tokyo_long)


#save result
path <- here::here("03_analyze", "Regression", "output", "result.obj")
saveRDS(result, path)