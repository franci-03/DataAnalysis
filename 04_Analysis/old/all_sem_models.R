## Hypo 3a-e

# Visual Analysis
pairs(data[, c("NEOE", "NEOA", "NEOC", "NEON", "NEOO", "JC2IStR", "JC2HRJD")], upper.panel=panel.smooth)

# Normality test on the predicted values
data$predicted_JC2IStR <- lm(JC2IStR ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data)$fitted.values
shapiro.test(data$predicted_JC2IStR)
data$predicted_JC2HRJD <- lm(JC2HRJD ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data)$fitted.values
shapiro.test(data$predicted_JC2HRJD)

# VIF to check multicollinearity
vif(lm(JC2IStR ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data))
vif(lm(JC2HRJD ~ NEOE + NEOA + NEOC + NEON + NEOO, data = data))

# Composite Variables (not used further)
data$EDUCATION <- with(data, 1 * Edu_Abgeschlossene_Berufsausbildung + 2 * Edu_Mittlere_Reife_Realschulabschluss + 
                         3 * Edu_Abitur_oder_Fachabitur + 4 * Edu_Bachelor + 
                         5 * Edu_Master + 6 * Edu_Doktortitel)
data$GENDER <- with(data, 0 * Gender_Männlich + 1 * Gender_Weiblich)


# Create interaction terms manually
data$JC2IStR_NEOO <- data$JC2IStR * data$NEOO
data$JC2IStR_NEOC <- data$JC2IStR * data$NEOC
data$JC2IStR_NEOA <- data$JC2IStR * data$NEOA
data$JC2IStR_NEOE <- data$JC2IStR * data$NEOE
data$JC2IStR_NEON <- data$JC2IStR * data$NEON

model1 <- ' 
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR
  #AutonomyExp =~ SDT2AUT
  #CompetenceExp =~ SDT2COM
  
  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support
  
  # Mediation Paths
  #JobCraftingExp ~ AutonomyExp + CompetenceExp
  
  # Moderation Effects: Interaction between experimental job crafting and each Big Five trait
  JobCraftingExp ~ JC2IStR * NEOO + JC2IStR * NEOC + JC2IStR * NEOA +
                   JC2IStR * NEOE + JC2IStR * NEON
  
  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + 
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss +
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                   PGAT + NGAT
'


model1 <- ' 
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR
  
  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support 
  
  # Moderation Effects: Interaction between experimental job crafting and each Big Five trait
  JobCraftingExp ~ JC2IStR_NEOO + JC2IStR_NEOC + JC2IStR_NEOA + JC2IStR_NEOE + JC2IStR_NEON 
  
  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + NEOE + NEOA + NEOC + NEON + NEOO +
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss +
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                   PGAT + NGAT

'

# Assuming 'data' is your DataFrame containing the dataset
data$JC_Difference <- data$JC2IStR - data$JC1IStR

# Create interaction terms manually
data$JC2IStR_NEOO <- data$JC_Difference * data$NEOO
data$JC2IStR_NEOC <- data$JC_Difference * data$NEOC
data$JC2IStR_NEOA <- data$JC_Difference * data$NEOA
data$JC2IStR_NEOE <- data$JC_Difference * data$NEOE
data$JC2IStR_NEON <- data$JC_Difference * data$NEON

model1 <- '
  # Structural model focusing on the job crafting difference
  JC_Difference ~ Prompt_Support #+ NEOE + NEOA + NEOC + NEON + NEOO
  
  JC_Difference ~ JC2IStR_NEOO + JC2IStR_NEOC + JC2IStR_NEOA + JC2IStR_NEOE + JC2IStR_NEON 
                  
  JC_Difference ~ AGE + WORK + Gender_Männlich +
                  Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss +
                  Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master +
                  AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                  PGAT + NGAT
'

# Fit the primary SEM model
fit1 <- sem(model1, data = data, std.lv= TRUE, estimator = "MLR") #fixed.x = FALSE
summary(fit1, fit.measures = TRUE, standardized = TRUE)
semPaths(fit1, whatLabels = "est", layout = "tree")


