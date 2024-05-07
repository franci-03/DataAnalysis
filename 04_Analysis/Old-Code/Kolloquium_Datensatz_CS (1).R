
install.packages("haven")
library(haven)
library(tidyverse)
library(ggplot2)
library(pastecs)
library(multcomp)
library(compute.es)
library(car)
library(psych)
library(apaTables)
library(xtable)
library(sjPlot)
library(dplyr)
library(psych)      
library(rstatix)

####Daten bereits in SPSS bereinigt und invertierte Items bereits umgepolt

setwd("~/Desktop/MA CS/Finale Datenauswertung")
data <- read_sav("Data_Cleaned.sav")

View(data)


####Faktoren bilden aus unterschiedlichen Itemversionen aufgrund des Experimentellen Designs

data <- data %>%
  mutate(transparency_1 = coalesce(T001_01,T002_01,T003_01,T004_01),transparency_2 = coalesce(T001_02,T002_02,T003_02,T004_02),transparency_3 = coalesce (T001_03,T002_03,T003_03,T004_03),
         trust_1 = coalesce(V001_01,V002_01),trust_2 = coalesce(V001_02,V002_02), trust_3 = coalesce(V001_03,V002_03), trust_4 = coalesce(V001_04,V002_04), 
        inter_just_1 = coalesce(G001_01,G002_01), inter_just_2 = coalesce(G001_02,G002_02),inter_just_3 = coalesce(G001_03,G002_03), 
        info_just_1 = coalesce(G003_01,G006_01,G004_01,G005_01), info_just_2 = coalesce(G003_02,G006_02,G004_02,G005_02), info_just_3 = coalesce(G003_03,G006_03,G004_03,G005_03), info_just_4 = coalesce(G003_04,G006_04,G004_04,G005_04),
        fairness_1 = coalesce(F001_01,F002_01,F003_01, F004_01), fairness_2 = coalesce(F001_02,F002_02,F003_02, F004_02), fairness_3 = coalesce(F001_03,F002_03,F003_03, F004_03))

options(max.print = 10000)
describe(data, fast = T)

###deskrip. Daten:
data <- data %>%
  rename(
    age = SD02_01,
    gender = SD01
  )

describe(data$gender)
table(data$gender)
describe(data$age)


# renaming and factorizing

data$scenario <- factor(data$S011, levels = c(1, 2, 3, 4), labels = c("human work assignment", "AI work assignment", "human feedback", "AI feedback"))

###Dummy Kodierung
data$AI <- ifelse(data$S011 %in% c("2", "4"), 1, 0)
data$feedback <- ifelse(data$S011 %in% c("3", "4"), 1, 0)

describe(data$feedback)
table(data$feedback, data$AI)

####theoretisch FA für alle Modellvariablen  (hier Hauptkomponentenanalyse + Parallelanalyse/Screeplot)
####trust
R_trust <- cor(data[c("trust_1", "trust_2", "trust_3")],use="complete")
R_trust
itemanzahl_trust <- 3
faktoren_trust <- principal(R_trust,nfactors=itemanzahl_trust)
#Scree-Plot
plot(c(1:itemanzahl_trust),faktoren_trust$values,type="b",xlab="Faktor",ylab="Eigenwert")
fa.parallel(R_trust,n.obs=nrow(data),fa="pc",main="Parallel Analysis Scree Plots")
#--> Parallelanalyse legt 1 Faktor nahe, daher Hauptkompenentenanalyse nochmal mit 1 Faktor (festgelegt)
faktoren_trust <- principal(R_trust,nfactors=1,rotate="varimax")
faktoren_trust$values                  # Eigenwerte
faktoren_trust$loadings                # Ladungen; wenn rotate spezifiziert wird, gibt R nur die rotierte Faktorlsungsmatrix aus
faktoren_trust$communality  

###Cronbachs Alpha

#Trust
psych::alpha(cbind(data$trust_1, data$trust_2, data$trust_3, data$trust_4))
#Inter Justice
psych::alpha(cbind(data$inter_just_1, data$inter_just_2, data$inter_just_3))
#Info Justice
psych::alpha(cbind(data$info_just_1, data$info_just_2, data$info_just_3, data$info_just_4))
#Technologieaffinität
psych::alpha(cbind(data$TA01_01, data$TA01_02, data$TA01_03, data$TA01_04))
#Diskriminierungserfahrungen
psych::alpha(cbind(data$D001_01, data$D001_02, data$D001_03))


