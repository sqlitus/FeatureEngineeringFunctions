#### Notes ####


### create package
library(roxygen2); library(devtools)
getwd(); dir()   # reference
# devtools::create("packageNameHere")  # creates package directories & files


### Create & document functions
# (then create function w/ documentation & save in the 'R' directory...)
devtools::document(paste0(normalizePath(getwd()), "\\R"))  # run this function to document files in R folder
# (NOTE: need a new NAMESPACE file generated to update intellisense. delete old one manually if necessary.)


### Install/load package
# install("packageNameHere")  # only run once
library(FeatureEngineeringFunctions)  # finally load it
# devtools::install_github(repo = "packageNameHere", "githubname")  # or install from github

### Use package functions. Reload for intellisense
FeatureEngineeringFunctions::fef_SSCO_Categories()
?FeatureEngineeringFunctions::fef_SSCO_Categories()
FeatureEngineeringFunctions::tableau_SSCO_Categories(c("here is offline thing", "here lane shut down"))





### test typing
library(tidyverse); library(FeatureEngineeringFunctions)

df <- readxl::read_excel(path = "C:\\Work\\Requests\\Wes Crawford & Navina & Vicki I guess\\Copy of SSCOAnalysis (002).xlsx",
                         sheet = "Data"
                         )

df_new <- fef_SSCO_Categories(df, "Short description")

sort(table(df_new$SSCO_Category), decreasing = T)

df_new %>% filter(SSCO_Category == "Other") %>% View()






### Tableau setup: run Rserve(), then tableau
pacman::p_load(Rserve)
Rserve()

library(FeatureEngineeringFunctions)

stringr::str_detect(string = mycol, pattern = "lane")

grepl('(?i)EOD', c("some strings", "is eod"))






### test functions for tableau
mystrings <- c("a freezing issue", "an offline issue", "something else")

library(dplyr); library(stringr)

case_when(
  str_detect("something is frozen", '(?i)freez|froz') ~ 'freeze issue',
  str_detect("something is frozen", '(?i)offline') ~ 'offline issue',
  TRUE ~ 'other'
  )


test <- function(colstring){
  out <- case_when(
    str_detect(colstring, '(?i)freez|froz') ~ 'freeze issue',
    str_detect(colstring, '(?i)offline') ~ 'offline issue',
    TRUE ~ 'other')

  return(out)
}

test(mystrings)

library(FeatureEngineeringFunctions);
tableau_SSCO_Categories(.arg1)
fea



library(FeatureEngineeringFunctions)
tableau_SSCO_Categories()
