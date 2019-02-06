## Set Seed
set.seed(1)

## Define Parameters
n = 10000
p = 40
var.matrix <- diag(p)
cor.base <- 0.40
strong.beta <- 10
weak.beta <- 1

## Create Correlation Matrix
var.matrix[1, 31:40] <- cor.base
var.matrix[31:40, 1] <- cor.base


## Generate Data
X <- mvrnorm(n = n, mu = rep(0, p) , Sigma = var.matrix, empirical = F,
             tol = 0.2)


## Check step
test <- cov(data)

## Create Betas
b.true <- c(rep(strong.beta,10),rep(weak.beta,10),rep(0,10), rep(weak.beta,10))

## Generate outcome

Y <- 1 + X %*% b.true + rnorm(n)
df <- data.frame(cbind(X, Y))
names(df)[p + 1] <- "y"
