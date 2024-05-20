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
library(semptools)
library(ggplot2)
library(WebPower)


# Load data
data <- read.csv('data_merged_all_analysis.csv')

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

# Shapiro-Wilk test for normality
shapiro.test(data$JC1IStR) # -> Data has normal distribution
shapiro.test(data$JC2IStR) # -> Data has normal distribution
shapiro.test(data$JC1HRJD) # -> Data has NOT normal distribution
shapiro.test(data$JC2HRJD) # -> Data has NOT normal distribution
# -> Use both, parametric tests (t-tests) or non-parametric tests (Wilcoxon signed-rank tests), for more robustness

# Levene’s test for homogeneity of variances
leveneTest(data$JC1IStR, data$JC2IStR, data = data) # -> Insignificant (no Welch’s t-test needed)
leveneTest(data$JC1HRJD, data$JC2HRJD, data = data) # -> Insignificant (no Welch’s t-test needed)


# Paired Sample T-test for the ISTR
t_test_IStR <- t.test(data$JC2IStR, data$JC1IStR, paired = TRUE, alternative = "two.sided") # or alternative = "greater"
print(t_test_IStR)

# Calculate Cohen’s d for t-tests to measure the effect size fro ISTR 
d_ISTR <- mean(data$JC2IStR - data$JC1IStR) / sd(data$JC2IStR - data$JC1IStR)
effect_size_IStR <- list(cohens_d = d_ISTR)
print(effect_size_IStR)

# Paired Sample T-test for the HRJD
t_test_HRJD <- t.test(data$JC2HRJD, data$JC1HRJD, paired = TRUE, alternative = "two.sided")
print(t_test_HRJD)

# Calculate Cohen’s d for t-tests to measure the effect size fro HRJD
d_HRJD <- mean(data$JC2HRJD - data$JC1HRJD) / sd(data$JC2HRJD - data$JC1HRJD)
effect_size_HRJD <- list(cohens_d = d_HRJD)
print(effect_size_HRJD)

# Wilcoxon signed-rank test for ISTR
w_test_ISTR <- wilcox.test(data$JC2IStR, data$JC1IStR, paired = TRUE, alternative = "two.sided")
print(w_test_ISTR) # 

# Wilcoxon signed-rank test for HRJD
w_test_HRJD <- wilcox.test(data$JC2HRJD, data$JC1HRJD, paired = TRUE, alternative = "two.sided")
print(w_test_HRJD)


## Hypo 1b

# Welch's t-test for unequal variances ISTR
t_test_prompt_IStR <- t.test(data$JC2IStR ~ data$Prompt_Support, data = data, var.equal = FALSE)
print(t_test_prompt_IStR)

# Welch's t-test for unequal variances HRJD
t_test_prompt_HRJD <- t.test(data$JC2HRJD ~ data$Prompt_Support, data = data, var.equal = FALSE)
print(t_test_prompt_HRJD)


## Hypo 2a and 2b

# Summary statistics for relevant columns
summary(data[, c("SDT1AUT", "SDT1COM", "SDT2AUT", "SDT2COM")])

# Visual Analysis
pairs(data[, c("SDT1AUT", "SDT1COM", "SDT2AUT", "SDT2COM", "JC1IStR", "JC2IStR")])
boxplot(data$SDT1AUT, data$SDT2AUT,  names = c("AUT1", "AUT2"), main = "Autonomy Needs Level Scores")
boxplot(data$SDT1COM, data$SDT2COM, names = c("COM1", "COM2"), main = "Competence Needs Level Scores")

# Shapiro-Wilk test for normality
shapiro.test(data$SDT1AUT) # -> Data has NOT normal distribution
shapiro.test(data$SDT2AUT) # -> Data has NOT normal distribution
shapiro.test(data$SDT1COM) # -> Data has NOT normal distribution
shapiro.test(data$SDT2COM) # -> Data has NOT normal distribution

# Levene’s test for homogeneity of variances
leveneTest(data$SDT1AUT, data$SDT2AUT, data = data) # -> Insignificant (no Welch’s t-test needed)
leveneTest(data$SDT1COM, data$SDT2COM, data = data) # -> Insignificant (no Welch’s t-test needed)


