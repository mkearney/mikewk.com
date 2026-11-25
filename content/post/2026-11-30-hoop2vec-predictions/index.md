---
title: "hoop2vec predictions: every game, every morning"
author: kearneymw
date: 2026-11-30
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - machine learning
  - Python
build:
  publishResources: false
---

Duke plays at Florida on December 1. [hoop2vec](https://mkearney.github.io/hoop2vec/#/games) has Florida winning 78 to 73 and gives Florida a 68 percent chance. Every Division I game gets a forecast like that: a predicted score, a margin, and a win probability. They're on the Games page and on each team's page, and they update every morning.

On a neutral floor, the same game is close to a coin flip. Florida's chance drops to 55 percent and the predicted margin shrinks from five points to about one. Home court is worth a few points in college basketball, and the model counts travel and rest too.

![The hoop2vec Matchup Lab showing Duke vs Florida on a neutral floor, with Florida at 54.6 percent](matchup.png "Duke vs Florida on a neutral floor in the Matchup Lab. Florida is without Boogie Fland, which is worth almost two points to Duke.")

The Matchup Lab lets you set up any game this way. You pick two teams and a site. The full model runs in your browser and shows the forecast, plus how much each piece contributed: team strength, site and travel, injuries, and matchup effects.

## Two models

The forecast comes from two models. The first is a neural network. It takes about 40 numbers for each team and learns how they combine. They include both ratings, shooting, rebounding, turnovers, roster strength, injuries, rest, and travel. It sees both teams at once, so it can learn that some styles match up better against others.

The second is a plain linear model. It uses team ratings, home court, travel distance, rest, and injuries, each with a fixed weight. It can't learn matchups, but it's harder to fool. The final forecast is 70 percent network and 30 percent linear. I picked that split by testing a range of weights on past seasons and keeping the one that did best.

Some games are harder to call than others, and the model estimates that game by game. The ±11.7 in the screenshot is that estimate for Duke and Florida. The final margin should land within about 12 points of the prediction two times out of three.

## How it's tested

To test it, I had the model predict every D-I game from 2012 through 2026 as if it were the morning of the game. For each season it could only learn from earlier seasons. It only saw injury news that was public before tip-off. That's about 82,000 games.

The score I care about most is log loss. It punishes a forecast for being confident and wrong much more than for being unsure and wrong, and lower is better. On that measure the blend beat both of its parts and each of the ratings it's built on. It also picked the winner in 73.5 percent of games.

The fairest comparison is a sportsbook. Last season ESPN carried DraftKings lines for about 5,500 games. The lines did a little better than the model, with a log loss of 0.542 against 0.547. This season, through 979 games, the line is still a bit ahead.

I'd be suspicious of any model built on public data that beat a sportsbook by much. Sportsbooks see the same public data I do, plus a lot of money telling them when they're wrong.
