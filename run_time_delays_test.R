

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
  r = 0
)



file <- file.path("time_delays_full.stan")
file <- file.path("time_delays_multi_midpoint.stan")

mod <- cmdstan_model(file)

fit <- mod$sample(
  data = data.list,
  seed = 1,
  chains = 1,
  parallel_chains = 1,
  # num_samples = 20,            # total number of iterations per chain
  refresh = 50 # print update every 500 iters
)