# Paired Sample T-test for the AUT
t_test_AUT <- t.test(data$SDT2AUT, data$SDT1AUT, paired = TRUE, alternative = "two.sided")
print(t_test_AUT) 

# Calculate Cohen’s d for t-tests to measure the effect size for AUT 
d_AUT <- mean(data$SDT2AUT - data$SDT1AUT) / sd(data$SDT2AUT - data$SDT1AUT)
effect_size_AUT <- list(cohens_d = d_AUT)
print(effect_size_AUT)

# Paired Sample T-test for the COM
t_test_COM <- t.test(data$SDT2COM, data$SDT1COM, paired = TRUE, alternative = "two.sided")
print(t_test_COM) 

# Calculate Cohen’s d for t-tests to measure the effect size for COM 
d_COM <- mean(data$SDT2COM - data$SDT1COM) / sd(data$SDT2COM - data$SDT1COM)
effect_size_COM <- list(cohens_d = d_COM)
print(effect_size_COM)

# Wilcoxon signed-rank test for AUT
w_test_AUT <- wilcox.test(data$SDT2AUT, data$SDT1AUT, paired = TRUE, alternative = "two.sided")
print(w_test_AUT) 

# Wilcoxon signed-rank test for COM
w_test_COM <- wilcox.test(data$SDT2COM, data$SDT1COM, paired = TRUE, alternative = "two.sided")
print(w_test_COM)


## Hypo 3a-e

# Visual Analysis
pairs(data[, c("NEOE", "NEOA", "NEOC", "NEON", "NEOO", "JC2IStR", "JC2HRJD")], upper.panel=panel.smooth)


## SEM Moderation IStR


# Model with Double Mean Centering (Handling multicollinearity appropriately) -> YT-Video

# Transform AGE to address non-linear relationship
data$AGEsq <- data$AGE^2

# Test model fit without interaction first
model_no_int <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR 

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Control Variables
  JobCraftingExp ~ AGE + AGEsq + WORK + Gender_Männlich + 
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + 
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + PGAT + NGAT
                   
'

# Fit the model
fit_no_int <- sem(model_no_int, data = data, estimator = "MLR")
summary(fit_no_int, fit.measures = TRUE, standardized = TRUE)


# Double Mean Centering the relevant variables to create interaction terms of Big Five with JC2
data_dmc <- indProd(data, var1 = c("JC2IStR"),
                   var2 = c("NEOE", "NEOA", "NEOC", "NEON", "NEOO"),
                   match = FALSE, meanC = TRUE,
                   residualC = FALSE, doubleMC = TRUE)

# Check dataset for interaction terms
head(data_dmc)

# Transform AGE (and WORK) to address non-linear relationship
data_dmc$AGEsq <- data_dmc$AGE^2
#data_dmc$WORKsq <- data_dmc$WORK^2

# Moderation model
model_inter <- '
  # Measurement Model Definitions Latent Constructs
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Moderation Effects
  JobCraftingExp ~ JC2IStR.NEOE + JC2IStR.NEOA + JC2IStR.NEOC + JC2IStR.NEON + JC2IStR.NEOO

  # Control Variables
  JobCraftingExp ~ AGE + AGEsq + WORK + Gender_Männlich +
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + 
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + PGAT + NGAT
  
'

# Fit and summarize the model
fit_inter <- sem(model_inter, data = data_dmc, estimator = "MLR") #fixed.x = FALSE #std.lv= TRUE
summary(fit_inter, fit.measures = TRUE, standardized = TRUE)

# Inspect Measures
fitMeasures(fit_inter, c("cfi", "tli", "rmsea", "srmr"))
lavInspect(fit_inter, "residuals")

# Modification indices (to refine the model)
varTable(fit_inter)
mod_indices <- modificationIndices(fit_inter)
head(mod_indices[order(-mod_indices$mi),])

# Alternativ: Bootstrapping
# fit_inter <- sem(model_inter, data = data_dmc, se = "boot", bootstrap = 5000)
# summary(fit_inter, fit.measures = TRUE, standardized = TRUE, ci = TRUE)


# Post-hoc power analysis

