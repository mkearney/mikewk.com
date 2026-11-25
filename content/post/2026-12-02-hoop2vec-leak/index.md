---
title: "The hoop2vec model that was too good"
author: kearneymw
date: 2026-12-02
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - machine learning
build:
  publishResources: false
---

When you test a basketball model on past seasons, you pretend it's the morning of each game and ask what the model would have said. The hard part is making sure it only knows what someone could have known that morning. If anything from later sneaks in, the model looks better than it is. This is called leakage, and it's easy to cause without noticing.

An early version of [hoop2vec](https://mkearney.github.io/hoop2vec/) had a leak. In testing, it beat the betting lines on NCAA tournament games. A model built on free public data shouldn't be able to do that. Sportsbooks have all the same data and a lot more reason to get it right. So I went looking for what the model knew that it shouldn't.

## Where it was

The leak was in a player stat. The stat gives every player a rating for every game, an estimate of how much he helped his team that night. To make those ratings fair, it adjusts for how good his team and the opponent are. It does that using each team's rating from the end of the season.

That's fine for looking back on a season, which is what the stat is meant for. It's a problem for predicting one. Add up a team's player ratings in November and you get a number that partly knows how good the team will be in March.

The effect was large. On its own, that one number beat the betting line in every season I checked, ten out of ten. Nothing that simple should beat a sportsbook even once.

## The fix

The fix was to redo the player ratings using only what was known before each game. hoop2vec now adjusts each player's game against the team ratings from that morning instead of the ones from the end of the season. After the change, the same number lost to the betting line in all ten seasons.

The full model got worse too. Its tournament forecasts went from beating the betting lines to trailing them slightly. That's where an honest public-data model should be.

When a model built on public data beats the market now, I check it for leaks before I check anything else.