##Deskriptive Statistiken und Korrelation
###Mittelwert der Skalen
data$transparency_mean <- rowMeans(subset(data, select = c(transparency_1, transparency_2, transparency_3)))
data$trust_mean <- rowMeans(subset(data, select = c(trust_1, trust_2, trust_3, trust_4)))
data$inter_just_mean <- rowMeans(subset(data, select = c(inter_just_1, inter_just_2, inter_just_3)))
data$info_just_mean <- rowMeans(subset(data, select = c(info_just_1, info_just_2, info_just_3, info_just_4)))
data$tech_aff_mean <- rowMeans(subset(data, select = c(TA01_01, TA01_02, TA01_03, TA01_04)))
data$exp_AI_mean <- rowMeans(subset(data, select = c(EK01_01, EK01_02, EK01_03)))
data$fairness_score_mean <- rowMeans(subset(data, select = c(fairness_1, fairness_2, fairness_3)))
data$disc_score_mean <- rowMeans(subset(data, select = c(D001_01, D001_02, D001_03)))

# Load the psych package if you haven't already
library(psych)

# Calculate descriptives using the describe function
data_descriptives <- describe(data)
print(data_descriptives)

#Korrelationen
data_corr<- subset(data, select = c( trust_mean, inter_just_mean, info_just_mean, disc_score_mean, tech_aff_mean, exp_AI_mean, age, gender))
cor_matrix <- cor(data_corr)
cor_matrix                                                                                                                               

# Load the apaTables package
library(apaTables)

# Create an APA format table
apa_cor_table <- apa.cor.table(data_corr, filename = "Table xy.doc")

# Print the table
apa_cor_table


####grobe Übersicht:
by(data$trust_mean, data$scenario, stat.desc)
by(data$fairness_score_mean, data$scenario, stat.desc)
by(data$info_just_mean, data$scenario, stat.desc)
by(data$inter_just_mean, data$scenario, stat.desc)
by(data$transparency_mean, data$scenario, stat.desc)
by(data$disc_score_mean, data$scenario, stat.desc)


#######ANOVAS zur Überprüfung der Unteschiede zwischen Gruppen:
##Trust
library(rstatix)
leveneTest(data$disc_score_mean, data$scenario, center = median) ###nichht signifikant daher normale Anova
anova_disc<- aov(disc_score_mean~scenario, data = data)
summary(anova_disc)
boxplot(data$disc_score_mean~data$scenario)
tukey <- TukeyHSD(anova_disc)
print(tukey)

leveneTest(data$age, data$scenario, center = median) ###nicht signifikant daher normale Anova
anova_age<- aov(age~scenario, data = data)
summary(anova_age)
boxplot(data$age~data$scenario)
tukey <- TukeyHSD(anova_age)
print(tukey)

leveneTest(data$gender, data$scenario, center = median) ###nicht signifikant daher normale Anova
anova_gender<- aov(age~scenario, data = data)
summary(anova_gender)
boxplot(data$gender~data$scenario)
tukey <- TukeyHSD(anova_gender)
print(tukey)


#####Hypothesenüberprüfung

###Unterschiedshypothesen bezüglich AI / Mensch & Feedback / Evaluation
###AI wird negativer wahrgenommen (bezüglich fairness und trust), Effekt noch stärker bei "menschlicher" Aufgabe = Feedback
####ANOVA / LEVENE TEST:
##Trust
leveneTest(data$trust_mean, data$scenario, center = median) ###nicht sig.
anova_trust <- aov(trust_mean~scenario, data = data)
summary(anova_trust)
boxplot(data$trust_mean ~ data$scenario)
tukey <- TukeyHSD(anova_trust)
print(tukey)

##Fairness
leveneTest(data$fairness_score_mean, data$scenario, center = median) ####signifikant daher Welch's F Test
oneway.test(fairness_score_mean~scenario, data = data) # Welche Test
boxplot(data$fairness_score_mean ~ data$scenario)
games_howell_test(data, fairness_score_mean~scenario, conf.level = 0.95, detailed = FALSE)

