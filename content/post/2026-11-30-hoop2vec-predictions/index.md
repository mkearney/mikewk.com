---
title: "hoop2vec predictions: every game, every morning"
author: kearneymw
date: 2026-11-30
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - NBA
  - WNBA
  - machine learning
  - Python
---

Every game in all four leagues on [hoop2vec](https://mkearney.github.io/hoop2vec/) gets a forecast: a predicted score, a margin, and a win probability. They're on each league's Games page and on every team's page, and they update every morning with the latest results and injury news.

The Matchup Lab lets you set up any game yourself. You pick two teams and a site, and the full model runs in your browser. It shows the forecast and how much each piece mattered: team strength, home court, travel, rest, injuries, and matchup effects. Moving a close college game from one team's gym to a neutral floor can turn a clear favorite into something close to a coin flip.

## How it works

The forecast blends two models. One is a neural network that takes about 40 numbers for each team, from both ratings to shooting, rebounding, turnovers, roster strength, injuries, rest, and travel. It sees both teams at once, so it can pick up on styles that match up well or badly. The other is a plain linear model built on team ratings, home court, travel, rest, and injuries. It can't learn matchups, but it's harder to fool.

How much weight each model gets depends on the league, and the backtest picks it. In men's college basketball and the NBA, the network gets 70 percent. In the women's college game it gets 80. The WNBA only has 15 teams and a short season, so there isn't much data, and the backtest leans the other way and gives the linear model 70 percent.

The model also estimates how uncertain each game is. Some matchups are harder to call than others, and the forecast says how far the final margin is likely to land from the prediction.

To test it, I had each league's model predict every past game as if it were the morning of the game. It could only learn from earlier seasons, and it only saw injury news that was public before tip-off. For men's college basketball that's about 82,000 games since 2012, and the model picked the winner in 73.5 percent of them. The score I care more about is log loss, which punishes a confident wrong forecast much harder than an unsure one. In men's and women's college basketball and the NBA, the blend beat each of its parts and every rating it's built from. The WNBA's history is short enough that all the models land within noise of each other.

## Against the books

The real test is a sportsbook. ESPN carries closing betting lines for some games, set right before tip-off, and they're more accurate than the model in men's college basketball and the NBA. The gap is bigger in the NBA, where the betting market is sharper. In women's college basketball the model slightly beats the few lines ESPN carries, which made me suspicious enough to check it for leaks. More on that in its own post.

Around 2020 I was burned out from open-source work and the never-ending demands of teaching, research, and mentoring. So naturally I spent my free time trying to beat the stock market, predict elections, and model sports betting. What I found is that models are powerful and informative, but the real edge comes from data other people don't have, or from knowing something they don't. Public data gets you close to the market. It doesn't get you past it.

So that's not what hoop2vec is for. It's for giving myself information that's easy to digest, as accurate as I can make it, and easy to make sense of: who's actually good, who's overrated, which teams are worth following, and which ones would be fun to pencil in on a bracket.
