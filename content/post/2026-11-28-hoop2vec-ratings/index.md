---
title: "hoop2vec ratings: one number for every team"
author: kearneymw
date: 2026-11-28
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - Python
build:
  publishResources: false
---

Most college basketball ratings come down to one number per team. On [hoop2vec](https://mkearney.github.io/hoop2vec/) that number is called Power, and right now Illinois leads at +42.0, about five points ahead of Houston. Arkansas Pine Bluff is last at −33.4.

![The top of the Illinois team page on hoop2vec, showing Power, adjusted offense and defense, tempo, and win chances](illinois.png "Illinois's team page as of November 25.")

Power is how many points per 100 possessions a team would beat an average Division I team by on a neutral floor, so zero is average. A possession is one trip down the court, ending when the other team gets the ball, and a typical game has about 70 for each side. That makes +42 worth about 29 points against an average team in a normal game.

Counting per possession takes pace out of it. A slow team that wins 60 to 40 and a fast team that wins 90 to 70 both won by 20, but the slow team did it with fewer chances. The team pages also turn Power into odds. Illinois would beat an average team 96 percent of the time on a neutral floor, and a typical top-25 team 71 percent of the time.

## Where it comes from

Underneath Power are three ratings. The first is adjusted efficiency, the approach Ken Pomeroy made famous: points scored and allowed per 100 possessions, adjusted for opponent and venue. hoop2vec recalculates it from scratch every day and gives recent games a little more weight. By that measure Illinois has the best offense in the country, scoring 131.5 points per 100 possessions against an average defense.

The second is a dynamic rating that updates after every game and keeps track of how sure it is. Early in the season it leans on last year's team and how much of the roster came back. The third is Elo, the system chess uses, which is mostly there as a baseline.

Those three feed the game model, the same one that makes the forecasts, along with player data, injuries, and a bunch of box score stats. To get Power, I ask that model how each team would do on a neutral floor against each of the top 100 teams, then shift the scale so an average team lands at zero. Measuring against good opponents keeps a team from padding its number on bad ones. Beating the 350th-best team by 40 doesn't say much about March.

The ratings page also has strength of schedule, which is the average Power of the teams you've played. Florida is 6-1 against the 12th-toughest schedule in the country. UCLA is 6-0 against the 315th. The records look about the same until you see who they came against.

It's November, and most teams have played four to seven games, so all of this will move. Illinois's dynamic rating comes with an uncertainty of about five points either way, which is roughly its whole lead over Houston.