# Perform power analysis
power_result <- wp.sem.rmsea(
  n = 68,         # Sample size
  df = 51,        # Degrees of freedom
  rmsea0 = 0.00,  # RMSEA for H0, set to 0 for exact fit
  rmsea1 = 0.08,  # RMSEA for H1, set near the threshold of poor fit
  power = NULL,   # NULL to calculate the power based on given parameters
  alpha = 0.05,   # Significance level
  type = "close"     
)

# Print the result
print(power_result)


# Probing Interactions

# Calculate mean and standard deviation for NEOE
mean_NEOA <- mean(data_dmc$NEOA, na.rm = TRUE)
sd_NEOA <- sd(data_dmc$NEOA, na.rm = TRUE)

# Calculate interaction term coefficients manually (adjust these based on your actual model output)
interaction_coefficient <- parameterEstimates(fit_inter)[parameterEstimates(fit_inter)$lhs == "JobCraftingExp", ]

# Extract specific coefficients
beta_JC2IStR_NEOA <- interaction_coefficient[interaction_coefficient$op == "~" & interaction_coefficient$rhs == "JC2IStR.NEOA", "est"]
beta_NEOA <- interaction_coefficient[interaction_coefficient$op == "~" & interaction_coefficient$rhs == "NEOA", "est"]

# Check coefficients
if (is.na(beta_JC2IStR_NEOA) | is.na(beta_NEOA)) {
  stop("Check model coefficients, NA detected.")
}

# Calculate slopes at mean, +1 SD, and -1 SD of NEOE
slopes <- c(
  at_mean = beta_JC2IStR_NEOA + beta_NEOA * mean_NEOA,
  at_plus_1sd = beta_JC2IStR_NEOA + beta_NEOA * (mean_NEOA + sd_NEOA),
  at_minus_1sd = beta_JC2IStR_NEOA + beta_NEOA * (mean_NEOA - sd_NEOA)
)

# Verify slopes are finite
if(any(!is.finite(slopes))) {
  stop("Non-finite slopes calculated, check input values and model output.")
}

# Plotting these slopes
plot(c(-1, 0, 1), slopes, type = "b", xlab = "Standard Deviations from the Mean", ylab = "Effect of JC2IStR on JobCraftingExp",
     main = "Interaction of JC2IStR with NEOA on JobCraftingExp")
points(c(-1, 0, 1), slopes, col = "red", pch = 19)
abline(h = 0, lty = 2)
text(c(-1, 0, 1), slopes, labels = c("NEOA -1 SD", "NEOA Mean", "NEOA +1 SD"), pos = 3)


# Simple sloaps for significant interaction terms

# NOEA
# Define moderator for probing:
# Calculate the variance of NEOA
var_neoa <- var(data_dmc$NEOA, na.rm = TRUE)

# Calculate sqrt of the variance of NEOA
sqrt_var_neoa <- sqrt(var_neoa)

# Set valProbe to -sqrt(variance), 0, +sqrt(variance)
valProbeNEOA <- c(-sqrt_var_neoa, 0, sqrt_var_neoa)
print(valProbeNEOA)

# Run the probe2WayMC function
probeNEOA <- probe2WayMC(fit = fit_inter, 
                           nameX = c("JobCraftingControl", "NEOA", "JC2IStR.NEOA"), 
                           nameY = "JobCraftingExp", 
                           modVar = "NEOA", 
                           valProbe = valProbeNEOA)

# Print the results
print(probeNEOA)
plotProbe(probeNEOA, c(-3,3))


# NEOO
# Define moderator for probing:
# Calculate the variance of NEOO
var_neoo <- var(data_dmc$NEOO, na.rm = TRUE)

# Calculate sqrt of the variance of NEOO
sqrt_var_neoo <- sqrt(var_neoo)

# Set valProbe to -sqrt(variance), 0, +sqrt(variance)
valProbeNEOO <- c(-sqrt_var_neoo, 0, sqrt_var_neoo)
print(valProbeNEOO)

# Run the probe2WayMC function
probeNEOO <- probe2WayMC(fit = fit_inter, 
                         nameX = c("JobCraftingControl", "NEOO", "JC2IStR.NEOO"), 
                         nameY = "JobCraftingExp", 
                         modVar = "NEOO", 
                         valProbe = valProbeNEOO)

# Print the results
print(probeNEOO)
plotProbe(probeNEOO, c(-3,3))



