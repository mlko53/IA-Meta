# Meta-analysis data
df <- read.csv("./std_pt1_data.csv", fileEncoding="latin1")

# GDP per capita, PPP, year, country
df1 <- read.csv("./World Bank/API_NY.GDP.PCAP.PP.CD_DS2_en_csv_v2_1345144.csv", skip = 4)
# Unemployment
df2 <- read.csv("./World Bank Unemployment/API_SL.UEM.TOTL.ZS_DS2_en_csv_v2_1429165.csv", skip = 4)
# Consumer price index
df3 <- read.csv("./World Bank Consumer price index/API_FP.CPI.TOTL_DS2_en_csv_v2_1429287.csv", skip = 4)

# SES
# famSES, famincome, finanindep, indSES, indincome, educ
# Do two categories of analysis: one group with 7 studies of indSES 1-5 lower income-upper income, and one group analyzing famincome and indincome
# Use midpoints for second group to group all together
# Convert all to USD with PPP



# Economic Analysis

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

df1_new <- df1[, c(1, 45:64)]
colnames(df1_new)[1] <- "country"
df2_new <- df2[, c(1, 45:64)]
colnames(df2_new)[1] <- "country"
df3_new <- df3[, c(1, 45:64)]
colnames(df3_new)[1] <- "country"

df_final <- merge(df, df1_new, by=c("country"))
df_final <- merge(df_final, df2_new, by=c("country"))
df_final <- merge(df_final, df3_new, by=c("country"))
df_final$collected_year_new <- trunc(df_final$collected_year)
df_final$collected_year_new[is.na(df_final$collected_year_new)] <- 0

df_final$year_GDP_per_capita <- NA
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2002", df_final$X2002.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2003", df_final$X2003.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2004", df_final$X2004.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2005", df_final$X2005.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2006", df_final$X2006.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2007", df_final$X2007.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2008", df_final$X2008.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2009", df_final$X2009.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2010", df_final$X2010.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2011", df_final$X2011.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2012", df_final$X2012.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2013", df_final$X2013.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2014", df_final$X2014.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2015", df_final$X2015.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2016", df_final$X2016.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2017", df_final$X2017.x, df_final$year_GDP_per_capita)
df_final$year_GDP_per_capita <- ifelse(df_final$collected_year_new == "2018", df_final$X2018.x, df_final$year_GDP_per_capita)

df_final$year_unemployment <- NA
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2002", df_final$X2002.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2003", df_final$X2003.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2004", df_final$X2004.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2005", df_final$X2005.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2006", df_final$X2006.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2007", df_final$X2007.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2008", df_final$X2008.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2009", df_final$X2009.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2010", df_final$X2010.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2011", df_final$X2011.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2012", df_final$X2012.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2013", df_final$X2013.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2014", df_final$X2014.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2015", df_final$X2015.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2016", df_final$X2016.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2017", df_final$X2017.y, df_final$year_unemployment)
df_final$year_unemployment <- ifelse(df_final$collected_year_new == "2018", df_final$X2018.y, df_final$year_unemployment)

df_final$year_CPI <- NA
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2002", df_final$X2002, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2003", df_final$X2003, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2004", df_final$X2004, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2005", df_final$X2005, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2006", df_final$X2006, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2007", df_final$X2007, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2008", df_final$X2008, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2009", df_final$X2009, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2010", df_final$X2010, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2011", df_final$X2011, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2012", df_final$X2012, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2013", df_final$X2013, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2014", df_final$X2014, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2015", df_final$X2015, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2016", df_final$X2016, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2017", df_final$X2017, df_final$year_CPI)
df_final$year_CPI <- ifelse(df_final$collected_year_new == "2018", df_final$X2018, df_final$year_CPI)

write.csv(df_final, "std_pt2_data.csv", row.names = FALSE)