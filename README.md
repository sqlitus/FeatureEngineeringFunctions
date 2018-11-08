# FeatureEngineeringFunctions

### [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


### github directions

1. [R package project creation instructions](http://r-pkgs.had.co.nz/git.html)
2. [merging local git project with github copy](https://stackoverflow.com/questions/18328800/github-updates-were-rejected-because-the-remote-contains-work-that-you-do-not-h)
3. [pulling & merging](https://stackoverflow.com/questions/37937984/git-refusing-to-merge-unrelated-histories-on-rebase)


### [Create package directions](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)

```r
library(roxygen2); library(devtools)
getwd(); dir()   # reference
devtools::create("packageNameHere")  # creates package directories & files
# (then create function w/ documentation & save in the 'R' directory...)
devtools::document(paste0(normalizePath(getwd()), "\\R"))  # run this function to document files in R folder

install("packageNameHere")  # only run once
library(packageNameHere)  # finally load it
devtools::install_github(repo = "packageNameHere", "githubname")  # installs from github

# after package successfully created & documented, should be able to see...
packageNameHere::function()
?function
```


![alt-text](https://www.brainyquote.com/photos_tr/en/g/georgebernardshaw/166582/georgebernardshaw1.jpg)
![alt-text](https://quotes.thefamouspeople.com/images/quotes/epicurus-17888.jpg)
![alt-text](https://www.brainyquote.com/photos_tr/en/g/georgebernardshaw/166582/georgebernardshaw1-2x.jpg)
