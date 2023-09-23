getwd()
dat <- read.csv("/Users/samdonchi/Desktop/Crim1200-stats/Data/income.data.csv")

library(tidyverse)
library(ggplot2)


dat %>% summarise(m = mean(income, na.rm = TRUE),
                  med = median(income, na.rm = TRUE))
                          

summary(dat$income)
summary(dat$happiness)
dat %>% group_by(gender) %>%  summarise(count = n())
dat %>% group_by(education) %>% summarise(count =n())



dat %>% ggplot(aes(x = income)) + geom_histogram()
dat %>% ggplot(aes(x = happiness)) + geom_histogram()

5.992-3.006
4.503-2.266

dat %>% ggplot(aes(x = happiness, fill = gender)) + geom_histogram()
dat %>% ggplot(aes(x = happiness, y = gender)) + geom_boxplot()
dat %>% group_by(gender) %>%  summarise(med = median(happiness, na.rm = TRUE),
                                        avg = mean(happiness, na.rm = TRUE))


dat %>% ggplot(aes(x = happiness, y = education)) + geom_boxplot()
dat %>% group_by(education) %>%  summarise(med = median(happiness, na.rm = TRUE),
                                        avg = mean(happiness, na.rm = TRUE),
                                        IQR = IQR(happiness, na.rm = TRUE))

dat %>% ggplot(aes(x = income, y = happiness)) + geom_point()
