# directions for making & documenting packages

# https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/



#### !!! making second package ----
library(roxygen2); library(devtools)
getwd()  # the working directory
dir()
# devtools::create("packageNameHere")  # creates package directories & files
# (then create function w/ documentation & save in the 'R' directory...
devtools::document(paste0(normalizePath(getwd()), "\\R"))  # run this function to document files in R folder
# install("packageNameHere")  # only run once
library(packageNameHere)


# devtools::install_github(repo = "packageNameHere", "githubname")  # installs from github
