### CFA VALIDATION OF CONSTRUCTS FOR COMPLETE DATASET (LAB AND PROLIFIC)
## v2_19.04.2024


setwd("C:/Users/franc/Desktop/DataAnalysis/03_Validation")
rm(list=ls())

# Load necessary libraries
library(lavaan)
library(semTools)
library(psych)
library(nortest)

# Load data
data <- read.csv("data_merged_all_validation.csv")


## Preliminary tests

# Exclude non-numeric columns
numeric_data <- data[sapply(data, is.numeric)]  

# Assessing normality for numeric columns
normality_tests <- lapply(numeric_data, function(x) shapiro.test(x[1:5000]))
print(normality_tests)

# -> Because some items are not normal and could bias parameters in CFA, we use a robust estimation (MLR)

# Calculate Correlation Matrix for each construct class
ailit_vars <- c("AILiteracyUse1", "AILiteracyUse2", "AILiteracyUse3", "AILiteracyUse4", "AILiteracyUse5", "AILiteracyUse6",
                 "AILiteracyKno1", "AILiteracyKno2", "AILiteracyKno3", "AILiteracyKno4", "AILiteracyKno5", "AILiteracyKno6",
                 "AILiteracyDet1", "AILiteracyDet2", "AILiteracyDet3",
                 "AILiteracyEth1", "AILiteracyEth3")
ailit_data <- data[, ailit_vars]
cor_matrix_ailit <- cor(ailit_data)

gaai_vars <- c("PGATPGAT1", "PGATPGAT2", "PGATPGAT3",
               "NGATNGAT1", "NGATNGAT2", "NGATNGAT3")
gaai_data <- data[, gaai_vars]
cor_matrix_gaai <- cor(gaai_data)

neo_vars <- c("NEOE1R", "NEOE2", "NEOE3R", "NEOE4",
              "NEOV1R", "NEOV2", "NEOV3R", "NEOV4R",
              "NEOG1", "NEOG2R", "NEOG3", "NEOG4",
              "NEON1", "NEON2R", "NEON3", "NEON4",
              "NEOO1", "NEOO2", "NEOO3", "NEOO4", "NEOO5R")
neo_data <- data[, neo_vars]
cor_matrix_neo <- cor(neo_data)

jc_vars <- c("JC1IStR1", "JC1IStR2", "JC1IStR3", "JC1IStR4", "JC1IStR5",
             "JC1HRJD1", "JC1HRJD2", "JC1HRJD3",
             "JC22IStR1", "JC22IStR2", "JC22IStR3", "JC22IStR4", "JC22IStR5",
             "JC22HRJD1", "JC22HRJD2", "JC22HRJD5", "JC22HRJD6")
jc_data <- data[, jc_vars]
cor_matrix_jc <- cor(jc_data)

# Calculate the Kaiser-Meyer-Olkin Measure of Sampling Adequacy
kmo_results1 <- KMO(ailit_data)
print(kmo_results1)

kmo_results2 <- KMO(gaai_data)
print(kmo_results2)

kmo_results3 <- KMO(neo_data)
print(kmo_results3)

kmo_results4 <- KMO(jc_data)
print(kmo_results4)

# Perform Bartlett’s Test of Sphericity
all_vars <- c("AILiteracyUse1", "AILiteracyUse2", "AILiteracyUse3", "AILiteracyUse4", "AILiteracyUse5", "AILiteracyUse6",
                 "AILiteracyKno1", "AILiteracyKno2", "AILiteracyKno3", "AILiteracyKno4", "AILiteracyKno5", "AILiteracyKno6",
                 "AILiteracyDet1", "AILiteracyDet2", "AILiteracyDet3",
                 "AILiteracyEth1", "AILiteracyEth3",
                 "PGATPGAT1", "PGATPGAT2", "PGATPGAT3",
                 "NGATNGAT1", "NGATNGAT2", "NGATNGAT3",
                 "NEOE1R", "NEOE2", "NEOE3R", "NEOE4",
                 "NEOV1R", "NEOV2", "NEOV3R", "NEOV4R",
                 "NEOG1", "NEOG2R", "NEOG3", "NEOG4",
                 "NEON1", "NEON2R", "NEON3", "NEON4",
                 "NEOO1", "NEOO2", "NEOO3", "NEOO4", "NEOO5R",
                 "JC1IStR1", "JC1IStR2", "JC1IStR3", "JC1IStR4", "JC1IStR5",
                 "JC1HRJD1", "JC1HRJD2", "JC1HRJD3",
                 "JC22IStR1", "JC22IStR2", "JC22IStR3", "JC22IStR4", "JC22IStR5",
                 "JC22HRJD1", "JC22HRJD2", "JC22HRJD5", "JC22HRJD6")
