#class notes 9.11

2+2
mtcars

table(mtcars$gear)
nrow(mtcars)

#frequency table- total per category and puts it into a table
table(mtcars$gear)

#relative frequency table- gives as percentages, basically
table(mtcars$gear)/length(mtcars$gear)

?mtcars
mtcars$gear

#the above shows the entire column called year

#bar charts show the distribution of a categorical variable

ggplot(data=mtcars, mapping = aes( x = gear))+
  geom_bar()

#Contingency tables- the relationship between two categorical variables, basically contingent on the value of another variable

table(mtcars$gear, mtcars$vs)
#creates a table in which the vertical axis label if the number of gears, the horizontal axis is the engine type

#old way:

install.packages("reshape2")

library(reshape2)

tab <- table(mtcars$gear, mtcars$vs)
barplot(tab, beside = TRUE,
        names = c("V-shaped engine", "Straight engine"),
        legend = TRUE, args.legend = list(title = "Gears"),
        main = "Barplot comparing gears by type of engine")
#new way with ggplot

tab1 <- melt(tab)
colnames(tab1) <- c("Gears", "Engine", "Value")
head(tab1)

ggplot(data = tab1, aes(x=Engine, y=Gears, fill=Value))+
  geom_bar(stat = "identity", position = "dodge")+
  ggtitle("Example")+
  theme_minimal()

#theme wsj or theme economist to get their themes, kind of cool

