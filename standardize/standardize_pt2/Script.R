# This is organized into 4 sections: GDP per capita, individual SES, individual income, and family income. Each of those sections are organized into preparing data, demographics, and analyses.

### Packages
library(tidyverse)
library(lmerTest) # Analyses using lmer
library(scales) # Rescaling y axis for AVI demographics plots
library(pander) # Create tables
library(knitr)
library(lme4)
library("ggpubr") # For correlation graphs
library(sjPlot) #for plotting lmer and glmer mods

### Meta-analysis data
df <- read.csv("std_pt1_meta_df_11_15.csv", fileEncoding="latin1")

### GDP per capita

## Prepare data

# GDP per capita, PPP, year, country
df1 <- read.csv("./GDP.csv", skip = 4)

# Get country from ethnicity
df$country = as.character(df$ethn)

df$country[df$country == "Other" |
             df$country == "" |
             df$country == "Asian" |
             df$country == "Hispanic" |
             df$country == "African and African American" |
             df$country == "German + American" |
             df$country == "Multiracial" |
             df$country == "Eastern Europe" |
             df$country == "Native Hawaiian and Pacific Islander" |
             df$country == "East Asian and East Asian American" |
             df$country == "European and Middle Eastern and North Africa" |
             df$country == "Prefer not to answer" |
             df$country == "Asian and Pacific Islander"] = "Not included"

df$country[df$country == "European American" |
             df$country == "East Asian American" |
             df$country == "Chinese American" |
             df$country == "Latino American" |
             df$country == "African American" |
             df$country == "Asian American" |
             df$country == "Native American" |
             df$country == "American" |
             df$country == "Korean American" |
             df$country == "Japanese American"] = "United States"

df$country[df$country == "European Canadian" | 
             df$country == "Canadian"] = "Canada"

df$country[df$country == "Mexican"] = "Mexico"

df$country[df$country == "Brazilian"] = "Brazil"

df$country[df$country == "Colombian"] = "Colombia"

df$country[df$country == "Peruvian"] = "Peru"

df$country[df$country == "Hong Kong Chinese"] = "Hong Kong SAR, China"

df$country[df$country == "Chinese" |
             df$country == "Taiwanese"] = "China"

df$country[df$country == "Japanese"] = "Japan"

df$country[df$country == "Korean"] = "Korea, Rep."

df$country[df$country == "Singaporean"] = "Singapore"

df$country[df$country == "Vietnamese"] = "Vietnam"

df$country[df$country == "Indian"] = "India"

df$country[df$country == "Nepalese"] = "Nepal"

df$country[df$country == "Filipino"] = "Philippines"

df$country[df$country == "Sri Lankan"] = "Sri Lanka"

df$country[df$country == "East Asian" |
             df$country == "Southeast Asian"] = "East Asia & Pacific"

df$country[df$country == "Pacific Islander"] = "Pacific island small states"

df$country[df$country == "South Asian"] = "South Asia"

df$country[df$country == "Australian"] = "Australia"

df$country[df$country == "New Zealander"] = "New Zealand"

df$country[df$country == "Malaysian"] = "Malaysia"

df$country[df$country == "British"] = "United Kingdom"

df$country[df$country == "French"] = "France"

df$country[df$country == "Dutch"] = "Netherlands"

df$country[df$country == "Belgian"] = "Belgium"

df$country[df$country == "German"] = "Germany"

df$country[df$country == "Italian"] = "Italy"

df$country[df$country == "Polish"] = "Poland"

df$country[df$country == "Swedish"] = "Sweden"

df$country[df$country == "Moldovian"] = "Moldova"

df$country[df$country == "Russian"] = "Russian Federation"

df$country[df$country == "Bulgarian"] = "Bulgaria"

df$country[df$country == "Turkish"] = "Turkey"

df$country[df$country == "Middle Eastern" |
             df$country == "Middle Eastern and Arab"] = "Middle East & North Africa"

df$country[df$country == "Israeli"] = "Israel"

df$country[df$country == "Iranian"] = "Iran"

df$country[df$country == "Ghanaian"] = "Ghana"

df$country[df$country == "Mauritian"] = "Mauritius"

df$country[df$country == "Nigerian"] = "Nigeria"

df$country[df$country == "Ethiopian"] = "Ethiopia"

df$country[df$country == "Omani"] = "Oman"

# Create new data frame
df1_new <- df1[, c(1, 45:64)]
colnames(df1_new)[1] <- "country"

# Merge data frames into df_final
df_final <- merge(df, df1_new, by=c("country"))
# Create new collected year variable by truncating collected_year
df_final$collected_year_new <- trunc(df_final$collected_year)
# When new collected year variable is NA, make it 0
df_final$collected_year_new[is.na(df_final$collected_year_new)] <- 0

df_final$year_GDP_per_capita <- NA
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2002", df_final$X2002, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2003", df_final$X2003, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2004", df_final$X2004, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2005", df_final$X2005, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2006", df_final$X2006, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2007", df_final$X2007, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2008", df_final$X2008, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2009", df_final$X2009, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2010", df_final$X2010, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2011", df_final$X2011, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2012", df_final$X2012, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2013", df_final$X2013, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2014", df_final$X2014, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2015", df_final$X2015, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2016", df_final$X2016, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2017", df_final$X2017, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2018", df_final$X2018, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- df_final$year_GDP_per_capita / 10000

# Write to csv
write.csv(df_final, "std_pt2_data.csv", row.names = FALSE)

## Demographics

# Total number of participants
sum(!is.na(df_final$year_GDP_per_capita))

