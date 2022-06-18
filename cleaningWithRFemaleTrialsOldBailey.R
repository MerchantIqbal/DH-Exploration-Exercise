# Import Packages
install.packages("tidyverse")
install.packages("tidytext")

# Import further packages
library(tidyverse)

# this is a part of Tidyverse too-- I'll touch on it shortly
library(magrittr)

library("tidytext")

# library(readr)  # remember you can always install.package("readr")
# or whatever you need if you get a package not found error

femaleTrialElements <- read_csv("femaleTrialsOldBailey.csv", col_types = "c")

# if your data is from a link, replace 'read_csv' with 'read_url'
# coloumn types
show_col_types = TRUE

# library(tibble)
femaleTrialElements <- as_tibble(femaleTrialElements)

# Note: You can overwrite variables like I just (intentionally) did for fairyElements-- pay attention when naming variables so you don't do this unintentionally!

# Check out your data! This will show the first couple of rows
head(femaleTrialElements)

# the $ indicates that you're pulling something that is
# stored within the variable that comes before it-- in
# this case, you're trying to pull a column from our
#'femaleTrialElements' table

# femaleTrialElements$Motif type

# library(magrittr) for the pipe (aka '%<>%')
# library(stringr) for str_replace_all() function

colnames(femaleTrialElements) %<>% str_replace_all("\\s", "_") %<>% tolower()

# now look at your columns!
head(femaleTrialElements)

# library(tidyr)

problems()

# Replace with a word
# Note: if you have a "NULL" value, you can typically just use the str_replace_all() function

femaleTrialElementsUnkown <- femaleTrialElements %>% replace_na(list(firstname = "Unknown"))

print("NA is replaced with 'Unknown':")
head(femaleTrialElementsUnknown)

# note: a pipe pushes the object preceding it (in this case 'fairyElements$case_notes') as the first argument of the function that follows it

head(femaleTrialElements)

# Counting motifytype
motif <- femaleTrialElements %>%
  count(motif_type, sort = TRUE)

# 'sort = TRUE' means that the table created from this will be sorted from largest to smallest count

head(motif)

#
# what happens if we do the same thing as before?
notes <- femaleTrialElements %>%
  count(femalenotes, sort = TRUE)

head(notes)

# Create an ID column
femaleTrialElements$id <- 1:nrow(femaleTrialElements)

# make a data frame with just the IDs and contents of 'folk_notes'-- I noticed there are more odd "?" in this column so I included this cleaning step within this action
notes <- tibble(id = femaleTrialElements$id, text = (str_remove_all(femaleTrialElements$femalenotes, "\\?")))

# now we'll use tidytext's unnest_tokens() function to tokenize the text
notes <- notes %>%
  unnest_tokens(word, text)

# let's look at the first couple tokens
head(nNotes)

# Cleaning Token words
notes <- notes %>%
  anti_join(stop_words)

# an "anti_join" means that 'stop_words' is joined to the data you load in ('notes') and any time a word matches in both datasets, it's removed.

head(notes)

notesFreq <- notes %>%
  count(word, sort = TRUE)

# show it ALL
notesFreq
# library(dplyr)

# only show the words that occur more than 50 times
notes_gt <- notesFreq %>%
  filter(n > 50)

print("Words which occur >50 times: ")
notes_gt

# only show words that contain 'tree'-- uses str_detect() from stringr!
notes_trees <- notesFreq %>%
  filter(str_detect(word, "tree"))

print("Trees found in folk notes: ")
notes_trees

head(femaleTrialElements)