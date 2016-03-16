######################### R Scripts #########################
library(ggplot2)
library(dplyr)

# Load the USAArests Data
data("USArrests")
head(USArrests)

# Sort the data frame by Murder rate in descending order
a = USArrests %>% mutate(state = row.names(USArrests)) %>% 
	arrange(desc(Murder))

# Select those states with urban population larger than 80
b = USArrests %>% mutate(state = row.names(USArrests)) %>% 
	filter(UrbanPop >= 80) %>% select(state)

print(a)
print("----------------------------------------------")
print(b)