# Assuming 'data' is your DataFrame containing the dataset
data$JC_Difference <- data$JC2IStR - data$JC1IStR

# Create interaction terms manually
data$JC2IStR_Diff_NEOO <- data$JC_Difference * data$NEOO
data$JC2IStR_Diff_NEOC <- data$JC_Difference * data$NEOC
data$JC2IStR_Diff_NEOA <- data$JC_Difference * data$NEOA
data$JC2IStR_Diff_NEOE <- data$JC_Difference * data$NEOE
data$JC2IStR_Diff_NEON <- data$JC_Difference * data$NEON

# SEM model for within-subject design, focusing on changes and moderation
semModel <- '
  JC_Difference ~ Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO
  
  JC_Difference ~ JC2IStR_Diff_NEOO + JC2IStR_Diff_NEOC + JC2IStR_Diff_NEOA + JC2IStR_Diff_NEOE + JC2IStR_Diff_NEON
  
  # Control variables
  JC_Difference ~ AGE + WORK + Gender_Männlich +
                  Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss +
                  Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master +
                  AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                  PGAT + NGAT
'

# Fit the SEM model
fit <- sem(semModel, data=data, estimator="MLR")
summary(fit, standardized = TRUE, fit.measures = TRUE)



# Data preparation
# Centering predictor variables
traits <- c("NEOE", "NEOA", "NEOC", "NEON", "NEOO")
center_vars <- c("JC2IStR") #EIG AUCH CONTROL ZENTRIEREN
data[c(center_vars, traits)] <- scale(data[c(center_vars, traits)], center = TRUE, scale = FALSE)

# Creating interaction terms for the Big Five with GenAI use
data$Inter_OE <- data$NEOO * data$JC2IStR
data$Inter_AE <- data$NEOA * data$JC2IStR
data$Inter_CE <- data$NEOC * data$JC2IStR
data$Inter_EE <- data$NEOE * data$JC2IStR
data$Inter_NE <- data$NEON * data$JC2IStR

# Specifying the SEM model focusing on job crafting constructs
model <- '
  # Measurement model for job crafting
  JobCrafting_Control =~ JC1IStR
  JobCrafting_Experimental =~ JC2IStR

  # Structural model to include interactions with Big Five traits
  JobCrafting_Experimental ~ JobCrafting_Control + Prompt_Support +
                NEOE + NEOA + NEOC + NEON + NEOO
                
   JobCrafting_Experimental ~ Inter_OE + Inter_AE + Inter_CE + Inter_EE + Inter_NE

  # Control variables
  JobCrafting_Experimental ~ AGE + WORK + Gender_Männlich +
                Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                PGAT + NGAT
'

# Fit the SEM model
fit <- sem(model, data = data, estimator = "MLR")
summary(fit, fit.measures = TRUE, standardized = TRUE)





# Assuming 'data' is your DataFrame containing the dataset
data$JC_Difference <- data$JC2IStR - data$JC1IStR

# Specify the SEM model
model_difference <- '
  # Structural model focusing on the job crafting difference
  JC_Difference ~ Prompt_Support
  
  JC_Difference ~ Inter_OE + Inter_AE + Inter_CE + Inter_EE + Inter_NE + 
                  
  JC_Difference ~ AGE + WORK + Gender_Männlich +
                  Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss +
                  Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master +
                  AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                  PGAT + NGAT
'

# Fit the SEM model
fit_difference <- sem(model_difference, data = data, estimator = "MLR")

# Model evaluation
summary(fit_difference, fit.measures = TRUE, standardized = TRUE)




# Mean centering the predictor and moderator variables
data$NEOO_centered <- scale(data$NEOO, scale = FALSE)
data$NEOC_centered <- scale(data$NEOC, scale = FALSE)
data$NEOA_centered <- scale(data$NEOA, scale = FALSE)
data$NEOE_centered <- scale(data$NEOE, scale = FALSE)
data$NEON_centered <- scale(data$NEON, scale = FALSE)
data$JC1IStR_centered <- scale(data$JC1IStR, scale = FALSE)  # Center without scaling
data$JC2IStR_centered <- scale(data$JC2IStR, scale = FALSE)  # Centering job crafting scores