# SemPaths -> Difficult to make good graphs (probably use PPT)
pm_no_ctrl <- semptools::drop_nodes(
                object = semPlotModel(fit_inter),
                nodes = c("AGE", "AGEsq", "WORK", "Gender_Männlich", 
                          "Edu_Abgeschlossene_Berufsausbildung", "Edu_Mittlere_Reife_Realschulabschluss", 
                          "Edu_Abitur_oder_Fachabitur", "Edu_Bachelor", "Edu_Master", "AILiteracyUse", 
                          "AILiteracyKno", "AILiteracyDet", "AILiteracyEth", "PGAT", "NGAT",
                          "NEOO", "NEOA", "NEOE", "NEOC", "NEON", "Prompt_Support", "JC1IStR", "JC2IStR")
)

# Visualizing the SEM model
semPaths(pm_no_ctrl, what = "est", layout = "tree", 
         title = FALSE,
         sizeMan = 10, sizeLat = 12, sizeInt = 2, 
         edge.label.cex = 0.8,
         edge.color = "black", curve = TRUE, 
         rotation = 2, curvature = 0.5, 
         residuals = TRUE, intercepts = FALSE,
         groups = "latents",  # Coloring latent variables
         shapeMan = "rectangle", shapeLat = "ellipse", shapeInt = "triangle")



###
  

## SEM Moderation HRJD

# Model with Double Mean Centering

# Transform AGE to address non-linear relationship
data$AGEsq <- data$AGE^2

# Test model fit without interaction first
model_no_int <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1HRJD
  JobCraftingExp =~ JC2HRJD 

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Control Variables
  JobCraftingExp ~ AGE + AGEsq + WORK + Gender_Männlich + 
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + 
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + PGAT + NGAT
                   
'

# Fit and summarize the model
fit_no_int <- sem(model_no_int, data = data, estimator = "MLR")
summary(fit_no_int, fit.measures = TRUE, standardized = TRUE)


# Double Mean Centering the relevant variables to create interaction terms of Big Five with JC2
data_dmc <- indProd(data, var1 = c("JC2HRJD"),
                     var2 = c("NEOE", "NEOA", "NEOC", "NEON", "NEOO"),
                     match = FALSE, meanC = TRUE,
                     residualC = FALSE, doubleMC = TRUE)

# Check dataset for interaction terms
head(data_dmc)

# Transform AGE (and WORK) to address non-linear relationship
data_dmc$AGEsq <- data_dmc$AGE^2
#data_dmc$WORKsq <- data_dmc$WORK^2

# Moderation model
model_inter <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1HRJD
  JobCraftingExp =~ JC2HRJD

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Moderation Effects
  JobCraftingExp ~ JC2HRJD.NEOE + JC2HRJD.NEOA + JC2HRJD.NEOC + JC2HRJD.NEON + JC2HRJD.NEOO

  # Control Variables
  JobCraftingExp ~ AGE + AGEsq + WORK + Gender_Männlich +
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + 
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + PGAT + NGAT
  
'

# Fit and summarize the model
fit_inter <- sem(model_inter, data = data_dmc, estimator = "MLR")
summary(fit_inter, fit.measures = TRUE, standardized = TRUE)

# Inspect Measures
fitMeasures(fit_inter, c("cfi", "tli", "rmsea", "srmr"))
lavInspect(fit_inter, "residuals")

# Modification indices (to refine the model) -> To be discussed with Eva
varTable(fit_inter)
mod_indices <- modificationIndices(fit_inter)
head(mod_indices[order(-mod_indices$mi),])

# Alternative - Bootstrapping
fit_inter <- sem(model_inter, data = data_dmc, se = "boot", bootstrap = 5000)
summary(fit_inter, fit.measures = TRUE, standardized = TRUE, ci = TRUE)



# Post-hoc power analysis

# Perform power analysis
power_result <- wp.sem.rmsea(
  n = 68,         # Sample size
  df = 51,        # Degrees of freedom
  rmsea0 = 0.00,  # RMSEA for H0, set to 0 for exact fit
  rmsea1 = 0.08,  # RMSEA for H1, set near the threshold of poor fit
  power = NULL,   # NULL to calculate the power based on given parameters
  alpha = 0.05,   # Significance level
  type = "close"     
)

# Print the result
print(power_result)




