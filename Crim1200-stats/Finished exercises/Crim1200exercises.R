getwd()
setwd("/Users/samdonchi/desktop/Crim1200-stats/Data")

library(tidyverse)
Derby1 <- read_tsv("kentucky-derby-2018.txt")
View(Derby1)

#Winning horse in 1880
Derby1 %>%
  filter(Year == 1880)
# The winning horse was Fonso

#When did the length of the race change

Derby1 %>%
  group_by(Distance(mi),
           summarise(Year))

View(Derby1)
#idk why this does not work, but looking at the data it changed in 1896

#What was the winning time in 1974
Derby1 %>%
  filter(Year == 1974)
#The winning time was 2 minutes and 4 seconds


#horse running in less than 2 mins

Derby_sorted <-Derby1 %>%
  group_by(Mins)
View(Derby_sorted)

#OR

Derby_sorted%>%
  filter(Mins < 2)

# Secretariat, 1973