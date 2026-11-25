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
  - WNBA draft
  - machine learning
---

I've always thought the eye test was worth something. Not just for seeing a player's skills, but for seeing how competitive they are and what their drive is like. I knew Marcus Smart and Christian Braun were going to play hard at the next level. I could tell Trae Young was going to be a difficult talent to fit around, and that Andrew Wiggins didn't have the killer instinct you'd want. But for the most part, who gets drafted and who sticks in the pros can be modeled with reasonable accuracy.

The college sites on [hoop2vec](https://mkearney.github.io/hoop2vec/) have a Prospects page that runs two of those models on every player: NBA prospects on the men's site and WNBA prospects on the women's.

## Two models

The draft model estimates the chance a player is picked in each tier of the draft, from the very top down to getting picked at all. For the NBA that's the top 5, the lottery (the top 14), the first round, and both rounds. The WNBA draft is three rounds and 36 picks, so its tiers are the top 4, the top 12, the top 24, and drafted. The model learned from every past college player-season and who actually got drafted.

The success model estimates the chance a player becomes a real contributor early in a pro career, measured in Win Shares, a stat that splits a team's wins among its players. In the NBA the bar is 8 Win Shares in the first four seasons, about what a steady rotation player gets. WNBA seasons are shorter and the rosters are smaller, so the bar there is 2.5 Win Shares in the first three seasons. Players who went undrafted or never made it are in the data too, as misses.

Both models use age, height, class, team and conference strength, role, and a few dozen stats adjusted for opponents. On the men's side, age matters more than anything else. A freshman putting up good numbers at 18 is a much better bet than a senior putting up the same numbers at 23. There aren't free birth dates or recruiting rankings for women's players, so class and height have to stand in.

## How well it works

I tested the models one draft at a time, training each only on earlier drafts. In the NBA version, an average of 20 of the model's top 30 players were drafted, compared with about 15 for a simple baseline using recruiting ranking, box plus/minus, and age. The WNBA version is about as good at picking who gets drafted, and better than its baseline at predicting the order.

Pro teams are still better at this than I am, in both leagues. For players who were drafted, where they were picked predicts their careers better than my success model does. Teams get workouts, medical reports, and interviews. I get box scores. The models also only cover college players, so international and G League prospects aren't on the board, and the board's slots run ahead of where players will really go.

Each prospect also gets comps. A separate model learns how college stats turn into pro stats over a player's first few seasons, then finds past college players at the same stage whose projected pro profile is closest, and shows what they became. Some things carry over better than others. On the men's side, rebounding, blocks, assists, and how many threes a player takes translate well. Shooting efficiency and overall impact translate much less.

ESPN, KenPom, or Sports Reference could show this kind of detail in a way that's easy to use. They have years of existing pages to work around, and I got to start from scratch.
