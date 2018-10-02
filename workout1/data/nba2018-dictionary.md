---
title: "Workout 1"
author: "Harinandan Srikanth"
date: "September 30, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
* What is the data about?
  + The data is about NBA players in 2018. It lists a specific set of qualitative and quantitative characteristics for each player.
* How many rows?
  + 477
* How many columns?
  + 38
* What are the column labels? If the column names are abbreviations, what is the full description of each column? If the column names are abbreviations, what is the full description of each column? What are the units of measurement (e.g. inches, pounds, km/h, etc)?
  + player:	first and last names of player
  + number: number on jersey	
  + team: 3-letter team abbreviation	
  + position: player's position	
  + height: measured in feet-inches
  + weight:	measured in pounds
  + birth_date: date of birth ("Month day, year")	
  + country: 2-letter country abbreviation
  + experience:	years of experience in NBA (a value of R means rookie)
  + college: attended college in USA
  + salary:	measured in dollars
  + rank: Rank of player in his team	
  + age: Age of Player at the start of February 1st of that season	
  + games: Number of Games Played during regular season
  + games_started: number of games that the player started
  + minutes: number of Minutes Played during regular season	
  + field_goals: number of Field Goals Made
  + field_goals_atts: field goal attempts
  + field_goals_perc: field goal percentage; field_goals/field_goals_atts (percent of field goal attempts that were successful)
  + points3: three pointers
  + points3_atts: three pointer attempts
  + points3_perc: three pointer percentage; points3/points3_atts (percent of three pointer attempts that were successful)	
  + points2: two pointers 
  + points2_atts: two pointer attempts	
  + points2_perc: two pointer percetage; points2/points2_atts (percent of two pointer attempts that were successful)	
  + effective_field_goal_perc: effective field goal percentage
  + points1: free throws made
  + points1_atts: free throw attempts	
  + points1_perc: free throw percentage; points1/points1_atts (percent of free throw attempts that were successful)
  + off_rebounds: number of offensive rebounds 
  + def_rebounds: number of defensive rebounds
  + total_rebounds: total number of rebounds; off_rebounds + def_rebounds
  + assists: number of assists
  + steals: number of steals
  + blocks: number of blocks	
  + turnovers: number of turnovers
  + fouls: number of fouls
  + points: total points

* How missing values are codified?
  + Missing values are codified as either NA or blank.
  + Labels with blanks for missing values: college
  + Labels with NA for missing values: field_goals_perc, points3_perc, points2_perc, effective_field_goal_perc, points1_perc

* Main source: www.basketball-reference.com
* Data source for Cleveland Cavaliers: https://www.basketball-reference.com/teams/CLE/2018.html 


```{r cars}

```

Harinandan@HariPC MINGW64 ~
$ pwd
/c/Users/Harinandan

Harinandan@HariPC MINGW64 ~
$ cd 'C:\Users\Harinandan\OneDrive\Documents\Fall 2018\Stat 133\Homework\Workout 1'

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ touch README.md

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ mkdir data

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ mkdir code

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ mkdir output

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ mkdir report

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ ls
code/  data/  output/  README.md  report/  workout1-instructions.pdf

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ cd data

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ curl -O https://raw.githubusercontent.com/ucb-stat133/
curl: Remote file name has no length!
curl: try 'curl --help' or 'curl --manual' for more information

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ ls

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ curl -O https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2018/master/data/nba2018.csv
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 94937  100 94937    0     0  90675      0  0:00:01  0:00:01 --:--:-- 90675

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ ls
nba2018.csv

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ cd ..

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ cat README*

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ nano README.md

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ pwd
/c/Users/Harinandan/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1
$ cd data

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ curl -O https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2018/master/data/nba2018.csv
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 94937  100 94937    0     0  86859      0  0:00:01  0:00:01 --:--:-- 86859

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ pwd
/c/Users/Harinandan/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data

Harinandan@HariPC MINGW64 ~/OneDrive/Documents/Fall 2018/Stat 133/Homework/Workout 1/data
$ ls
nba2018.csv  nba2018-dictionary.md



```{r pressure, echo=FALSE}

```