all_data <- data[, all_vars]
cor_matrix_all <- cor(all_data)

bartlett_results <- cortest.bartlett(cor_matrix_all)
print(bartlett_results)


## CFA

# Confirmatory Factor Analysis Model Specification AI Literacy
cfa_model_ailit <- '
AILiteracy_Use =~ AILiteracyUse1 + AILiteracyUse2 + AILiteracyUse3 + AILiteracyUse4 + AILiteracyUse5 + AILiteracyUse6
AILiteracy_Kno =~ AILiteracyKno1 + AILiteracyKno2 + AILiteracyKno3 + AILiteracyKno4 + AILiteracyKno5 + AILiteracyKno6
AILiteracy_Det =~ AILiteracyDet1 + AILiteracyDet2 + AILiteracyDet3
AILiteracy_Eth =~ AILiteracyEth1 + AILiteracyEth3
'

# Fit the CFA model and look at summary
cfa_fit1 <- cfa(model = cfa_model_ailit, data = data, estimator = "MLR")
summary(cfa_fit1, fit.measures = TRUE, standardized = TRUE)

# Cronbach's Alpha for each construct
psych::alpha(data[, c("AILiteracyUse1", "AILiteracyUse2", "AILiteracyUse3", 
                      "AILiteracyUse4", "AILiteracyUse5", "AILiteracyUse6")], check.keys=TRUE)

psych::alpha(data[, c("AILiteracyKno1", "AILiteracyKno2", "AILiteracyKno3", 
                      "AILiteracyKno4", "AILiteracyKno5", "AILiteracyKno6")], check.keys=TRUE)

psych::alpha(data[, c("AILiteracyDet1", "AILiteracyDet2", "AILiteracyDet3")], check.keys=TRUE)

psych::alpha(data[, c("AILiteracyEth1", "AILiteracyEth3")], check.keys=TRUE)

# Composite Reliabilities
compRelSEM(cfa_fit1)

# Average Variance Extracted:
AVE(cfa_fit1)

# Discriminant Validity to calculate AVE and apply the Fornell-Larcker criterion
discriminantValidity(cfa_fit1, cutoff = 0.9, merge = FALSE, level = 0.95)


# Confirmatory Factor Analysis Model Specification GAAI
cfa_model_gaai <- '
P_GAT =~ PGATPGAT1 + PGATPGAT2 + PGATPGAT3
N_GAT =~ NGATNGAT1 + NGATNGAT2 + NGATNGAT3
'

# Fit the CFA model and look at summary
cfa_fit2 <- cfa(model = cfa_model_gaai, data = data, estimator = "MLR")
summary(cfa_fit2, fit.measures = TRUE, standardized = TRUE)

# Cronbach's Alpha for each construct
psych::alpha(data[, c("PGATPGAT1",  "PGATPGAT2", "PGATPGAT3")], check.keys=TRUE)

psych::alpha(data[, c("NGATNGAT1", "NGATNGAT2", "NGATNGAT3")], check.keys=TRUE)

# Composite Reliabilities
compRelSEM(cfa_fit2)

# Average Variance Extracted:
AVE(cfa_fit2)

# Discriminant Validity to calculate AVE and apply the Fornell-Larcker criterion
discriminantValidity(cfa_fit2, cutoff = 0.9, merge = FALSE, level = 0.95)


# Confirmatory Factor Analysis Model Specification Big Five (remove NEOV4R because of poor convergence)
cfa_model_neo <- '
NEO_E =~ NEOE1R + NEOE2 + NEOE3R + NEOE4
NEO_A =~ NEOV1R + NEOV2 + NEOV3R + NEOV4R
NEO_C =~ NEOG1 + NEOG2R + NEOG3 + NEOG4
NEO_N =~ NEON1 + NEON2R + NEON3 + NEON4
NEO_O =~ NEOO1 + NEOO2 + NEOO3 + NEOO4 + NEOO5R
'

