library(readxl)
library(dplyr)
library(ggplot2)

StateParksByState <- read_excel("C:/Users/deblu/OneDrive/Desktop/Capstone/StateParksByState.xlsx")

# Shows average instead of total 
StateParksWithAverage <- StateParksByState %>%
  mutate(
    Number_of_State_Parks = ifelse(State == "United States", Number_of_State_Parks / 50, Number_of_State_Parks),
    
    `Total_Park_Area_(Acres)` = ifelse(State == "United States", `Total_Park_Area_(Acres)` / 50, `Total_Park_Area_(Acres)`),
    
    State = ifelse(State == "United States", "Average State", State)
  )


# Excluding USA and average
StateParksByState <- read_excel("C:/Users/deblu/OneDrive/Desktop/Capstone/StateParksByState.xlsx")
StateParksOnly <- StateParksByState %>%
  filter(State != "United States")
write.csv(StateParksOnly, "StateParks_StatesOnly.csv", row.names = FALSE)