# Affect participant number
sum(!is.na(df_final$i.HAP[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$i.LAP[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$i.HAN[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$i.LAN[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$r.HAP[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$r.LAP[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$r.HAN[!is.na(df_final$year_GDP_per_capita)]))
sum(!is.na(df_final$r.LAN[!is.na(df_final$year_GDP_per_capita)]))

# Country list
unique(df_final$country[!is.na(df_final$year_GDP_per_capita)])
country_list <- list("Australia", "Belgium", "Bulgaria", "Canada", "China", "Colombia", "East Asia & Pacific", "Ethiopia", "France", "Germany", "Hong Kong SAR, China", "India", "Israel", "Japan", "Korea, Rep.", "Malaysia", "Mauritius", "Mexico", "Middle East & North Africa", "Moldova", "Nepal", "Netherlands", "New Zealand", "Nigeria", "Oman", "Pacific island small states", "Peru", "Philippines", "Russian Federation", "South Asia", "Sri Lanka", "Sweden", "Turkey", "United Kingdom", "United States", "Vietnam")

# Number of participants for each country
for (i in country_list) {
  print(i)
  print(sum(!is.na(df_final$year_GDP_per_capita[df_final$country == i])))
}
rm(i)

# Gender distribution
sum((df_final$gender == "M") & !is.na(df_final$year_GDP_per_capita))
sum((df_final$gender == "F") & !is.na(df_final$year_GDP_per_capita))

# Age distribution
unique(df_final$age[!is.na(df_final$year_GDP_per_capita)])
mean(df_final$age[!is.na(df_final$year_GDP_per_capita)], na.rm=TRUE)
median(df_final$age[!is.na(df_final$year_GDP_per_capita)], na.rm=TRUE)
sd(df_final$age[!is.na(df_final$year_GDP_per_capita)], na.rm=TRUE)
min(df_final$age[!is.na(df_final$year_GDP_per_capita)], na.rm=TRUE)
max(df_final$age[!is.na(df_final$year_GDP_per_capita)], na.rm=TRUE)

## Analysis

fit1 <- lmer(r.HAP ~ year_GDP_per_capita + i.HAP + (1 | study), data=df_final)
summary(fit1)
fit2 <- lmer(r.LAP ~ year_GDP_per_capita + i.LAP + (1 | study), data=df_final)
summary(fit2)
fit3 <- lmer(r.HAN ~ year_GDP_per_capita + i.HAN + (1 | study), data=df_final)
summary(fit3)
fit4 <- lmer(r.LAN ~ year_GDP_per_capita + i.LAN + (1 | study), data=df_final)
summary(fit4)
fit5 <- lmer(i.HAP ~ year_GDP_per_capita + r.HAP + (1 | study), data=df_final)
summary(fit5)
fit6 <- lmer(i.LAP ~ year_GDP_per_capita + r.LAP + (1 | study), data=df_final)
summary(fit6)
fit7 <- lmer(i.HAN ~ year_GDP_per_capita + r.HAN + (1 | study), data=df_final)
summary(fit7)
fit8 <- lmer(i.LAN ~ year_GDP_per_capita + r.LAN + (1 | study), data=df_final)
summary(fit8)

fit1 <- lmer(r.HAP.ips.us ~ year_GDP_per_capita + i.HAP.ips.us + (1 | study), data=df_final)
summary(fit1)
fit2 <- lmer(r.LAP.ips.us ~ year_GDP_per_capita + i.LAP.ips.us + (1 | study), data=df_final)
summary(fit2)
fit3 <- lmer(r.HAN.ips.us ~ year_GDP_per_capita + i.HAN.ips.us + (1 | study), data=df_final)
summary(fit3)
fit4 <- lmer(r.LAN.ips.us ~ year_GDP_per_capita + i.LAN.ips.us + (1 | study), data=df_final)
summary(fit4)
fit5 <- lmer(i.HAP.ips.us ~ year_GDP_per_capita + r.HAP.ips.us + (1 | study), data=df_final)
summary(fit5)
fit6 <- lmer(i.LAP.ips.us ~ year_GDP_per_capita + r.LAP.ips.us + (1 | study), data=df_final)
summary(fit6)
fit7 <- lmer(i.HAN.ips.us ~ year_GDP_per_capita + r.HAN.ips.us + (1 | study), data=df_final)
summary(fit7)
fit8 <- lmer(i.LAN.ips.us ~ year_GDP_per_capita + r.LAN.ips.us + (1 | study), data=df_final)
summary(fit8)



### indSES

## Create new variables indSES_new and ethn_new_indSES for analysis

# indSES studies with values:
# 2006 Tsai study1 (1 - 5)
# 2006 Tsai study2 (1 - 5)
# 2014 Koopman-Holm study2 (1 - 5)
# 2014 Koopman-Holm study3 (1 - 5)
# 2018 Bencharit study3 (1 - 5)
# 2018 Bencharit study4a (1 - 5)
# 2013 Scheibe study1 (1 - 5)
# 2016 Koc study1 (1 - 10)
# 2016 Tsai study3 (1 - 5)
# 2018 Koc Identity Integration study1 (1 - 10)
# Unpublished Yi study1 (1 - 10)
# All are 1-5 (lower income to upper income), 6, 333, 888, 999 being idk or NA

# Create new column "paper_study"
#df <- transform(df, paper_study=paste(paper, study, sep=" "))

# Create new variables for analysis
df$indSES_new <- df$indSES
df$indincome_new <- df$indincome

# Convert to numeric
df$indSES_new <- as.numeric(as.character(df$indSES_new))
df$indincome_new <- as.numeric(as.character(df$indincome_new))

# Add 2013 Scheibe study1 to indSES
df$indSES_new[df$paper_study == "2013 Scheibe study1"] <- df$indincome_new[df$paper_study == "2013 Scheibe study1"]

# Convert appropriate values to NA
df$indSES_new[df$indSES_new == 6 & (df$paper_study == "2006 Tsai study2" | df$paper_study == "2014 Koopman-Holm study3" | df$paper_study == "2018 Bencharit study3" | df$paper_study == "2018 Bencharit study4a")] <- NA
df$indSES_new[df$indSES_new == 333 | df$indSES_new == 888] <- NA

# Standardize values 1 - 5
df$indSES_new <- ifelse(df$paper_study == "2006 Tsai study1", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2006 Tsai study2", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2013 Scheibe study1", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2016 Koc study1", df$indSES_new / 2, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2016 Tsai study3", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2018 Bencharit study3", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2018 Bencharit study4a", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2018 Koc Identity Integration study1", df$indSES_new / 2, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "Unpublished Yi study1", df$indSES_new / 2, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2014 Koopman-Holm study2", df$indSES_new, df$indSES_new)
df$indSES_new <- ifelse(df$paper_study == "2014 Koopman-Holm study3", df$indSES_new, df$indSES_new)

# Create ethn_new_indSES to categorize the studies' ethnicities for analysis
df$ethn_new_indSES <- "Other"
df$ethn_new_indSES[df$ethn == "European American"] = "European American"
df$ethn_new_indSES[df$ethn == "Chinese American"  | df$ethn == "East Asian American"] = "Asian American"
df$ethn_new_indSES[df$ethn == "Japanese" | df$ethn == "Korean" | df$ethn == "Taiwanese" | df$ethn == "Chinese"] = "East Asian"
df$ethn_new_indSES[df$ethn == "Hong Kong Chinese"] = "Hong Kong Chinese"
df$ethn_new_indSES[df$ethn == "Turkish" | df$ethn == "Swedish" | df$ethn == "German" | df$ethn == "British" | df$ethn == "French" | df$ethn == "Bulgarian" | df$ethn == "Russian" | df$ethn == "Moldovian"] = "European"
X_indSES <- split(df, df$ethn_new_indSES)

## Demographics

# indSES studies
unique(df$paper_study[!is.na(df$indSES_new)])

# indSES values
unique(df$indSES_new)

# Total # of participants
sum(!is.na(df$indSES_new))

# Mean and SD of indSES
mean(df$indSES_new, na.rm=TRUE)
sd(df$indSES_new, na.rm=TRUE)
median(df$indSES_new, na.rm=TRUE)

# All ethnicities
unique(df$ethn[!is.na(df$indSES_new)])

# Create list of studies
indSES_studies <- list("2006 Tsai study1", "2006 Tsai study2", "2013 Scheibe study1", "2016 Koc study1", "2016 Tsai study3", "2018 Bencharit study3", "2018 Bencharit study4a", "2018 Koc Identity Integration study1", "Unpublished Yi study1", "2014 Koopman-Holm study2", "2014 Koopman-Holm study3")

for (i in indSES_studies) {
  # Study
  print(i)
  
  #print(unique(df$indSES_new[df$paper_study == i]))
  
  # Ethnicities for each study
  #print(unique(df$ethn[df$paper_study == i]))
  
  # Number of participants from each study
  #print(sum(!is.na(df$indSES_new) & (df$paper_study == i)))
  
  # Age data
  #print(unique(df$age[df$paper_study == i]))
  #print(median(df$age[df$paper_study == i], na.rm=TRUE))
  #print(sd(df$age[df$paper_study == i], na.rm=TRUE))
  
  # Sum of number of entries for actual and ideal HAP for each study
  print(sum(!is.na(df$r.HAP[df$paper_study == i])))
  print(sum(!is.na(df$i.HAP[df$paper_study == i])))
}

# Sum of number of entries for affect
sum(!is.na(df$i.HAP[!is.na(df$indSES_new)]))
sum(!is.na(df$i.LAP[!is.na(df$indSES_new)]))
sum(!is.na(df$i.HAN[!is.na(df$indSES_new)]))
sum(!is.na(df$i.LAN[!is.na(df$indSES_new)]))
sum(!is.na(df$r.HAP[!is.na(df$indSES_new)]))
sum(!is.na(df$r.LAP[!is.na(df$indSES_new)]))
sum(!is.na(df$r.HAN[!is.na(df$indSES_new)]))
sum(!is.na(df$r.LAN[!is.na(df$indSES_new)]))

# Number of participants for indSES from each ethnicity
sum(!is.na(df$indSES_new) & (df$ethn == "European American"))
sum(!is.na(df$indSES_new) & (df$ethn == "Chinese American"))
sum(!is.na(df$indSES_new) & (df$ethn == "Hong Kong Chinese"))
sum(!is.na(df$indSES_new) & (df$ethn == "East Asian American"))
sum(!is.na(df$indSES_new) & (df$ethn == "African American"))
sum(!is.na(df$indSES_new) & (df$ethn == "Other"))
sum(!is.na(df$indSES_new) & (df$ethn == "German + American"))
sum(!is.na(df$indSES_new) & (df$ethn == "Southeast Asian"))
sum(!is.na(df$indSES_new) & (df$ethn == ""))
sum(!is.na(df$indSES_new) & (df$ethn == "Turkish"))
sum(!is.na(df$indSES_new) & (df$ethn == "Swedish"))
sum(!is.na(df$indSES_new) & (df$ethn == "German"))
sum(!is.na(df$indSES_new) & (df$ethn == "British"))
sum(!is.na(df$indSES_new) & (df$ethn == "French"))
sum(!is.na(df$indSES_new) & (df$ethn == "Japanese"))
sum(!is.na(df$indSES_new) & (df$ethn == "Korean"))
sum(!is.na(df$indSES_new) & (df$ethn == "Mexican"))
sum(!is.na(df$indSES_new) & (df$ethn == "Taiwanese"))
sum(!is.na(df$indSES_new) & (df$ethn == "Bulgarian"))
sum(!is.na(df$indSES_new) & (df$ethn == "Russian"))
sum(!is.na(df$indSES_new) & (df$ethn == "Moldovian"))
sum(!is.na(df$indSES_new) & (df$ethn == "Chinese"))
sum(!is.na(df$indSES_new) & (df$ethn == "Multiracial"))
sum(!is.na(df$indSES_new) & (df$ethn == "Asian"))
sum(!is.na(df$indSES_new) & (df$ethn == "Hispanic"))
sum(!is.na(df$indSES_new) & (df$ethn == "Pacific Islander"))

# Gender distribution
sum((df$gender == "M") & !is.na(df$indSES_new))
sum((df$gender == "F") & !is.na(df$indSES_new))
sum((df$gender == "") & !is.na(df$indSES_new))

# Age data
unique(df$age[!is.na(df$indSES_new)])
mean(df$age[!is.na(df$indSES_new)], na.rm=TRUE)
median(df$age[!is.na(df$indSES_new)], na.rm=TRUE)
sd(df$age[!is.na(df$indSES_new) & df$paper_study != "2018 Bencharit study4a"], na.rm=TRUE)
min(df$age[!is.na(df$indSES_new) & df$paper_study != "2018 Bencharit study4a"], na.rm=TRUE)
max(df$age[!is.na(df$indSES_new) & df$paper_study != "2018 Bencharit study4a"], na.rm=TRUE)

# Sum of each ethnicity
sum(!is.na(X_indSES$`European American`$indSES_new))
sum(!is.na(X_indSES$`Asian American`$indSES_new))
sum(!is.na(X_indSES$`East Asian`$indSES_new))
sum(!is.na(X_indSES$`Hong Kong Chinese`$indSES_new))
sum(!is.na(X_indSES$European$indSES_new))

## Analyses

# Create list of studies
affects <- list("r.HAP", "r.LAP", "r.HAN", "r.LAN", "i.HAP", "i.LAP", "i.HAN", "i.LAN", "r.HAP.ips.us", "r.LAP.ips.us", "r.HAN.ips.us", "r.LAN.ips.us", "i.HAP.ips.us", "i.LAP.ips.us", "i.HAN.ips.us", "i.LAN.ips.us")

j = 0
for (i in affects) {
  j = j + 1
  if (j <= 4 | (j >= 9 & j <= 12)) {
    k = j + 4
  } else {
    k = j - 4
  }
  l = affects[[k]]
  
  # Affect
  for (a in 1:10) {
    print("")
  }
  print(i)
  for (a in 1:10) {
    print("")
  }
  #
  # Correlation test
  #print("Correlation test")
  #print(cor.test(df$indSES_new, df[, i]))
  
  # Regression
  for (a in 1:3) {
    print("")
  }
  #print("Regression test")
  #print(summary(lmer(df[, i] ~ indSES_new + (1 | study), data=df)))
  #for (a in 1:3) {
  #  print("")
  #}
  print("Regression test with affect control")
  reg <- lmer(df[, i] ~ indSES_new + df[, l] + (1 | study), data=df)
  print(summary(reg))
  
  #print("Ethnicity")
  #print(summary(lmer(X_indSES$`European American`[, i] ~ indSES_new + (1 | study), data=X_indSES$`European American`)))
  #print(summary(lmer(X_indSES$`European American`[, i] ~ indSES_new + X_indSES$`European American`[, l] + (1 | study), data=X_indSES$`European American`)))
  # print(summary(lmer(X_indSES$`Asian American`[, i] ~ indSES_new + (1 | study), data=X_indSES$`Asian American`)))
  # print(summary(lmer(X_indSES$`Asian American`[, i] ~ indSES_new + X_indSES$`Asian American`[, l] + (1 | study), data=X_indSES$`Asian American`)))
  # print(summary(lm(X_indSES$`East Asian`[, i] ~ indSES_new, data=X_indSES$`East Asian`)))
  # print(summary(lm(X_indSES$`East Asian`[, i] ~ indSES_new + X_indSES$`East Asian`[, l], data=X_indSES$`East Asian`)))
  # print(summary(lmer(X_indSES$`Hong Kong Chinese`[, i] ~ indSES_new + (1 | study), data=X_indSES$`Hong Kong Chinese`)))
  # print(summary(lmer(X_indSES$`Hong Kong Chinese`[, i] ~ indSES_new + X_indSES$`Hong Kong Chinese`[, l] + (1 | study), data=X_indSES$`Hong Kong Chinese`)))
}
rm(a, i, j, k, l, affects)

# Tables
reg1 <- lmer(i.HAP ~ indSES_new + r.HAP + (1 | study), data=df)
# sjPlot:: tab_model(reg)

reg2 <- lmer(i.LAP ~ indSES_new + r.LAP + (1 | study), data=df)

reg3 <- lmer(i.HAN ~ indSES_new + r.HAN + (1 | study), data=df)

reg4 <- lmer(i.LAN ~ indSES_new + r.LAN + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES", "Actual HAP", "Actual LAP", "Actual HAN", "Actual LAN"),
          dv.labels = c("Ideal HAP", "Ideal LAP", "Ideal HAN", "Ideal LAN")
)

reg1 <- lmer(i.HAP ~ indSES_new + (1 | study), data=df)
# sjPlot:: tab_model(reg)

reg2 <- lmer(i.LAP ~ indSES_new + (1 | study), data=df)

reg3 <- lmer(i.HAN ~ indSES_new + (1 | study), data=df)

reg4 <- lmer(i.LAN ~ indSES_new + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES"),
          dv.labels = c("Ideal HAP", "Ideal LAP", "Ideal HAN", "Ideal LAN")
)

reg1 <- lmer(r.HAP ~ indSES_new + i.HAP + (1 | study), data=df)
# sjPlot:: tab_model(reg)

reg2 <- lmer(r.LAP ~ indSES_new + i.LAP + (1 | study), data=df)

reg3 <- lmer(r.HAN ~ indSES_new + i.HAN + (1 | study), data=df)

reg4 <- lmer(r.LAN ~ indSES_new + i.LAN + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES", "Ideal HAP", "Ideal LAP", "Ideal HAN", "Ideal LAN"),
          dv.labels = c("Actual HAP", "Actual LAP", "Actual HAN", "Actual LAN")
)

reg1 <- lmer(r.HAP ~ indSES_new + (1 | study), data=df)
# sjPlot:: tab_model(reg)

reg2 <- lmer(r.LAP ~ indSES_new + (1 | study), data=df)

reg3 <- lmer(r.HAN ~ indSES_new + (1 | study), data=df)

reg4 <- lmer(r.LAN ~ indSES_new + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES"),
          dv.labels = c("Actual HAP", "Actual LAP", "Actual HAN", "Actual LAN")
)

rm(reg, reg1, reg2, reg3, reg4)

# Plots
a <- ggplot(data = df, aes(x = indSES_new, y = i.HAP))
a + geom_jitter(height = 0.5, width = 0.5) + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal HAP")
a + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal HAP")

b <- ggplot(data = df, aes(x = indSES_new, y = i.LAN))
b + geom_jitter(height = 0.5, width = 0.5) + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal LAN")
b + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal HAP")

c <- ggplot(data = df, aes(x = indSES_new, y = i.LAP))
c + geom_jitter(height = 0.5, width = 0.5) + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal LAP")
c + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal LAP")

d <- ggplot(data = df, aes(x = indSES_new, y = i.HAN))
d + geom_jitter(height = 0.5, width = 0.5) + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal HAN")
d + geom_smooth(method = lm) + xlab("Individual SES") + ylab("Ideal HAN")

rm(a, b, c, d, affects)



### indincome

## Create new variables indincome_new and ethn_new_indincome for analysis

# indincome studies with values:
# 2014 Koopman-Holm study2 (USD: 1 - 0-10,000; 2 - 10,001-20,000; 3 - 20,001-30,000; 4 - 30,001-40,000; 5 - 40,0001-50,000; 6 - 50,001-75,000; 7 - 75,001-100,000; 8 - 100,000+)
# 2014 Mannell study1 (Canadian dollars: 1 - 0-50,000; 2 - 50,000-99,999; 3 - 100,000+)
# 2018 Ito study1 (Japanese yen: 0 - 0-2,500,00; 1 - 2,500,000-7,500,000; 2 - 7,500,000+)
# 2018 Bencharit study3 (1 - 9)
# 2018 Bencharit study4a (1 - 12)
# 2013 Koopman-Holm study2 (USD: 1 - 0-10,000; 2 - 10,001-20,000; 3 - 20,001-30,000; 4 - 30,001-40,000; 5 - 40,001-50,000; 6 - 50,001-75,000; 8 - 100,000+; 999 - idk)
# 2013 Scheibe study1 (1 - 5 SES scale)
# 2014 Luong study1 (USD: 1 - 0-10,000; 2 - 10,000-19,999; 3 - 20,000-29,999; 4 - 30,000-39,999; 5 - 40,000-49,999; 6 - 50,000-59,999; 7 - 60,000-69,999; 8 - 70,000-79,999; 9 - 80,000-89,999; 10 - 90,000-99,999; 11 - 100,000+)
# 2019 Palmer study1 (USD input)
# 2016 Ito study1 (1 = under 1,999,999 yen, 2 = 2,000,000 yen - 3,999,999 yen, 3 = 4,000,000 yen - 5,999,999 yen, 4 = 6,000,000 yen - 7,999,999 yen, 5 = 8,000,000 yen - 9,999,999 yen, 6 = 10,000,000 yen - 11,999,999 yen, 7 = 12,000,000 yen - 14,999,999 yen, 8 = 15,000,000 yen - 19,999,999 yen, 9 = Over 20,000,000 yen, 10 = Don't know.)
# Unpublished Ito Kono study1 (1 = under 1,999,999 yen, 2 = 2,000,000 yen - 3,999,999 yen, 3 = 4,000,000 yen - 5,999,999 yen, 4 = 6,000,000 yen - 7,999,999 yen, 5 = 8,000,000 yen - 9,999,999 yen, 6 = 10,000,000 yen - 11,999,999 yen, 7 = 12,000,000 yen - 14,999,999 yen, 8 = 15,000,000 yen - 19,999,999 yen, 9 = Over 20,000,000 yen, 10 = Don't know.)
# 2019 Tsai
# 2016 Da Jiang LTP study11 - (unsure currency; 1 - 80,000; 2 - 80,001-160,000; 3 - 160,001-240,000; 4 - 240,001-320,000; 5 - 320,001-400,000; 6 - 400,001-600,000; 7 - 600,0001+)
# 2016 Da Jiang LTP study2 - (HKD; 1 - 0-5,000; 2 - 5,000-10,000; 3 - 10,001-20,000; 4 - 20,001-30,000; 5 - 30,001+)
# 2016 Da Jiang FTP study3 - (HKD; 1 - 0-5,000; 2 - 5,000-10,000; 3 - 10,001-20,000; 4 - 20,001-30,000; 5 - 30,001+)
# 2016 Da Jiang FTP study1 - (unsure currency; 1 - 80,000; 2 - 80,001-160,000; 3 - 160,001-240,000; 4 - 240,001-320,000; 5 - 320,001-400,000; 6 - 400,001-600,000; 7 - 600,0001+)

# Create new column "paper_study"
#df <- transform(df, paper_study=paste(paper, study, sep=" "))

# Create new variable for analysis
df$indincome_new <- df$indincome

# Remove commas
df$indincome_new <- gsub(",", "", df$indincome_new)

# Regex to just keep numbers and decimals
df$indincome_new <- unlist(sapply(regmatches(df$indincome_new, gregexpr("[[:digit:]]+\\.*[[:digit:]]*", df$indincome_new)), function(x) { ifelse(identical(character(0), x), NA, x)}))

# Convert to numeric
df$indincome_new <- as.numeric(as.character(df$indincome_new))

# Exclude 2013 Scheibe study1 as it's actually indSES
df$indincome_new[df$paper_study == "2013 Scheibe study1"] <- NA

# Still missing 2018 Bencharit study 3 and 4a
# Convert all to USD by PPP in 2015, use midpoints
df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2014 Koopman-Holm study2"), 5000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2014 Koopman-Holm study2"), 15000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2014 Koopman-Holm study2"), 25000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2014 Koopman-Holm study2"), 35000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2014 Koopman-Holm study2"), 45000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2014 Koopman-Holm study2"), 62500, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2014 Koopman-Holm study2"), 87500, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 8 & df$paper_study == "2014 Koopman-Holm study2"), 200000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 9 & df$paper_study == "2014 Koopman-Holm study2"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2014 Mannell study1"), 25000*(1/1.248004), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2014 Mannell study1"), 75000*(1/1.248004), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2014 Mannell study1"), 200000*(1/1.248004), df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 0 & df$paper_study == "2018 Ito study1"), (1/103.449739)*1250000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2018 Ito study1"), (1/103.449739)*5000000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2018 Ito study1"), (1/103.449739)*15000000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2018 Ito study1"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2014 Luong study1"), 5000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2014 Luong study1"), 15000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2014 Luong study1"), 25000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2014 Luong study1"), 35000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2014 Luong study1"), 45000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2014 Luong study1"), 55000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2014 Luong study1"), 65000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 8 & df$paper_study == "2014 Luong study1"), 75000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 9 & df$paper_study == "2014 Luong study1"), 85000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 10 & df$paper_study == "2014 Luong study1"), 95000, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 11 & df$paper_study == "2014 Luong study1"), 200000, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 0 & df$paper_study == "2016 Da Jiang LTP study11"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2016 Da Jiang LTP study11"), 40000*(1/5.831053257), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2016 Da Jiang LTP study11"), 120000*(1/5.831053257), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2016 Da Jiang LTP study11"), 200000*(1/5.831053257), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2016 Da Jiang LTP study11"), 280000*(1/5.831053257), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2016 Da Jiang LTP study11"), 360000*(1/5.831053257), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2016 Da Jiang LTP study11"), 500000*(1/5.831053257), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2016 Da Jiang LTP study11"), 1200000*(1/5.831053257), df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2016 Da Jiang LTP study2"), 2500*(1/5.831053257)*12, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2016 Da Jiang LTP study2"), 7500*(1/5.831053257)*12, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2016 Da Jiang LTP study2"), 15000*(1/5.831053257)*12, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2016 Da Jiang LTP study2"), 25000*(1/5.831053257)*12, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2016 Da Jiang LTP study2"), 60000*(1/5.831053257)*12, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2016 Da Jiang LTP study2"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2016 Da Jiang LTP study2"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2016 Ito study1"), 1000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2016 Ito study1"), 3000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2016 Ito study1"), 5000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2016 Ito study1"), 7000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2016 Ito study1"), 9000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2016 Ito study1"), 11000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2016 Ito study1"), 13000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 8 & df$paper_study == "2016 Ito study1"), 17500000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 9 & df$paper_study == "2016 Ito study1"), 40000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 10 & df$paper_study == "2016 Ito study1"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 8 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 9 & df$paper_study == "2018 Bencharit study3"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 8 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 9 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 10 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 11 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 12 & df$paper_study == "2018 Bencharit study4a"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new < 10000 & df$paper_study == "2019 Palmer study1"), NA, df$indincome_new)

