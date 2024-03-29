# Load necessary libraries
library(lavaan)
library(semTools)

# Load your dataset
data <- read.csv("path_to_your_dataset.csv")

# Define your CFA model
# Replace 'itemX' with actual item names according to your constructs
model_spec <- '
JobCrafting =~ jc1 + jc2 + jc3 + jc4
Openness =~ open1 + open2 + open3 + open4
Conscientiousness =~ consc1 + consc2 + consc3 + consc4
Extraversion =~ extra1 + extra2 + extra3 + extra4
Agreeableness =~ agree1 + agree2 + agree3 + agree4
Neuroticism =~ neuro1 + neuro2 + neuro3 + neuro4
GenAIUse =~ gai1 + gai2 + gai3 + gai4
'

# Fit the CFA model to your data
fit <- cfa(model_spec, data=data, estimator="MLR")

# Calculate and display Cronbach's Alpha for each construct
# Note: `reliability` function from semTools automatically calculates Cronbach's Alpha
alpha_results <- reliability(fit)
cat("Cronbach's Alpha for each construct:\n")
print(alpha_results$alpha)

# Calculate and display Composite Reliability (CR) for each construct
# `reliability` function with type="composites" calculates CR among other reliability estimates
cr_results <- reliability(fit, type = "composites")
cat("\nComposite Reliability (CR) for each construct:\n")
print(cr_results$composites)

# Note: Ensure that your 'model_spec' accurately reflects the structure and items of your constructs.
# Adjust item names and constructs as per your actual dataset.
