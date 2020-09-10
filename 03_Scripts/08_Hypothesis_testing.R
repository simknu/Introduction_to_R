
# -----------------------------------------------------------------------------
# Title: Hypothesis testing

# Description: Short introduction to hypothesis testing and linear models in R.
#  This script shows some commands that can be used for hypothesis testing 
#  or linear models, but it does not give the statistical background to these 
#  functions. Please refer to statistical help for this.
#  1) General workflow
#  2) Two sample tests
#  3) Linear models

# Author: Simon Knüsel, based on scripts of Jan Wunder

# Copyright: © Jan Wunder (2016)

# Date: 2020-09-20
# -----------------------------------------------------------------------------


# Load data --------------------
data(airquality)
head(airquality)


# 1) General workflow --------------------
#    1. Formulate hypothesis
#    2. Perform the experiment / Collect data
#    3. Explore data
#    4. Test hypothesis with appropriate test (check test assumptions!)


# 2) Two sample tests --------------------

# Test whether two group means are the same


# Two sample t-test ------

# Test assumptions: 
# i) independent groups (paired = FALSE): data is normally distributed
#    (+ equal variances)
# ii) dependent groups (paired = TRUE): data is normally distributed

#    1. Null Hypothesis: Basketball players are as tall as other people
#    2. Collect data
basketball <- c(196, 195, 213, 170, 197, 204, 220, 210, 197) # height in cm
other <- c(183, 179, 174, 172, 193, 163, 183, 201, 181) # height in cm

#    3. Explore data
boxplot(basketball, other, names = c("Basketball", "Other"))

#    4. Test hypothesis (two sample t-test, independent groups)
t.test(x = basketball, y = other, alternative = "two.sided", paired = FALSE)

# Check test assumptions
qqnorm(basketball)
qqline(basketball)
qqnorm(other)
qqline(other)
# Influence of sample size
basketball_small <- rnorm(n = 10) # randomly sample from normal distribution
qqnorm(basketball_small)
qqline(basketball_small)

basketball_large <- rnorm(n = 1000)
qqnorm(basketball_large)
qqline(basketball_large)


# Wilcoxon test ------

# Test assumptions: 
# i) independent groups (paired = FALSE): groups have the same distribution
# ii) dependent groups (paired = TRUE): groups have the same distribution

#    4. Test hypothesis (wilcoxon text, independent groups)
wilcox.test(x = basketball, y = other, alternative = "two.sided", 
            paired = FALSE)


# 3) Linear models --------------------

# Relationship between wind and temperature
plot(data = airquality, Wind ~ Temp)

linear_model <- lm(data = airquality, Wind ~ Temp)
summary(linear_model)

# add linear model to plot
abline(linear_model, col = "blue")

# diagnostic plots
plot(linear_model)
?plot.lm # more information on the diagnostic plots

