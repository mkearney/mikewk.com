---
title: "hoop2vec players: value and impact"
author: kearneymw
date: 2026-12-04
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - NBA
  - WNBA
  - Python
---

When a team's best player is ruled out, the forecast for its next game should move. How much it moves depends on how good that player is, how much they usually play, and who'd take their minutes. That's what the Players page on [hoop2vec](https://mkearney.github.io/hoop2vec/) is for. It rates every player in all four leagues, and those ratings feed the game forecasts.

Each player gets two numbers. Value is how many points per 100 possessions better their team is with them on the floor than it would be with an average player. Impact adds playing time. It's what a player adds to their team's rating compared with a replacement-level player, the kind of player any team could find at the end of its bench. A great player who plays 15 minutes a game doesn't add as much as a very good one who plays 35.

## Where value comes from

In men's college basketball, Value starts from box plus/minus, a standard way to estimate a player's contribution from the box score. hoop2vec adjusts each game for the strength of the team and the opponent as of that morning. Early in the season there isn't much to go on, so the number starts from a prior built on last season, the usual jump for a player's class, and recruiting ranking. As minutes pile up, the current season takes over.

Women's college basketball doesn't have the same free player stats, so hoop2vec builds its own box plus/minus from ESPN box scores. The first version had a problem. It gave too much credit to whoever grabbed the rebound or made the shot near the basket, which mostly meant the tallest players. I fixed that by shifting some credit between teammates by height within each game, so a team's total stays the same.

The NBA and WNBA use a different approach. When I tried box plus/minus in the pros, efficient, low-usage centers who rebound and block shots came out as some of the best players in the league. So the pro sites measure impact from lineups instead, with a method called RAPM. It looks at every stretch of a game where the same ten players were on the floor and works out how much each player moved the score, adjusted for who else was out there. A box score model is fitted on top of that so it updates game by game. Even so, the box score only explains about half of a player's offensive impact and much less of the defensive side. Most good defense doesn't show up in a box score.

## Injuries and rest

hoop2vec gives each player an availability before every game, from injury reports and recent missed games. The team ratings already reflect who's been playing, so the forecast only adjusts for the difference between who's available now and who usually plays. If a starter has missed the last three games, the ratings already know. If they're out tonight for the first time, the forecast moves.

Missed games mean different things in different leagues. A college player who misses a game is usually hurt. Pros rest. An NBA player who's missed three or more straight games plays the next one only 12 percent of the time. In the first game of the playoffs, that same player plays 76 percent of the time, because a lot of those missed games were rest at the end of the regular season. hoop2vec uses each league's own rates, so a star resting before the playoffs doesn't get counted as out for a series.