# Creating centered interaction terms
data$Interaction_NEOO <- data$JC2IStR_centered * data$NEOO_centered
data$Interaction_NEOC <- data$JC2IStR_centered * data$NEOC_centered
data$Interaction_NEOA <- data$JC2IStR_centered * data$NEOA_centered
data$Interaction_NEOE <- data$JC2IStR_centered * data$NEOE_centered
data$Interaction_NEON <- data$JC2IStR_centered * data$NEON_centered

# Revised SEM model incorporating centered terms
model <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR_centered
  JobCraftingExp =~ JC2IStR_centered
  Personality =~ NEOE_centered + NEOA_centered + NEOC_centered + NEON_centered + NEOO_centered

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + Personality

  # Moderation Effects
  JobCraftingExp ~ Interaction_NEOO + Interaction_NEOC + Interaction_NEOA + Interaction_NEOE + Interaction_NEON

  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth + PGAT + NGAT
'

# Fit and summarize the model
fit <- sem(model, data = data, estimator = "MLR")
summary(fit, fit.measures = TRUE, standardized = TRUE)



model <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR
  Personality =~ NEOE + NEOA + NEOC + NEON + NEOO

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Moderation Effects
  JobCraftingExp ~ Interaction_NEOO + Interaction_NEOC + Interaction_NEOA + Interaction_NEOE + Interaction_NEON

  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth + PGAT + NGAT
'

# Fit and summarize the model
fit <- sem(model, data = data, estimator = "MLR")
summary(fit, fit.measures = TRUE, standardized = TRUE)






# DMC VIDEO

# Test model fit without interaction first
model_no_int <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR 

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + 
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + 
                   Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth + 
                   PGAT + NGAT
'

# Fit and summarize the model
fit_no_int <- sem(model_no_int, data = data, estimator = "MLR")
summary(fit, fit.measures = TRUE, standardized = TRUE)


# Double Mean Centering
data_dmc <- indProd(data, var1 = c("JC2IStR"),
                    var2 = c("NEOE", "NEOA", "NEOC", "NEON", "NEOO"),
                    match = FALSE, meanC = TRUE,
                    residualC = FALSE, doubleMC = TRUE)

head(data_dmc)

# Moderation model
model_inter <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1IStR
  JobCraftingExp =~ JC2IStR

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Moderation Effects
  JobCraftingExp ~ JC2IStR.NEOE + JC2IStR.NEOA + JC2IStR.NEOC + JC2IStR.NEON + JC2IStR.NEOO

  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth + PGAT + NGAT
  
  # Error Covariances
  JC2IStR.NEOE ~~ JC2IStR.NEOA + JC2IStR.NEOC + JC2IStR.NEON + JC2IStR.NEOO
  JC2IStR.NEOA ~~ JC2IStR.NEOC + JC2IStR.NEON + JC2IStR.NEOO
  JC2IStR.NEOC ~~ JC2IStR.NEON + JC2IStR.NEOO
  JC2IStR.NEON ~~ JC2IStR.NEOO

'

# Fit and summarize the model
fit <- sem(model_inter, data = data_dmc, estimator = "MLR")
summary(fit, fit.measures = TRUE, standardized = TRUE)

# Simple sloaps
probe <- probe2WayMC(fit, nameX = c("JC1IStR", "NEOE", "JC2IStR.NEOE"), nameY = "JC2IStR", 
                     modVar = "NEOE", valProbe = c(-sqrt(0.113), 0, sqrt(0.113))) # variance from trait

probe

plotProbe(probe, c(-3,3))



# Calculate means and standard deviations
means <- colMeans(data_dmc[, c("NEOE", "NEOA", "NEOC", "NEON", "NEOO")], na.rm = TRUE)
sds <- apply(data_dmc[, c("NEOE", "NEOA", "NEOC", "NEON", "NEOO")], 2, sd, na.rm = TRUE)