# Fit the CFA model and look at summary
cfa_fit3 <- cfa(model = cfa_model_neo, data = data, estimator = "MLR")
summary(cfa_fit3, fit.measures = TRUE, standardized = TRUE)

#cfa_fit3 <- cfa(model = cfa_model_neo, data = data, std.lv=TRUE, estimator = "ML", se = "bootstrap", bootstrap = 1000)
#cfa_fit3 <- cfa(model = cfa_model_neo, data = data, ordered = names(data), estimator = "WLSMV")

# Cronbach's Alpha for each construct
psych::alpha(data[, c("NEOE1R", "NEOE2", "NEOE3R", "NEOE4")], check.keys=TRUE)

psych::alpha(data[, c("NEOV1R", "NEOV2", "NEOV3R", "NEOV4R")], check.keys=TRUE)

psych::alpha(data[, c("NEOG1", "NEOG2R", "NEOG3", "NEOG4")], check.keys=TRUE)

psych::alpha(data[, c("NEON1", "NEON2R", "NEON3", "NEON4")], check.keys=TRUE)

psych::alpha(data[, c("NEOO1", "NEOO2", "NEOO3", "NEOO4", "NEOO5R")], check.keys=TRUE)

# Composite Reliabilities
compRelSEM(cfa_fit3)

# Average Variance Extracted:
AVE(cfa_fit3)

# Discriminant Validity to calculate AVE and apply the Fornell-Larcker criterion
discriminantValidity(cfa_fit3, cutoff = 0.9, merge = FALSE, level = 0.95)


# Confirmatory Factor Analysis Model Specification JC1
cfa_model_jc1 <- '
JC1_IStR =~ JC1IStR1 + JC1IStR2 + JC1IStR3 + JC1IStR4 + JC1IStR5
JC1_HRJD =~ JC1HRJD1 + JC1HRJD2 + JC1HRJD3
'

# Fit the CFA model and look at summary
cfa_fit4 <- cfa(model = cfa_model_jc1, data = data, estimator = "MLR")
summary(cfa_fit4, fit.measures = TRUE, standardized = TRUE)

# Cronbach's Alpha for each construct
psych::alpha(data[, c("JC1IStR1", "JC1IStR2", "JC1IStR3", "JC1IStR4", "JC1IStR5")], check.keys=TRUE)

psych::alpha(data[, c("JC1HRJD1", "JC1HRJD2", "JC1HRJD3")], check.keys=TRUE)

# Composite Reliabilities
compRelSEM(cfa_fit4)

# Average Variance Extracted:
AVE(cfa_fit4)

# Discriminant Validity to calculate AVE and apply the Fornell-Larcker criterion
discriminantValidity(cfa_fit4, cutoff = 0.9, merge = FALSE, level = 0.95)


# Confirmatory Factor Analysis Model Specification JC2
cfa_model_jc2 <- '
JC2_IStR =~ JC22IStR1 + JC22IStR2 + JC22IStR3 + JC22IStR4 + JC22IStR5
JC2_HRJD =~ JC22HRJD1 + JC22HRJD2 + JC22HRJD5 + JC22HRJD6
'

# Fit the CFA model and look at summary
cfa_fit5 <- cfa(model = cfa_model_jc2, data = data, estimator = "MLR")
summary(cfa_fit5, fit.measures = TRUE, standardized = TRUE)

# Cronbach's Alpha for each construct
psych::alpha(data[, c("JC22IStR1", "JC22IStR2", "JC22IStR3", "JC22IStR4", "JC22IStR5")], check.keys=TRUE)

psych::alpha(data[, c("JC22HRJD1", "JC22HRJD2", "JC22HRJD5", "JC22HRJD6")], check.keys=TRUE) #remove JC22HRJD6 for better alpha

# Composite Reliabilities
compRelSEM(cfa_fit5) #remove JC22HRJD6 for better CR

# Average Variance Extracted:
AVE(cfa_fit5)

# Discriminant Validity to calculate AVE and apply the Fornell-Larcker criterion
discriminantValidity(cfa_fit5, cutoff = 0.9, merge = FALSE, level = 0.95)


