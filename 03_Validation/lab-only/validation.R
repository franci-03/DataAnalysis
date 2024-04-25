### CFA VALIDATION OF CONSTRUCTS
## v1_16.04.2024


setwd("C:/Users/franc/Desktop/DataAnalysis/03_Validation")
rm(list=ls())

# Load necessary libraries
library(lavaan)
library(semTools)
library(psych)

# Load data
data <- read.csv("data_merged_all_validation.csv")


## Preliminary tests

# Exclude non-numeric columns
numeric_data <- data[sapply(data, is.numeric)]

# Calculate the correlation matrix
cor_matrix <- cor(numeric_data)

# Calculate the Kaiser-Meyer-Olkin Measure of Sampling Adequacy
kmo_results <- KMO(numeric_data)
print(kmo_results)

# Perform Bartlett’s Test of Sphericity
bartlett_results <- cortest.bartlett(cor_matrix)
print(bartlett_results)


## CFA

# Confirmatory Factor Analysis Model Specification
cfa_model <- '
NEO_N =~ NEON1 + NEON2R + NEON3 + NEON4
'

# Fit the CFA model
cfa_fit <- cfa(model = cfa_model, data = data, std.lv=TRUE, estimator = "MLR")

# Summary of the CFA model fit, including factor loadings and fit indices
summary(cfa_fit, fit.measures = TRUE, standardized = TRUE)


## Calculate Metrics

# Cronbach's Alpha for each construct
psych::alpha(cbind(data$NEON1, data$NEON2R, data$NEON3, data$NEON4), check.keys=TRUE)

# Composite Reliabilities
compRelSEM(cfa_fit_boot)

# Average Variance Extracted:
AVE(cfa_fit)

# Discriminant Validity to calculate AVE and apply the Fornell-Larcker criterion
discriminantValidity(cfa_fit, cutoff = 0.9, merge = FALSE, level = 0.95)

