# Load necessary libraries
library(lavaan)
library(semTools) # For reliability and validity analysis
library(psych) # For additional psychometric analysis

# Assuming your data is loaded into 'data'
data <- read.csv("path_to_your_data.csv")

# 1. Construct Validity with Confirmatory Factor Analysis (CFA)

# Define the CFA model - replace 'itemX' with actual item names
cfa_model <- '
GenAI =~ item1 + item2 + item3
JobCrafting =~ item4 + item5 + item6
BigFiveOpenness =~ item7 + item8 + item9
BigFiveConscientiousness =~ item10 + item11 + item12
BigFiveExtraversion =~ item13 + item14 + item15
BigFiveAgreeableness =~ item16 + item17 + item18
BigFiveNeuroticism =~ item19 + item20 + item21
'

# Fit the CFA model to your data
cfa_fit <- cfa(model = cfa_model, data = data, std.lv=TRUE, estimator = "MLR")

# Summary of the CFA model fit, including factor loadings and fit indices
summary(cfa_fit, fit.measures = TRUE, standardized = TRUE)

# 2. Convergent and Discriminant Validity
# Calculate and report AVE for convergent validity
# and use the Fornell-Larcker criterion for discriminant validity

# Calculate AVE, composite reliability (CR), and the Fornell-Larcker criterion
# Note: semTools::reliability() function calculates these metrics
validity_results <- reliability(cfa_fit, type = "ave")

# View the convergent and discriminant validity results
print(validity_results)

# 3. Criterion Validity

# For criterion validity, using regression analysis as an example
# Assuming 'JobSatisfaction' is the criterion variable, and you're testing 'BigFiveOpenness'

# Prepare data: Assuming 'BigFiveOpenness' scores need to be calculated from factor scores
data$BigFiveOpenness <- predict(cfa_fit, type = "scores")$BigFiveOpenness

lm_fit <- lm(JobSatisfaction ~ BigFiveOpenness, data = data)

# Summary of the regression model for criterion validity
summary(lm_fit)

# Note: Ensure that 'itemX', 'JobSatisfaction', and 'path_to_your_data.csv' are replaced with your actual item names, criterion variable name, and dataset path.
