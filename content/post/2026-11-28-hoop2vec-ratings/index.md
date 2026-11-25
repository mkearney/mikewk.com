---
title: "hoop2vec ratings: one number for every team"
author: kearneymw
date: 2026-11-28
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - NBA
  - WNBA
  - Python
---

Most basketball ratings come down to one number per team. On [hoop2vec](https://mkearney.github.io/hoop2vec/) that number is called Power, and it works the same way in all four leagues: men's and women's college, the NBA, and the WNBA.

Power is how many points per 100 possessions a team would beat an average team in its league by on a neutral floor, so zero is average. A possession is one trip down the court, ending when the other team gets the ball, and a typical game has somewhere around 70 to 100 of them for each side depending on the league. In a college game with about 70 possessions, a team at +30 would beat an average Division I team by about 21 points.

Counting per possession takes pace out of it. A slow team that wins 60 to 40 and a fast team that wins 90 to 70 both won by 20, but the slow team did it with fewer chances. The team pages also turn Power into odds, like how often a team would beat an average opponent, or one of the league's better teams, on a neutral floor.

The spread looks very different from league to league. Pro teams are bunched together, and even the best and worst are usually within about ten points of average. Division I has hundreds of teams with huge differences in money, size, and talent, so the range is much wider. It's widest in women's college basketball, where the best teams can be more than 60 points per 100 possessions better than average.

## Where it comes from

Underneath Power are three ratings. The first is adjusted efficiency, the approach Ken Pomeroy made famous: points scored and allowed per 100 possessions, adjusted for opponent and venue. hoop2vec recalculates it from scratch every day and gives recent games a little more weight.

The second is a dynamic rating that updates after every game and keeps track of how sure it is. Early in the season it leans on last year's team and how much of the roster came back. The third is Elo, the system chess uses, which is mostly there as a baseline.

Those three feed the game model, the same one that makes the forecasts, along with player values, injuries, and a bunch of box score stats. To get Power, I ask that model how each team would do on a neutral floor against a set of opponents, then shift the scale so an average team lands at zero. In the pros, the opponents are every team in the league. In college they're the top 100 teams. Beating the 350th-best team by 40 doesn't say much about March, and measuring against good opponents keeps a team from padding its number on bad ones.

The college ratings pages also show strength of schedule, which is the average Power of the teams you've played. Two teams with the same record can look very different once you see who they played.

Early in a season, all of this moves a lot. The dynamic rating reports its own uncertainty, and in November it's often about as big as the gap between the top two teams. By March it's much smaller.