df$indincome_new <- ifelse((df$indincome_new == 1 & df$paper_study == "Unpublished Ito Kono study1"), 1000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 2 & df$paper_study == "Unpublished Ito Kono study1"), 3000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 3 & df$paper_study == "Unpublished Ito Kono study1"), 5000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 4 & df$paper_study == "Unpublished Ito Kono study1"), 7000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 5 & df$paper_study == "Unpublished Ito Kono study1"), 9000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 6 & df$paper_study == "Unpublished Ito Kono study1"), 11000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 7 & df$paper_study == "Unpublished Ito Kono study1"), 13000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 8 & df$paper_study == "Unpublished Ito Kono study1"), 17500000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 9 & df$paper_study == "Unpublished Ito Kono study1"), 40000000*(1/103.449739), df$indincome_new)
df$indincome_new <- ifelse((df$indincome_new == 10 & df$paper_study == "Unpublished Ito Kono study1"), NA, df$indincome_new)

# Create ethn_new_indincome to categorize the studies' ethnicities for analysis
df$ethn_new_indincome <- "Other"
df$ethn_new_indincome[df$ethn == "European American"] = "European American"
df$ethn_new_indincome[df$ethn == "Chinese American" | df$ethn == "East Asian American"] = "Asian American"
df$ethn_new_indincome[df$ethn == "Japanese" | df$ethn == "Korean" | df$ethn == "Taiwanese" | df$ethn == "Chinese"] = "East Asian"
df$ethn_new_indincome[df$ethn == "Hong Kong Chinese"] = "Hong Kong Chinese"
df$ethn_new_indincome[df$ethn == "Turkish" | df$ethn == "Swedish" | df$ethn == "German" | df$ethn == "British" | df$ethn == "French" | df$ethn == "Bulgarian" | df$ethn == "Russian" | df$ethn == "Moldovian"] = "European"
X_indincome <- split(df, df$ethn_new_indincome)

