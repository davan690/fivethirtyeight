library(tidyverse)
library(stringr)
library(lubridate)
library(janitor)
library(usethis)

#reading in csv
nba_elo <- read_csv("https://projects.fivethirtyeight.com/nba-model/nba_elo.csv")
nba_elo_latest <- read_csv("https://projects.fivethirtyeight.com/nba-model/nba_elo_latest.csv")

rownames(nba_elo) <- NULL
rownames(nba_elo_latest) <- NULL

#tidying and taming data for nba_elo
nba_elo <- nba_elo %>%
  clean_names() %>%
  mutate_if(is.logical, as.numeric) %>%
  mutate(neutral = as.logical(neutral)) %>%
  mutate(playoff = as.logical(playoff))

#tidying and taming data for nba_elo_latest
nba_elo_latest <- nba_elo_latest %>%
  clean_names() %>%
  mutate_if(is.logical, as.numeric) %>%
  mutate(neutral = as.logical(neutral)) %>%
  mutate(playoff = as.logical(playoff))

#setting up .rda
usethis::use_data(nba_elo, overwrite = TRUE)
usethis::use_data(nba_elo_latest, overwrite = TRUE)
