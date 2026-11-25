---
title: "hoop2vec identities: how teams play"
author: kearneymw
date: 2026-12-06
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - NBA
  - WNBA
  - Python
---

Some teams run every chance they get. Some take a lot of mid-range jumpers, crash the offensive glass, or press for 40 minutes. On [hoop2vec](https://mkearney.github.io/hoop2vec/), every team in all four leagues gets an identity card that describes how it plays, separately from how good it is. A card might read Run-and-Gun Bombers offense, Zone defense, and Deep Platoon roster, with the numbers behind each label.

## How it's built

The cards start from play-by-play data, which logs every shot, rebound, turnover, foul, and substitution. From that I compute a few dozen rates for each team, like how often it shoots in transition, where its shots come from, how many of its baskets are assisted, and how often it ends up shooting late in the shot clock. Each rate is adjusted for opponents and home court, and pulled toward average when there isn't much data yet.

Then I take team strength out. Good teams make more shots and turn it over less, and I didn't want a style score that was really just a quality score. What's left goes through factor analysis, which finds groups of rates that tend to move together. Transition shots, pushing the ball after defensive rebounds, and short possessions all rise and fall together, so they become one dimension called Pace & Transition. Each team gets a score on several dimensions like that for offense, defense, and roster.

Teams also get archetypes, which are clusters of teams with similar profiles. A team can sit between two of them, like a defense that's mostly full-court pressure with some pack-line in it.

Each league gets its own model, fitted on its own play-by-play. The pros have fewer archetypes than college, since there are fewer teams and less variety in how they play. Where a dimension in one league matches one in another, it keeps the same name, so a label means about the same thing wherever you see it.

## The cards

Each card lists strengths, vulnerabilities, and matchup notes. They don't always agree with each other, which is part of what makes them fun to read. A defense that takes away transition chances but gives up a lot of threes can list run-and-gun offenses as both a favorable matchup and a risky one. Those teams want to run, and they also want to shoot threes.

Early in a season, most cards are marked low confidence and still lean partly on the previous season.

## What it doesn't do

Style barely helps predict games. In men's college basketball, adding these dimensions to the forecasts improved log loss by about 0.001 over all games, which is tiny, and by nothing measurable in March. Almost everything a matchup tells you is already in how good the two teams are. So the forecasts leave the identities out, and the cards are there to describe teams.