## Demographics

# Studies having indincome
unique(df$paper_study[!is.na(df$indincome_new)])

# Values in indincome
unique(df$indincome_new)

# Total number of participants
sum(!is.na(df$indincome_new))

# Mean and SD of indincome
mean(df$indincome_new, na.rm=TRUE)
median(df$indincome_new, na.rm=TRUE)
sd(df$indincome_new, na.rm=TRUE)

# Gender distribution
sum((df$gender == "M") & !is.na(df$indincome_new))
sum((df$gender == "F") & !is.na(df$indincome_new))
sum((df$gender == "") & !is.na(df$indincome_new))

indincome_studies <- list("2014 Luong study1", "2014 Mannell study1", "2014 Koopman-Holm study2", "2016 Da Jiang LTP study11", "2016 Da Jiang LTP study2", "2016 Ito study1", "2018 Ito study1", "2019 Palmer study1", "Unpublished Ito Kono study1")

for (i in indincome_studies) {
  # Study
  print(i)
  
  # Age distribution
  #print(unique(df$age[df$paper_study == i][which(!is.na(df$age[df$paper_study == i]))]))
  #print(median(df$age[df$paper_study == i][which(!is.na(df$age[df$paper_study == i]))]))
  #print(mean(df$age[df$paper_study == i][which(!is.na(df$age[df$paper_study == i]))]))
  
  # Ethnicities
  #print(unique(df$ethn[df$paper_study == i]))
  
  # Number of participants
  #print(sum(!is.na(df$indincome_new) & (df$paper_study == i)))
  
  # Sum of number of entries for actual and ideal HAP for each study
  #print(sum(!is.na(df$r.HAP[df$paper_study == i])))
  #print(sum(!is.na(df$i.HAP[df$paper_study == i])))
}

