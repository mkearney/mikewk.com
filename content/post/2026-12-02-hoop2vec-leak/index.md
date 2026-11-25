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
---

Everyone who works with data leaks it eventually. Leakage is when a model gets to see information it wouldn't have had at the moment it's supposed to be predicting, and it's very easy to do by accident. When you test a basketball model on past seasons, you pretend it's the morning of each game. The hard part is making sure the model only knows what someone could have known that morning. If anything from later sneaks in, the model looks better than it really is.

An early version of [hoop2vec](https://mkearney.github.io/hoop2vec/) had a leak. In testing, it beat the betting lines on men's NCAA tournament games, which a model built on free public data shouldn't be able to do. Sportsbooks have the same data and a lot more reason to get it right. That's what sent me looking.

The leak was in a player stat that rates every player for every game, an estimate of how much each one helped their team that night. To make those ratings fair, the stat adjusts for how good the team and the opponent are, and it does that using each team's rating from the end of the season. That's fine for looking back on a season, which is what the stat is meant for. It's a problem for predicting one. Add up a team's player ratings in November and you get a number that partly knows how good the team will be in March.

On its own, that one number beat the betting line in all ten seasons I checked. Once I redid the player ratings using only the team ratings from the morning of each game, the same number lost to the line in all ten. The full model got worse too. Its tournament forecasts went from beating the betting lines to trailing them slightly, which is about where an honest public-data model should be.

The same symptom came up again when I added women's college basketball. The women's model slightly beats the few sportsbook lines ESPN carries for those games. Women's betting markets are thinner, so that's plausible, but it's exactly what the men's leak looked like. So I ran the same check. The player ratings alone did worse than the line, and the plain dynamic rating was about even with it. That's what you'd expect from a model that's honest and a market that isn't very sharp.

If you're early in a data science career, this is the part worth taking seriously. You'll leak data at some point. What matters is taking steps to avoid it, checking for it when results look too good, and being honest about it when it happens.
