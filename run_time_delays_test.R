library(cmdstanr)

data <- read.csv("data_test.csv")

data <- data - min(data)
# data <- data[1:10,]
data.list <- list(
  a_minus = data$event1,
  a_plus = data$event1 + 1,
  b_minus = data$event2,
  b_plus = data$event2 + 1,
  N = nrow(data),
  incubation = 0,
  upper_bound = max(data$event2),
  r = 0.1
)

mod_full <- cmdstan_model(file.path("time_delays_full.stan"))
mod_multi_mid_point <- cmdstan_model(
  file.path("time_delays_multi_midpoint.stan")
)

fit_full <- mod_full$sample(
  data = data.list,
  seed = 1,
  chains = 1,
  parallel_chains = 1,
  # num_samples = 20,            # total number of iterations per chain
  refresh = 50 # print update every 500 iters
)

fit_multi_mid_point <- mod_multi_mid_point$sample(
  data = data.list,
  seed = 1,
  chains = 1,
  parallel_chains = 1,
  # num_samples = 20,            # total number of iterations per chain
  refresh = 50 # print update every 500 iters
)