# Age distribution
unique(df$age[!is.na(df$indincome_new)])
mean(df$age[!is.na(df$indincome_new)], na.rm=TRUE)
median(df$age[!is.na(df$indincome_new)], na.rm=TRUE)
sd(df$age[!is.na(df$indincome_new)], na.rm=TRUE)
min(df$age[!is.na(df$indincome_new)], na.rm=TRUE)
max(df$age[!is.na(df$indincome_new)], na.rm=TRUE)

# All ethnicities
unique(df$ethn[!is.na(df$indincome_new)])

# Sum of each ethnicity
sum(!is.na(X_indincome$`European American`$indincome_new))
sum(!is.na(X_indincome$`Asian American`$indincome_new))
sum(!is.na(X_indincome$`East Asian`$indincome_new))
sum(!is.na(X_indincome$`Hong Kong Chinese`$indincome_new))
sum(!is.na(X_indincome$European$indincome_new))

## Analyses

# Create list of studies
affects <- list("r.HAP", "r.LAP", "r.HAN", "r.LAN", "i.HAP", "i.LAP", "i.HAN", "i.LAN", "r.HAP.ips.us", "r.LAP.ips.us", "r.HAN.ips.us", "r.LAN.ips.us", "i.HAP.ips.us", "i.LAP.ips.us", "i.HAN.ips.us", "i.LAN.ips.us")

