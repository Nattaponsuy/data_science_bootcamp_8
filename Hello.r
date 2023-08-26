# my First R program

print("Hello World")

---
title: "Data Visulization Bootcamp Homework"
author: "Nattapon Nut"
date: "2023-07-30"
output:
  pdf_document: default
  html_document: default
editor_options: 
  markdown: 
    wrap: 72
---

# Instruction

Use diamonds dataset to create 5 chart. knit PDF and submit in discord.

## Data "nycflights13" to chart

```{r}
library(nycflights13)
library(tidyverse)
library(lubridate)
data(package = "nycflights13")

##aisign Data
df2 <- flights %>%
  mutate(month_name = month(time_hour,label = T),weekdays=wday(time_hour,label = T))

df3 <- weather %>%
  mutate(month_name = month(time_hour,label = T),weekdays=wday(time_hour,label = T))
```

# number of flight each airline group by or in 2013

```{r}
ggplot(flights,aes(carrier)) +
  geom_bar(fill = "#f26f8c") +
  theme_minimal() +
  facet_wrap(~origin, ncol=1)
```

##summarry : - a "UA" airline have the most number of flight in "EWR"
airport - a "B6" airline have the most number of flight in "JFK"
airport - a "DL" airline have the most number of flight in "LGA" airport

# number of airline in day of week

```{r}
ggplot(df2,aes(weekdays)) +
  geom_bar(fill = "orange") +
  theme_minimal()
```

##summarry : - Saturday have a minimum number of flight in Newyork city

# Avergage Distance each airline

```{r}
Dist <- flights %>%
  group_by(carrier) %>%
  summarise(Dist = mean(distance))

ggplot(sample_frac(Dist,0.5),aes(carrier,Dist)) +
  geom_col(fill = "#4fd1af") +
  theme_minimal()
```

##summarry : - "HA" airline have the most average distance travelling in
all of Newyork city airline

#Newyork city temperature trend in 2013

```{r}
ggplot(sample_frac(df3,0.8),aes(month_name,temp)) +
  geom_boxplot(col= "black",fill = "#4fd1af") +
  theme_minimal() 
```

##summarry : - Newyork city have the most temperature in june (the
hottest), average about 77 Fahrenheit degree

# wind speed trend in 2013

```{r}
set.seed(66)
ggplot(sample_frac(df3,0.8),aes(time_hour,wind_speed)) +
  geom_smooth(col = "#4fd1af",fill = "#adedff") +
  theme_minimal() 
```

##summarry : - Newyork city have the most wind speed in mar (average
about 13.5 unit) and the least in sep (average about 8.75 unit)

### Presented by Nattapon Suyatun_Data Bootcamp8