###Informational Justice
leveneTest(data$info_just_mean, data$scenario, center = median) ###signifikant daher Welch's F Test
oneway.test(info_just_mean~scenario, data = data) # Welche Test
boxplot(data$info_just_mean ~ data$scenario)
games_howell_test(data, info_just_mean~scenario, conf.level = 0.95, detailed = FALSE)

###Interpersonal Justice
leveneTest(data$inter_just_mean, data$scenario, center = median) ####nicht signifikant
anova_inter_just <- aov(inter_just_mean~scenario, data = data)
summary(anova_inter_just)
boxplot(data$inter_just_mean ~ data$scenario)
tukey <- TukeyHSD(anova_inter_just)
print(tukey)

##Transparency
leveneTest(data$transparency_mean, data$scenario, center = median) #### signifikant
oneway.test(transparency_mean~scenario, data = data) # Welche Test
boxplot(data$transparency_mean~ data$scenario)
games_howell_test(data, transparency_mean~scenario, conf.level = 0.95, detailed = FALSE)

####Regressionsanalysen

###Moderationseffekte bez. Diskriminerung: Wenn vorherige Diskriminierungserfahrung dann mehr Vertrauen/Fairnesswahrnehmung in KI, vermutlich unabhängig von der Aufgabe?


####AV Fairness Moderator vorherige Diskriminierung
####inter justice
lm_inter_just2 <- lm(inter_just_mean~AI + disc_score_mean + disc_score_mean:AI  + age + gender, data = data)
tab_model(lm_inter_just2)


###für die Visualisierung: #Median Split erstellen: 
describe(data$disc_score_mean)
data$disc_split <- ifelse(data$disc_score_mean <= 4, 0, 1)
describe(data$disc_split)

ggplot(data) +
  aes(x = AI, color = disc_split, group = disc_split, y = inter_just_mean) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun = mean, geom = "line")

##Export der Tabellen als Word
tab_model(lm_inter_just2, digits.p = 2, emph.p = FALSE, ci.hyphen = "&#44;&nbsp;",file = "../Moderation.doc")


####SEM#####
library(lavaan)
library(semTools)
library(semPlot)

####SEM Modell mit Mediation und Moderation
####Moderator Diskriminierung z-standardisieren
data$Zdisc <- scale(data$disc_score_mean)
describe(data$Zdisc)
describe(data$disc_score_mean)
data$AIxfeedback <- data$AI*data$feedback
data$AIxZdisc <- data$Zdisc*data$AI

####konfirmatorische Faktorenanalyse


cfa <- '
		   Info =~ info_just_1 + info_just_2 + info_just_3 + info_just_4
		  Inter =~ inter_just_1 + inter_just_2 + inter_just_3
		  Trust =~  trust_1 + trust_2 + trust_3 + trust_4'

cfa_fit <- sem(cfa, data, estimator = "MLR", missing ="FIML")
summary(cfa_fit, fit.measures = TRUE, standardized = TRUE)

####average variance extracted:
AVE(cfa_fit)
###composite Reliabilities
compRelSEM(cfa_fit)

discriminantValidity(cfa_fit, cutoff = 0.9, merge = FALSE, level = 0.95)



sem_4 <- '# Messmodelle:
                                 Info =~ info_just_1 + info_just_2 + info_just_3 + info_just_4
                                 Inter =~ inter_just_1 + inter_just_2 + inter_just_3
                                 Trust =~  trust_1 + trust_2 + trust_3 + trust_4
                                
                              
                                 # Strukturmodelle:
                                 Info ~ a1*AI + Zdisc  + age + gender  + feedback + AIxZdisc + AIxfeedback
                                 Inter ~ a2*AI + Zdisc + age + gender  + feedback + AIxZdisc + AIxfeedback
                                 Trust ~ b1*Info + b2*Inter + AI  + age + gender+ feedback + AIxZdisc + AIxfeedback + Zdisc
                                 ind1 := a1*b1 # Mediation nach Hayes testen, Produktterm bilden und Pfad benennen
                                 ind2 := a2*b2   
                                 Info ~~ Inter

'



fit4 <- sem( sem_4, data = data, fixed.x = FALSE, std.lv=T, se="boot", bootstrap=5000) 
summary( fit4, fit.measures = TRUE, standardized = TRUE )
parameterEstimates(fit4) ###Konfidenzintervall für alle Pfade
semPaths(fit4, what = "paths", whatLables="stand", rotation =1)
semPaths(fit4, "std", "est")
modindices(fit4)
