
# load packages
library(tidyverse)
library(palmerpenguins)
library(ggplot2)
library()
ggplot2::theme_set(ggplot2::theme_minimal())


# Manipulating data guidelines


# (From https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html)

?penguins
class("flipper_length_mm")
# SELECTING SOME OBSERVATIONS
penguin_a <- penguins %>% filter(species == "Adelie")
filter(.data=penguins, species == "Adelie")

View(penguins)

# REORDERING ROWS
penguins %>% arrange(bill_length_mm) # sort by bill length

penguins %>% arrange(desc(bill_length_mm)) # sort by reverse bill length


# CHOOSING ROWS
# Choose rows using their position using slice()
penguins %>% slice(3:4) # select only rows 3 and 4

penguins %>% slice_tail(n=5) # see the last five rows

penguins %>% slice_sample(n=5) # see a random sample of five rows

penguins %>% slice_sample(n=5, replace=TRUE) # same, but sample with replacement

penguins %>% slice_max(bill_length_mm, n=1) # select row that has the highest bill_length_mm


# SELECT A SPECIFIC COLUMN
penguins %>% select(bill_length_mm) # select a single column, bill_length_mm

penguins %>% select(bill_length_mm) %>% max(na.rm = TRUE) # find the maximum of that column. note: if there are missing NA values, just add "na.rm = TRUE".


# ADD NEW COLUMN
penguins %>% mutate(bill_length_m = bill_length_mm / 1000) # made new column that's in meters now

penguins %>% mutate(bill_length_m = bill_length_mm / 1000, .keep = "none") # same but only keep new var

penguins %>% mutate(gender = sex, .keep = "none")


# MAKE A FREQUENCY TABLE
penguins %>% count(species) # create a frequency table, same as table(species) in base R


# SUMMARIZE VALUES
# get the mean for a specific
penguins %>% summarise(avg=mean(flipper_length_mm, na.rm=TRUE),
                       med = median(flipper_length_mm, na.rm = TRUE))



# summarize by group
penguins %>% group_by(species) %>% summarize(m=mean(bill_length_mm, na.rm=TRUE), 
                                             sd=sd(bill_length_mm, na.rm=TRUE),
                                             n=n()) # group by species

penguins %>% group_by(island) %>% summarize(m=mean(bill_length_mm, na.rm=TRUE), 
                                             sd=sd(bill_length_mm, na.rm=TRUE),
                                             n=n()) # group by island






# study penguin body mass
# variable type:
is.datatype("body_mass_g")

penguins %>% ggplot(aes(x = body_mass_g)) + geom_histogram()

penguins %>% summarise(m = mean(body_mass_g, na.rm = TRUE),
                       med = median(body_mass_g, na.rm = TRUE),
                       n = n())

summary(penguins$body_mass_g)

# describe the distribution, visually and quantitatively 

#by species

penguins %>% group_by(species) %>% 
  summarise(m = mean(body_mass_g, na.rm = TRUE),
                       med = median(body_mass_g, na.rm = TRUE),
                       n = n(),
            std = sd(body_mass_g, na.rm= TRUE))

penguins %>% ggplot(aes(x = body_mass_g, fill = species)) + geom_histogram()+
  xlab("Body Mass in Grams")+
  ggtitle("Body Mass of Penguins by Species")+
  ylab("Number of Penguins")+
  theme_classic()

penguins %>% ggplot(aes(x=body_mass_g))+ geom_histogram()+facet_grid(vars(species), scales = "free_y")


# for quantiative eda, if the histogram is not symmetrical, we should look at median and IQR, when it IS symmetric, use mean and SD

penguins %>% ggplot(aes(x = flipper_length_mm, y = body_mass_g, color = species))+geom_point()

