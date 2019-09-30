
# Hypothesis testing ----------------------------------------------------------

# Source: Introcuction to R by Jan Wunder (© Jan Wunder, 2016)


# General workflow ----------
# 1. Formulate hypothesis
# 2. Perform the experiment / Collect data
# 3. Explore data
# 4. Test hypothesis with appropriate test (check test assumptions!)


# Prepare workspace ----------
#setwd("path_to_your_working_directory") # replace with your working directory
#rm(list = ls())


# Two sample tests ------------------------------------------------------------
# Test whether two group means are the same

# Two sample t-test ----------
# Test assumptions: 
# i) independent groups (paired = FALSE): data is normally distributed
#    (+ equal variances)
# ii) dependent groups (paired = TRUE): data is normally distributed


# 1. Null Hypothesis: Basketball players are as tall as other people

# 2. Collect data
basketball <- c(196, 195, 213, 170, 197, 204, 220, 210, 197) # height in cm
other <- c(183, 179, 174, 172, 193, 163, 183, 201, 181) # height in cm

# 3. Explore data
boxplot(basketball, other, names = c("Basketball", "Other"))

# 4. Test hypothesis (two sample t-test, independent groups)
t.test(x = basketball, y = other, alternative = "two.sided", paired = FALSE)

# Check test assumptions
qqnorm(basketball)
qqline(basketball)
qqnorm(other)
qqline(other)
# influence of sample size
qqnorm(rnorm(10)) # sample 10 observations from normal distribution
qqline(rnorm(10))
qqnorm(rnorm(1000)) # sample 1000 observations from normal distribution
qqline(rnorm(1000))


# Wilcoxon test ----------
# Test assumptions: 
# i) independent groups (paired = FALSE): groups have the same distribution
# ii) dependent groups (paired = TRUE): groups have the same distribution

# 4. Test hypothesis (wilcoxon text, independent groups)
wilcox.test(x = basketball, y = other, alternative = "two.sided", 
            paired = FALSE)



# Linear models ---------------------------------------------------------------

# Load data
data("airquality")
head(airquality)

# Relationship between wind and temperature
plot(data = airquality, Wind ~ Temp)

linear_model <- lm(data = airquality, Wind ~ Temp)
summary(linear_model)

# add linear model to plot
abline(linear_model, col = "blue")

# diagnostic plots
plot(linear_model)
?plot.lm