# Create a new data frame for predictions
new_data <- expand.grid(
  Prompt_Support = c(0, 1),
  NEOE = c(means['NEOE'], means['NEOE'] + sds['NEOE'], means['NEOE'] - sds['NEOE']),
  NEOA = c(means['NEOA'], means['NEOA'] + sds['NEOA'], means['NEOA'] - sds['NEOA']),
  NEOC = c(means['NEOC'], means['NEOC'] + sds['NEOC'], means['NEOC'] - sds['NEOC']),
  NEON = c(means['NEON'], means['NEON'] + sds['NEON'], means['NEON'] - sds['NEON']),
  NEOO = c(means['NEOO'], means['NEOO'] + sds['NEOO'], means['NEOO'] - sds['NEOO'])
)

# Predict the effects
predictions <- predict(fit, newdata = new_data)

# Print the results
predictions






# Create interaction terms manually
data$JC2HRJD_NEOO <- data$JC2HRJD * data$NEOO
data$JC2HRJD_NEOC <- data$JC2HRJD * data$NEOC
data$JC2HRJD_NEOA <- data$JC2HRJD * data$NEOA
data$JC2HRJD_NEOE <- data$JC2HRJD * data$NEOE
data$JC2HRJD_NEON <- data$JC2HRJD * data$NEON

model2 <- ' 
  # Measurement Model Definitions
  JobCraftingControl =~ JC1HRJD
  JobCraftingExp =~ JC2HRJD
  
  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support +
                   AGE + WORK + Gender_Männlich +
                   Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + 
                   AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth +
                   PGAT + NGAT
                   
  # Moderation Effects: Interaction between experimental job crafting and each Big Five trait
  JobCraftingExp ~ JC2HRJD_NEOO + JC2HRJD_NEOC + JC2HRJD_NEOA + JC2HRJD_NEOE + JC2HRJD_NEON 

'

# Fit the primary SEM model
fit2 <- sem(model2, data = data, std.lv= TRUE, estimator = "MLR") #fixed.x = FALSE
summary(fit2, fit.measures = TRUE, standardized = TRUE)




# TO CHECK
# Double Mean Centering
data_dmc2 <- indProd(data_dmc, var1 = c("JC2HRJD"),
                     var2 = c("NEOE", "NEOA", "NEOC", "NEON", "NEOO"),
                     match = FALSE, meanC = TRUE,
                     residualC = FALSE, doubleMC = TRUE)

model_inter <- '
  # Measurement Model Definitions
  JobCraftingControl =~ JC1HRJD
  JobCraftingExp =~ JC2HRJD

  # Direct Effects
  JobCraftingExp ~ JobCraftingControl + Prompt_Support + NEOE + NEOA + NEOC + NEON + NEOO

  # Moderation Effects
  JobCraftingExp ~ JC2HRJD.NEOE + JC2HRJD.NEOA + JC2HRJD.NEOC + JC2HRJD.NEON + JC2HRJD.NEOO

  # Control Variables
  JobCraftingExp ~ AGE + WORK + Gender_Männlich + Edu_Abgeschlossene_Berufsausbildung + Edu_Mittlere_Reife_Realschulabschluss + Edu_Abitur_oder_Fachabitur + Edu_Bachelor + Edu_Master + AILiteracyUse + AILiteracyKno + AILiteracyDet + AILiteracyEth + PGAT + NGAT

  JC2HRJD.NEOE ~~ JC2HRJD.NEOA + JC2HRJD.NEOC + JC2HRJD.NEON + JC2HRJD.NEOO
  JC2HRJD.NEOA ~~ JC2HRJD.NEOC + JC2HRJD.NEON + JC2HRJD.NEOO
  JC2HRJD.NEOC ~~ JC2HRJD.NEON + JC2HRJD.NEOO
  JC2HRJD.NEON ~~ JC2HRJD.NEOO
'

# Fit and summarize the model
fit <- sem(model_inter, data = data_dmc2, estimator = "MLR")
summary(fit, fit.measures = TRUE, standardized = TRUE)
