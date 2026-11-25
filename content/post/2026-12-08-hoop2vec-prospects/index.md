---
title: "hoop2vec prospects: the draft and what comes after"
author: kearneymw
date: 2026-12-08
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - NBA draft
  - machine learning
build:
  publishResources: false
---

Quentin Coleman is an 18-year-old freshman guard at Illinois. He's averaging 20.7 points a game. [hoop2vec](https://mkearney.github.io/hoop2vec/#/prospects) has him first on its projected board for the 2027 NBA draft, with a 65 percent chance of going in the first round.

![The hoop2vec Prospects page, with the projected draft board and the best NBA bets](prospects.png "The Prospects page as of November 25.")

## Two models

The Prospects tab runs two models on every D-I player. The draft model estimates the chance a player is picked in the top 5, the top 14 (the lottery), the first round, and at all. It learned from every D-I player-season since 2008 and who actually got drafted.

The success model estimates the chance a player gets 8 or more Win Shares in his first four NBA seasons. Win Shares is a stat that splits a team's wins among its players. Eight over four years is about what a steady rotation player gets. Players who went undrafted or never reached the NBA are in the data too, as misses.

Both models use the same inputs: age, height, class, recruiting ranking, team and conference strength, role, and about 30 stats adjusted for opponents. Age matters more than anything else. A freshman putting up good numbers at 18 is a much better bet than a senior putting up the same numbers at 23.

## How well it works

I tested both models one draft at a time, training each only on earlier drafts. From 2012 through 2026, an average of 20 of the model's top 30 players were drafted. A simple baseline using recruiting ranking, box plus/minus, and age got about 15.

The NBA is better at this than I am. For players who were drafted, where they were picked predicts their NBA careers better than my success model does. Teams get workouts, medical reports, and interviews. I get box scores. Adding my model to the draft slot didn't improve on the slot alone.

It also only covers college players. International and G League prospects aren't in it, so the board's slots run ahead of where players will really go.

## Comps

Each prospect also gets comps. A separate model learns how college stats turn into NBA stats over a player's first four seasons. Then it finds past college players at the same stage whose projected NBA profile is closest, and shows what they became. Coleman's closest comps include V.J. Edgecombe, Jeremiah Fears, and Dylan Harper, three freshman guards picked in the top seven in 2025.

Some things carry over to the NBA better than others. Rebounding, blocks, assists, and how many threes a player takes translate well. Shooting efficiency and overall impact translate much less.

The page also has a table of what happened by draft slot. Of college players picked in the top five from 2009 to 2022, 72 percent reached 8 Win Shares in four seasons. For second-round picks, it was 14 percent.
