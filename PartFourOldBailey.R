# Part Four: Old Bailey files between the 17th century and the 20th century
# Iqbal Alibhai 
# Date: 17/06/22

# Set up: Install packages
install.packages('tm')
install.packages('tidyverse')
install.packages('tidytext')
install.packages('magrittr')
install.packages('ggplot2')

library(tm)
library(tidyverse)
library(tidytext)
library(magrittr)
library(ggplot2)

# Load Data
proceedings <- Corpus(DirSource("~/Documents/School/HIST3814/PartFour/OBO_XML_72/ordinarysAccounts"),
            readerControl=list(language="lat")) #lat = latin characters

head(proceedings)

# Cleaning Data
#proceedings <- tm_map(proceedings, removeNumbers)
#proceedings <- tm_map(proceedings, removePunctuation)
#proceedings <- tm_map(proceedings, stripWhitespace)
#proceedings <- tm_map(proceedings, tolower)
# a <- tm_map(a, stemDocument, language = "english")