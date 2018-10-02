#title: short title
#description: a short description of what the script is about
#input(s): what are the inputs required by the script?
#output(s): what are the outputs created when running the script?

library(readr)
library(dplyr)

setwd('C:/Users/Harinandan/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/code')

dat_nba <- read_csv('../data/nba2018.csv')

dat_nba$experience[dat_nba$experience=='R'] <- '0'
dat_nba$experience <- as.integer(dat_nba$experience)
dat_nba$salary <- dat_nba$salary/1000000
dat_nba$position <- factor(dat_nba$position, c('C','PF','PG','SF','SG'), labels = c('center','power_fwd','point_guard','small_fwd','shoot_guard'), ordered = TRUE)

dat_nba <- mutate(dat_nba, missed_fg = field_goals_atts - field_goals, missed_ft = points1_atts - points1, rebounds = off_rebounds + def_rebounds, efficiency = (points + rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers) / games)
sink(file = '../output/efficiency-summary.txt')
print(summary(dat_nba$efficiency))
sink()

sink(file = '../output/teams-summary.txt')
teams <- data.frame(
  team = dat_nba$team,
  experience = dat_nba$experience,
  salary = dat_nba$salary,
  points3 = dat_nba$points3,
  points2 = dat_nba$points2,
  points1 = dat_nba$points1,
  points = dat_nba$points,
  off_rebounds = dat_nba$off_rebounds,
  def_rebounds = dat_nba$def_rebounds,
  assists = dat_nba$assists,
  steals = dat_nba$steals,
  blocks = dat_nba$blocks,
  turnovers = dat_nba$turnovers,
  fouls = dat_nba$fouls,
  efficiency = dat_nba$efficiency
  )
print(summary(teams))
sink()
write_csv(teams,'../data/nba2018-teams.csv') 