j = 0
for (i in affects) {
  j = j + 1
  if (j <= 4 | (j >= 9 & j <= 12)) {
    k = j + 4
  } else {
    k = j - 4
  }
  l = affects[[k]]
  
  # Affect
  for (a in 1:10) {
    print("")
  }
  print(i)
  for (a in 1:10) {
    print("")
  }
  
  # # Correlation test
  print("Correlation test")
  print(cor.test(df$indincome_new, df[, i]))
  
  # # Regression
  # for (a in 1:3) {
  #   print("")
  # }
  # print("Regression test")
  # print(summary(lmer(df[, i] ~ indincome_new + (1 | study), data=df)))
  # for (a in 1:3) {
  #   print("")
  # }
  # print("Regression test with affect control")
  # print(summary(lmer(df[, i] ~ indincome_new + df[, l] + (1 | study), data=df)))
  # for (a in 1:3) {
  #   print("")
  # }
  print("Ethnicity")
  #print(summary(lm(X_indincome$`European American`[, i] ~ indincome_new, data=X_indincome$`European American`)))
  #print(summary(lm(X_indincome$`European American`[, i] ~ indincome_new + X_indincome$`European American`[, l], data=X_indincome$`European American`)))
  #print(summary(lmer(X_indincome$`Hong Kong Chinese`[, i] ~ indincome_new + (1 | study), data=X_indincome$`Hong Kong Chinese`)))
  #print(summary(lmer(X_indincome$`Hong Kong Chinese`[, i] ~ indincome_new + X_indincome$`Hong Kong Chinese`[, l] + (1 | study), data=X_indincome$`Hong Kong Chinese`)))
}
rm(a, i, j, k, l)



### famincome

## Create new variables famincome_new and ethn_new_famincome for analysis

# famincome studies with values:
# 2013 Koopman-Holm study2 (USD: 1 - 0-10,000; 2 - 10,001-20,000; 3 - 20,001-30,000; 4 - 30,001-40,000; 5 - 40,001-50,000; 6 - 50,001-75,000; 8 - 100,000+; 999 - idk)
# 2014 Koopman-Holm study2 (USD: 1 - 0-10,000; 2 - 10,001-20,000; 3 - 20,001-30,000; 4 - 30,001-40,000; 5 - 40,001-50,000; 6 - 50,001-75,000; 8 - 100,000+; 999 - idk)
# 2018 Tompson study1 (USD: 1=<40K, 2=40K-60K, 3=60K-80K, 4=80K-100K, 5=100K-120K, 6=120K-140K, 7=140K-160K, 8=>$60K)
# 2018 Swerdlow study2 (USD: 1 - 0-10,000; 2 - 10,001-15,000; 3 - 15,001-25,000; 4 - 25,001-50,000; 5 - 50,001-75,000; 6 - 75,001-100,000; 7 - 100,001-150,000; 8 - 150,000+; 9 - idk)
# 2019 Palmer study1 (USD input)
# 2018 Gentzler (USD: 1 - 0-10,000; 2 - 10,000-20,000; 3 - 20,000-30,000; 4 - 30,000-40,000; 5 - 40,000-50,000; 6 - 50,000-60,000; 7 - 60,000-70,000; 8 - 70,000-80,000; 9 - 80,000-90,000; 10 - 90,000-100,000; 11 - 100,000-150,000; 12 - 150,000+)
# Unpublished Palmer study1 (USD: 1 - 0-10,000; 2 - 10,000-20,000; 3 - 20,000-40,000; 4 - 40,000-60,000; 5 - 60,000-80,000; 6 - 80,000-100,000; 7 - 100-000+)
# 2016 Ito study1 (1 = under 1,999,999 yen, 2 = 2,000,000 yen - 3,999,999 yen, 3 = 4,000,000 yen - 5,999,999 yen, 4 = 6,000,000 yen - 7,999,999 yen, 5 = 8,000,000 yen - 9,999,999 yen, 6 = 10,000,000 yen - 11,999,999 yen, 7 = 12,000,000 yen - 14,999,999 yen, 8 = 15,000,000 yen - 19,999,999 yen, 9 = Over 20,000,000 yen, 10 = Don't know.)
# Unpublished Ito Kono study1 (1 = under 1,999,999 yen, 2 = 2,000,000 yen - 3,999,999 yen, 3 = 4,000,000 yen - 5,999,999 yen, 4 = 6,000,000 yen - 7,999,999 yen, 5 = 8,000,000 yen - 9,999,999 yen, 6 = 10,000,000 yen - 11,999,999 yen, 7 = 12,000,000 yen - 14,999,999 yen, 8 = 15,000,000 yen - 19,999,999 yen, 9 = Over 20,000,000 yen, 10 = Don't know.)
# Unpublished Ito Yamaguchi Takamatsu study1 (Yen: 1 - 0-2,500,000; 2 - 2,500,000-5,000,000; 3 - 5,000,000-7,500,000; 4 - 7,500,000-10,000,000; 5 - 10,000,000+; 6 - NA)
# Unpublished Ito Mika study1 (Yen: 1 - 0-2,500,000; 2 - 2,500,000-5,000,000; 3 - 5,000,000-7,500,000; 4 - 7,500,000-10,000,000; 5 - 10,000,000+; 6 - NA)
# Unpublished Samanez-Larkin agerl study1 (already sorted into buckets)
# 2017 Oosterhoff study1 (USD: 1 - 0-11,999; 2 - 12,000-24,999; 3 - 25,000-49,999; 4 - 50,000-74,999; 5 - 75,000-99,999; 6 - 100,000-149,999; 7 - 150,000+; 8 - Prefer not to answer)
# 2016 Da Jiang LTP study11 - (Unknown currency, maybe yuan; 1 - 80,000; 2 - 80,001-160,000; 3 - 160,001-240,000; 4 - 240,001-320,000; 5 - 320,001-400,000; 6 - 400,001-600,000; 7 - 600,0001+)
# 2014 Mortazavi study1 (USD: 1 - 0-15k; 2 - 15-30k; 3 - 30-45k; 4 - 45-60k; 5 - 60-75k; 6 - 75k+; 7 - Prefer not to answer)
# 2016 Da Jiang LTP study2 - (HKD; 1 - 0-5,000; 2 - 5,000-10,000; 3 - 10,001-20,000; 4 - 20,001-30,000; 5 - 30,001+)
# 2016 Da Jiang FTP study3 - (HKD; 1 - 0-5,000; 2 - 5,000-10,000; 3 - 10,001-20,000; 4 - 20,001-30,000; 5 - 30,001+)
# 2016 Da Jiang FTP study1 - (unsure currency; 1 - 80,000; 2 - 80,001-160,000; 3 - 160,001-240,000; 4 - 240,001-320,000; 5 - 320,001-400,000; 6 - 400,001-600,000; 7 - 600,0001+)

