

a=1:10
median(a)
x=5
alex_mean = function(x){
  
  l_alex_mean =sum(x)/length(x)
  return(l_alex_mean)
}
y = length(x)
z = round(y)
y=1:10
y = length(y)

central_item = round(length(x)/2)

A = c(5,3,0,3,4)
B = 1:5
diff_A = A - mean(A)
diff_B = B - mean(B)
cov = sum(diff_A*diff_B)/(length(A)-1)

sd_A = sqrt(sum(diff_A^2)/(length(diff_A)-1))
sd_B = sqrt(sum(diff_B^2)/(length(diff_B)-1))
corelation = cov/(sd_A*sd_B)
corelation
cor(A,B)
cor(A,A*(-1))
rnorm(10)
cor(rnorm(10),rnorm(10))
R2 = cor(A,B)^2


y <- c( 109.14, 117.55, 106.76, 115.26, 117.13, 125.39, 121.03, 114.03, 124.83, 113.92, 122.04, 109.41, 131.61, 103.93, 116.64, 117.06, 111.73, 120.41, 112.98, 101.20, 120.19, 128.53, 120.14, 108.70, 130.77, 110.16, 129.07, 123.46, 130.02, 130.31, 135.06, 129.17, 137.08, 107.62, 139.77, 121.47, 130.95, 138.15, 114.31, 134.58, 135.86, 138.49, 110.01, 127.80, 122.57, 136.99, 139.53, 127.34, 132.26, 120.85, 124.99, 133.36, 142.46, 123.58, 145.05, 127.83, 140.42, 149.64, 151.01, 135.69, 138.25, 127.24, 135.55, 142.76, 146.67, 146.33, 137.00, 145.00, 143.98, 143.81, 159.92, 160.97, 157.45, 145.68, 129.98, 137.45, 151.22, 136.10, 150.60, 148.79, 167.93, 160.85, 146.28, 145.97, 135.59, 156.62, 153.12, 165.96, 160.94, 168.87, 167.64, 154.64, 152.46, 149.03, 159.56, 149.31, 153.56, 170.87, 163.52, 150.97)

c(mean(y), sd(y))
shapiro.test(y)

library(ggplot2)
ggplot(data = data.frame(y), aes(x = y)) + geom_histogram() +  ylab("Frequency") + xlab("Pressure , mm. Hg")


set.seed(101) # for reproducible result
y.new.1 <- rnorm(n = 100, mean = 135.16, sd = 16.96)

set.seed(101)
y.new.2 <- 135.16 + rnorm(n = 100, mean = 0, sd = 16.96)
all(y.new.1 == y.new.2)
y.lm <- lm(y ~ 1)
summary(y.lm)
library(arm)
set.seed(102) # for reproducible result
y.sim <- sim(y.lm, 5)
y.sim@coef
y.sim@sigma
set.seed(102) # for reproducible result
y.sim <- sim(y.lm, 1000)
y.rep <- array(NA, c(1000, 100))
# Filling matrix y.rep imitated data:
for(s in 1:1000){
  y.rep[s, ] <- rnorm(100, y.sim@coef[s], y.sim@sigma[s])
}
par(mfrow = c(5, 4), mar = c(2, 2, 1, 1))
for(s in 1: 12){ hist(y.rep[s, ], xlab = "", ylab = "", breaks = 20, main = "")}

test.IQR <- apply(y.rep, MARGIN = 1, FUN = IQR)

par(mfrow = c(1, 1), mar = c(5, 5, 5, 5))

hist(test.IQR, xlim = range(IQR(y), test.IQR), main = "IQR", xlab = "", ylab = "Frequency", breaks = 20) 
lines(rep(IQR(y), 2), c(0, 100), col = "blue", lwd = 4)

#Suppose that in addition to blood pressure, we also measured each the subject of his/her age (in years). Show graphically the relationship between age and systolic blood pressure. For visualization the trend in the data and add the regression line is blue:

# The values of age:
x <- rep(seq(16, 65, 1), each = 2)
# Combine the values of age and blood pressure in one table
Data <- data.frame(Age = x, BP = y)
ggplot(data = Data, aes(x = Age, BP)) + geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_rug(color = "gray70", sides = "tr") +
  ylab("Frequency") + xlab("Age, years")

summary(lm(BP ~ Age, data = Data))

#yi = 94.853 + 0.995 × Agei + ϵi, ϵi=N( of 0,8.953) 


library(ggplot2)
library(dplyr)
options(stringsAsFactors = FALSE)
wages <- read.csv("https://dl.dropboxusercontent.com/s/oq4dc134y8xdyce/wages.csv?dl=0")

tbl_df(wages)

crime <- read.csv("https://dl.dropboxusercontent.com/s/cecck1nuo217zy1/crime.csv?dl=0")

tbl_df(crime)


#In statistics the most appropriate to consider this direct, residual sum of squares(residuals) of which will be minimal. Remains know the vertical distance from each data point to the nearest point of the line or Residuals=yi−f(xi)Residuals=yi−f(xi), their other name is rejection. Because each residue can be a great sign, and we are interested in the absolute value of all the residues, as each of them essentially characterizes the accuracy of the model, it summed up not remnants themselves and their squares. Thus, the final resulting quality model value will be called the residauls square sum (RSS) and will have the form RSS=Σ(yi−f(xi))^2


mod = lm(tc2009 ~ low, data = crime)
summary(mod)
class(mod)
wages$race <- factor(wages$race, 
levels = c("hispanic", "white", "black", "other"))
rmod2 <- lm(earn ~ race, data = wages)
coef(rmod2)
anova(rmod2)






smod <- lm(earn ~ sex, data = wages)
coef(smod)

wages$sex <- factor(wages$sex, 
                    levels = c("male", "female"))
smod <- lm(earn ~ sex, data = wages)
coef(smod)

anova(smod)


m2 <- lm(earn ~ height + sex, data = wages)
m22 <- lm(earn ~ sex + height, data = wages)
coef(m22)
summary(m22)

m3 <- lm(earn ~ height + sex + race + ed + age, data = wages)
coef(m3)
summary(m3)
m3 <- lm(earn ~ . - race, data = wages)
m4 <- lm(earn ~ . - ed, data = wages)
m5 <- lm(earn^2 ~ (height+ sex + ed)^2 -height:ed ,   data = wages)
coef(m4)
summary(m5)
