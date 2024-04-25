### ANALYIS OF THE HYPOTHESIS
## v1_17.04.2024


setwd("C:/Users/franc/Desktop/DataAnalysis/04_Analysis")
rm(list=ls())

# Load necessary library
library(tidyverse)
library(psych)
library(car)
library(skimr)
library(rstatix)
library(lmtest)
library(lavaan)
library(semTools)
library(semPlot)

# Load data
data <- read.csv('data_merged_all_R.csv')

# Descriptives
summary(data)
describeBy(data, skew = FALSE, range = FALSE)
#skim(data)


## Hypo 1a

# Summary statistics for relevant columns
summary(data[, c("JC1IStR", "JC1HRJD", "JC2IStR", "JC2HRJD")])

# Visual Analysis with Boxplot
boxplot(data$JC1IStR, data$JC2IStR, names = c("Control", "Experimental"), main = "Job Crafting Scores IStR")
boxplot(data$JC1HRJD, data$JC2HRJD, names = c("Control", "Experimental"), main = "Job Crafting Scores HRJD")


# Calculate the differences in Job Crafting between the conditions
data <- data %>%
  mutate(Diff_JC_IStR = JC2IStR - JC1IStR,
         Diff_JC_HRJD = JC2HRJD - JC1HRJD)

# Shapiro-Wilk test for normality
# On Differences
shapiro.test(data$Diff_JC_IStR) # -> Data has normal distribution
shapiro.test(data$Diff_JC_HRJD) # -> Data has normal distribution
# On each construct
shapiro.test(data$JC1IStR) # -> Data has normal distribution
shapiro.test(data$JC2IStR) # -> Data has normal distribution
shapiro.test(data$JC1HRJD) # -> Data has normal distribution
shapiro.test(data$JC2HRJD) # -> Data has NOT normal distribution
# -> Use both, parametric tests (t-tests) or non-parametric tests (Wilcoxon signed-rank tests), for more robustness

# Levene’s test for homogeneity of variances
leveneTest(data$JC1IStR, data$JC2IStR, data = data) # -> Insignificant (no Welch’s t-test needed)
leveneTest(data$JC1HRJD, data$JC2HRJD, data = data) # -> Insignificant (no Welch’s t-test needed)


# Paired Sample T-test for the ISTR
t_test_IStR <- t.test(data$JC2IStR, data$JC1IStR, paired = TRUE, alternative = "greater")
print(t_test_IStR)

# Calculate Cohen’s d for t-tests to measure the effect size fro ISTR 
d_ISTR <- mean(data$JC2IStR - data$JC1IStR) / sd(data$JC2IStR - data$JC1IStR)
effect_size_IStR <- list(cohens_d = d_ISTR)
print(effect_size_IStR) # Not relevant as not significant

# Paired Sample T-test for the HRJD
t_test_HRJD <- t.test(data$JC2HRJD, data$JC1HRJD, paired = TRUE, alternative = "greater")
print(t_test_HRJD) # -> Not significant

# Calculate Cohen’s d for t-tests to measure the effect size fro HRJD
d_HRJD <- mean(data$JC2HRJD - data$JC1HRJD) / sd(data$JC2HRJD - data$JC1HRJD)
effect_size_HRJD <- list(cohens_d = d_HRJD)
print(effect_size_HRJD)# -> Significant difference

# Wilcoxon signed-rank test for ISTR
w_test_ISTR <- wilcox.test(data$JC2IStR, data$JC1IStR, paired = TRUE, alternative = "greater")
print(w_test_ISTR) # -> Not significant

# Wilcoxon signed-rank test for HRJD
w_test_HRJD <- wilcox.test(data$JC2HRJD, data$JC1HRJD, paired = TRUE, alternative = "greater")
print(w_test_HRJD) # -> Significant difference


## Hypo 1b

# Welch's t-test for unequal variances
t.test(data$JC2HRJD ~ data$Prompt_Support, data = data, var.equal = FALSE)


## Hypo 2a and 2b

# Visual Analysis
pairs(data[, c("SDT1AUT", "SDT1COM", "SDT2AUT", "SDT2COM", "JC1IStR", "JC2IStR")])
boxplot(data$SDT1AUT, data$SDT2AUT,  names = c("AUT1", "AUT2"), main = "Autonomy Needs Level Scores")
boxplot(data$SDT1COM, data$SDT2COM, names = c("COM1", "COM2"), main = "Competence Needs Level Scores")

# Calculate the differences in SDT between the conditions
data <- data %>% mutate(
  Diff_AUT = SDT2AUT - SDT1AUT,
  Diff_COM = SDT2COM - SDT1COM
)

# Shapiro-Wilk test for normality
# On Differences
shapiro.test(data$Diff_AUT) # -> Data has NOT normal distribution
shapiro.test(data$Diff_COM) # -> Data has NOT normal distribution
# On each construct
shapiro.test(data$SDT1AUT) # -> Data has NOT normal distribution
shapiro.test(data$SDT2AUT) # -> Data has NOT normal distribution
shapiro.test(data$SDT1COM) # -> Data has NOT normal distribution
shapiro.test(data$SDT2COM) # -> Data has NOT normal distribution

# Levene’s test for homogeneity of variances
leveneTest(data$SDT1AUT, data$SDT2AUT, data = data) # -> Insignificant (no Welch’s t-test needed)
leveneTest(data$SDT1COM, data$SDT2COM, data = data) # -> Insignificant (no Welch’s t-test needed)


# Paired Sample T-test for the AUT
t_test_AUT <- t.test(data$SDT2AUT, data$SDT1AUT, paired = TRUE, alternative = "greater")
print(t_test_AUT) # -> Not significant

# Paired Sample T-test for the COM
t_test_COM <- t.test(data$SDT2COM, data$SDT1COM, paired = TRUE, alternative = "greater")
print(t_test_COM) # -> Significant difference

# Wilcoxon signed-rank test for AUT
w_test_AUT <- wilcox.test(data$SDT2AUT, data$SDT1AUT, paired = TRUE, alternative = "greater")
print(w_test_AUT) # -> Not significant

# Wilcoxon signed-rank test for COM
w_test_COM <- wilcox.test(data$SDT2COM, data$SDT1COM, paired = TRUE, alternative = "greater")
print(w_test_COM) # -> Significant difference

# Regression analysis
linear_model_AUT <- lm(Diff_JC_IStR ~ Diff_AUT + Diff_COM, data = data)
summary(linear_model_AUT)
linear_model_COM <- lm(Diff_JC_HRJD ~ Diff_AUT + Diff_COM, data = data)
summary(linear_model_COM)
        

## Hypo 3a-e

# Visual Analysis
pairs(data[, c("NEOE", "NEOA", "NEOC", "NEON", "NEOO", "JC2IStR", "JC2HRJD")])

# Normality test on the predicted values
data$predicted_JC2IStR <- lm(JC2IStR ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data)$fitted.values
shapiro.test(data$predicted_JC2IStR)
data$predicted_JC2HRJD <- lm(JC2HRJD ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data)$fitted.values
shapiro.test(data$predicted_JC2HRJD)

# VIF to check multicollinearity
vif(lm(JC2IStR ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data))
vif(lm(JC2HRJD ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data))