# Create new column "paper_study"
#df <- transform(df, paper_study=paste(paper, study, sep=" "))

# Create new variable for analysis
df$famincome_new <- df$famincome

# Remove commas
df$famincome_new <- gsub(",","",df$famincome_new)

# Regex to just keep numbers and decimals
df$famincome_new <- unlist(sapply(regmatches(df$famincome_new, gregexpr("[[:digit:]]+\\.*[[:digit:]]*", df$famincome_new)), function(x) { ifelse(identical(character(0), x), NA, x)}))

# Convert to numeric
df$famincome_new <- as.numeric(as.character(df$famincome_new))

# Convert all to USD by PPP in 2015, use midpoints
df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2014 Koopman-Holm study2"), 5000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2014 Koopman-Holm study2"), 15000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2014 Koopman-Holm study2"), 25000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2014 Koopman-Holm study2"), 35000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2014 Koopman-Holm study2"), 45000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2014 Koopman-Holm study2"), 62500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2014 Koopman-Holm study2"), 87500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2014 Koopman-Holm study2"), 200000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 9 & df$paper_study == "2014 Koopman-Holm study2"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 0 & df$paper_study == "2016 Da Jiang LTP study11"), NA, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2016 Da Jiang LTP study11"), 40000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2016 Da Jiang LTP study11"), 120000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2016 Da Jiang LTP study11"), 200000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2016 Da Jiang LTP study11"), 280000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2016 Da Jiang LTP study11"), 360000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2016 Da Jiang LTP study11"), 500000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2016 Da Jiang LTP study11"), 1200000*0.13, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2016 Da Jiang LTP study11"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2016 Da Jiang LTP study2"), 2500*0.13*12, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2016 Da Jiang LTP study2"), 7500*0.13*12, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2016 Da Jiang LTP study2"), 15000*0.13*12, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2016 Da Jiang LTP study2"), 25000*0.13*12, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2016 Da Jiang LTP study2"), 60000*0.13*12, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2016 Da Jiang LTP study2"), NA, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2016 Da Jiang LTP study2"), NA, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2016 Da Jiang LTP study2"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2016 Ito study1"), 1000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2016 Ito study1"), 3000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2016 Ito study1"), 5000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2016 Ito study1"), 7000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2016 Ito study1"), 9000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2016 Ito study1"), 11000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2016 Ito study1"), 13000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2016 Ito study1"), 17500000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 9 & df$paper_study == "2016 Ito study1"), 40000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 10 & df$paper_study == "2016 Ito study1"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "Unpublished Ito Kono study1"), 1000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "Unpublished Ito Kono study1"), 3000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "Unpublished Ito Kono study1"), 5000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "Unpublished Ito Kono study1"), 7000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "Unpublished Ito Kono study1"), 9000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "Unpublished Ito Kono study1"), 11000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "Unpublished Ito Kono study1"), 13000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "Unpublished Ito Kono study1"), 17500000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 9 & df$paper_study == "Unpublished Ito Kono study1"), 40000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 10 & df$paper_study == "Unpublished Ito Kono study1"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), 1250000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), 3750000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), 6250000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), 8750000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), 20000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), NA, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "Unpublished Ito Yamaguchi Takamatsu study1"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "Unpublished Ito Mika study1"), 1250000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "Unpublished Ito Mika study1"), 3750000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "Unpublished Ito Mika study1"), 6250000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "Unpublished Ito Mika study1"), 8750000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "Unpublished Ito Mika study1"), 20000000*0.0095, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "Unpublished Ito Mika study1"), NA, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "Unpublished Ito Mika study1"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2017 Oosterhoff study1"), 6000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2017 Oosterhoff study1"), 18500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2017 Oosterhoff study1"), 37500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2017 Oosterhoff study1"), 62500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2017 Oosterhoff study1"), 87500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2017 Oosterhoff study1"), 125000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2017 Oosterhoff study1"), 300000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2017 Oosterhoff study1"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2018 Gentzler study1"), 5000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2018 Gentzler study1"), 15000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2018 Gentzler study1"), 25000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2018 Gentzler study1"), 35000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2018 Gentzler study1"), 45000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2018 Gentzler study1"), 55000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2018 Gentzler study1"), 65000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2018 Gentzler study1"), 75000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 9 & df$paper_study == "2018 Gentzler study1"), 85000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 10 & df$paper_study == "2018 Gentzler study1"), 95000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 11 & df$paper_study == "2018 Gentzler study1"), 125000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 12 & df$paper_study == "2018 Gentzler study1"), 300000, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2018 Swerdlow study2"), 5000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2018 Swerdlow study2"), 12500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2018 Swerdlow study2"), 20000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2018 Swerdlow study2"), 37500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2018 Swerdlow study2"), 62500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2018 Swerdlow study2"), 87500, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2018 Swerdlow study2"), 125000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2018 Swerdlow study2"), 300000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 9 & df$paper_study == "2018 Swerdlow study2"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "2018 Tompson study1"), 20000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "2018 Tompson study1"), 50000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "2018 Tompson study1"), 70000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "2018 Tompson study1"), 90000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "2018 Tompson study1"), 110000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "2018 Tompson study1"), 130000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "2018 Tompson study1"), 150000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "2018 Tompson study1"), 320000, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new < 10000 & df$paper_study == "2019 Palmer study1"), NA, df$famincome_new)

df$famincome_new <- ifelse((df$famincome_new == 1 & df$paper_study == "Unpublished Palmer study1"), 5000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 2 & df$paper_study == "Unpublished Palmer study1"), 15000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 3 & df$paper_study == "Unpublished Palmer study1"), 30000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 4 & df$paper_study == "Unpublished Palmer study1"), 50000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 5 & df$paper_study == "Unpublished Palmer study1"), 70000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 6 & df$paper_study == "Unpublished Palmer study1"), 90000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 7 & df$paper_study == "Unpublished Palmer study1"), 200000, df$famincome_new)
df$famincome_new <- ifelse((df$famincome_new == 8 & df$paper_study == "Unpublished Palmer study1"), NA, df$famincome_new)

# Create ethn_new_famincome to categorize the studies' ethnicities for analysis
df$ethn_new_famincome <- "Other"
df$ethn_new_famincome[df$ethn == "European American"] = "European American"
df$ethn_new_famincome[df$ethn == "Chinese American"  | df$ethn == "East Asian American"] = "Asian American"
df$ethn_new_famincome[df$ethn == "Japanese" | df$ethn == "Korean" | df$ethn == "Taiwanese" | df$ethn == "Chinese" | df$ethn == "East Asian"] = "East Asian"
df$ethn_new_famincome[df$ethn == "Hong Kong Chinese"] = "Hong Kong Chinese"
X_famincome <- split(df, df$ethn_new_famincome)

# Divide family income by 1,000
df$famincome_new <- df$famincome_new / 10000

## Demographics

# Studies having famincome
unique(df$paper_study[!is.na(df$famincome_new)])

# Values in famincome
unique(df$famincome_new)

# Total number of participants
sum(!is.na(df$famincome_new))

# Mean and SD of indincome
mean(df$famincome_new, na.rm=TRUE)
median(df$famincome_new, na.rm=TRUE)
sd(df$famincome_new, na.rm=TRUE)

# Gender distribution
sum((df$gender == "M") & !is.na(df$famincome_new))
sum((df$gender == "F") & !is.na(df$famincome_new))
sum((df$gender == "") & !is.na(df$famincome_new))

famincome_studies <- list("2014 Koopman-Holm study2", "2016 Da Jiang LTP study11", "2016 Da Jiang LTP study2", "2016 Ito study1", "2017 Oosterhoff study1", "2018 Gentzler study1", "2018 Swerdlow study2", "2018 Tompson study1", "2019 Palmer study1", "Unpublished Ito Kono study1", "Unpublished Ito Mika study1", "Unpublished Ito Yamaguchi Takamatsu study1", "Unpublished Palmer study1", "Unpublished Samanez-Larkin agerl study1")

for (i in famincome_studies) {
  # Study
  print(i)
  
  # Age distribution
  #print(unique(df$age[df$paper_study == i][which(!is.na(df$age[df$paper_study == i]))]))
  #print(median(df$age[df$paper_study == i][which(!is.na(df$age[df$paper_study == i]))]))
  #print(mean(df$age[df$paper_study == i][which(!is.na(df$age[df$paper_study == i]))]))
  
  # Ethnicities
  print(unique(df$ethn[df$paper_study == i]))
  
  # Number of participants
  #print(sum(!is.na(df$famincome_new) & (df$paper_study == i)))
  
  # Sum of number of entries for actual and ideal HAP for each study
  #print(sum(!is.na(df$r.HAP[df$paper_study == i])))
  #print(sum(!is.na(df$i.HAP[df$paper_study == i])))
}

# Age distribution
unique(df$age[!is.na(df$famincome_new)])
mean(df$age[!is.na(df$famincome_new)], na.rm=TRUE)
median(df$age[!is.na(df$famincome_new)], na.rm=TRUE)
sd(df$age[!is.na(df$famincome_new)], na.rm=TRUE)
min(df$age[!is.na(df$famincome_new)], na.rm=TRUE)
max(df$age[!is.na(df$famincome_new)], na.rm=TRUE)

# All ethnicities
unique(df$ethn[!is.na(df$famincome_new)])

# Sum of each ethnicity
sum(!is.na(X_famincome$`European American`$famincome_new))
sum(!is.na(X_famincome$`Asian American`$famincome_new))
sum(!is.na(X_famincome$`East Asian`$famincome_new))
sum(!is.na(X_famincome$`Hong Kong Chinese`$famincome_new))

## Analyses

# Create list of studies
affects <- list("r.HAP", "r.LAP", "r.HAN", "r.LAN", "i.HAP", "i.LAP", "i.HAN", "i.LAN", "r.HAP.ips.us", "r.LAP.ips.us", "r.HAN.ips.us", "r.LAN.ips.us", "i.HAP.ips.us", "i.LAP.ips.us", "i.HAN.ips.us", "i.LAN.ips.us")

j = 0
for (i in affects) {
  j = j + 1
  if (j <= 4 | (j >= 9 & j <= 12)) {
    k = j + 4
  } else {
    k = j - 4
  }
  l = affects[[k]]
  
  # Affect
  for (a in 1:10) {
    print("")
  }
  print(i)
  for (a in 1:10) {
    print("")
  }
  
  # Correlation test
  #print("Correlation test")
  #print(cor.test(df$famincome_new, df[, i]))
  
  # Regression
  for (a in 1:3) {
    print("")
  }
  print("Regression test")
  print(summary(lmer(df[, i] ~ famincome_new + (1 | study), data=df)))
  for (a in 1:3) {
    print("")
  }
  # print("Regression test with affect control")
  #print(summary(lmer(df[, i] ~ famincome_new + df[, l] + (1 | study), data=df)))
  #for (a in 1:3) {
  #   print("")
  #}
  #print("Ethnicity")
  #print(summary(lm(X_famincome$`European American`[, i] ~ famincome_new, data=X_famincome$`European American`)))
  #print(summary(lm(X_famincome$`European American`[, i] ~ famincome_new + X_famincome$`European American`[, l] , data=X_famincome$`European American`)))
  #print(summary(lmer(X_famincome$`Hong Kong Chinese`[, i] ~ famincome_new + (1 | study), data=X_famincome$`Hong Kong Chinese`)))
  #print(summary(lm(X_famincome$`Hong Kong Chinese`[, i] ~ famincome_new + X_famincome$`Hong Kong Chinese`[, l], data=X_famincome$`Hong Kong Chinese`)))
  #print(summary(lmer(X_famincome$`East Asian`[, i] ~ famincome_new + (1 | study), data=X_famincome$`East Asian`)))
  #print(summary(lmer(X_famincome$`East Asian`[, i] ~ famincome_new + X_famincome$`East Asian`[, l] + (1 | study), data=X_famincome$`East Asian`)))
}
rm(a, i, j, k, l)

# Tables
reg1 <- lmer(i.HAP ~ famincome_new + r.HAP + (1 | study), data=df)

reg2 <- lmer(i.LAP ~ famincome_new + r.LAP + (1 | study), data=df)

reg3 <- lmer(i.HAN ~ famincome_new + r.HAN + (1 | study), data=df)

reg4 <- lmer(i.LAN ~ famincome_new + r.LAN + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "Family Income", "Actual HAP", "Actual LAP", "Actual HAN", "Actual LAN"),
          dv.labels = c("Ideal HAP", "Ideal LAP", "Ideal HAN", "Ideal LAN")
)

reg1 <- lmer(i.HAP ~ indSES_new + (1 | study), data=df)

reg2 <- lmer(i.LAP ~ indSES_new + (1 | study), data=df)

reg3 <- lmer(i.HAN ~ indSES_new + (1 | study), data=df)

reg4 <- lmer(i.LAN ~ indSES_new + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES"),
          dv.labels = c("Ideal HAP", "Ideal LAP", "Ideal HAN", "Ideal LAN")
)

reg1 <- lmer(r.HAP ~ indSES_new + i.HAP + (1 | study), data=df)

reg2 <- lmer(r.LAP ~ indSES_new + i.LAP + (1 | study), data=df)

reg3 <- lmer(r.HAN ~ indSES_new + i.HAN + (1 | study), data=df)

reg4 <- lmer(r.LAN ~ indSES_new + i.LAN + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES", "Ideal HAP", "Ideal LAP", "Ideal HAN", "Ideal LAN"),
          dv.labels = c("Actual HAP", "Actual LAP", "Actual HAN", "Actual LAN")
)

reg1 <- lmer(r.HAP ~ indSES_new + (1 | study), data=df)

reg2 <- lmer(r.LAP ~ indSES_new + (1 | study), data=df)

reg3 <- lmer(r.HAN ~ indSES_new + (1 | study), data=df)

reg4 <- lmer(r.LAN ~ indSES_new + (1 | study), data=df)

tab_model(reg1, reg2, reg3, reg4,
          pred.labels = c("Intercept", "SES"),
          dv.labels = c("Actual HAP", "Actual LAP", "Actual HAN", "Actual LAN")
)

rm(reg1, reg2, reg3, reg4, affects)