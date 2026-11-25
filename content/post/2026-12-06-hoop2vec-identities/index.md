---
title: "hoop2vec identities: how teams play"
author: kearneymw
date: 2026-12-06
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - Python
build:
  publishResources: false
---

Houston forces a turnover on about one in five possessions. It takes a lot of mid-range jumpers, rebounds 40 percent of its own misses, and sends opponents to the line often. On [hoop2vec](https://mkearney.github.io/hoop2vec/#/team/houston), that adds up to a Mid-Range Shot-Makers offense, a Full-Court Chaos defense, and a Deep Platoon roster.

![Houston's team page on hoop2vec, with its offense, defense, and personnel identities, strengths, and vulnerabilities](houston.png "Houston's identity card as of November 25.")

Every team gets an identity card like this one. It describes how the team plays, separately from how good it is. The Styles tab has the full list of dimensions and archetypes and which teams fit each one.

## How it's built

It starts from play-by-play data, which logs every shot, rebound, turnover, foul, and substitution. From that I compute about 32 rates for each team. They include how often it shoots in transition, where its shots come from, how many of its baskets are assisted, and how often it ends up shooting late in the shot clock. Each rate is adjusted for opponents and home court. When there isn't much data yet, it gets pulled toward average.

Then I take team strength out. Good teams make more shots and turn it over less, and I didn't want a style score that was just a quality score under another name.

What's left goes through factor analysis, which finds groups of rates that tend to move together. Transition shots, pushing the ball after defensive rebounds, and short possessions all rise and fall together, so they become one dimension called Pace & Transition. There are six of these dimensions for offense, seven for defense, and five for the roster.

Teams also get archetypes, which are clusters of teams with similar profiles. A team can sit between two. Houston is a 64 percent match for Full-Court Chaos and a 20 percent match for Conservative Pack-Line.

## The cards

Each card lists strengths, vulnerabilities, and matchup notes, with the numbers behind them. Houston's card lists Run-and-Gun Bombers as both a favorable matchup and a risky one. Its defense takes away transition chances, which those teams want. It also allows a lot of threes, which they also want.

It's early, so most cards say low confidence. Until teams have played more games, the cards lean partly on last season.

## What it doesn't do

Style barely helps predict games. In testing, adding these style dimensions to the game forecasts improved their log loss by about 0.001 over all games. That's tiny even for log loss, where good models are often separated by a few thousandths. In March the improvement was zero. Almost everything a matchup tells you is already in how good the two teams are.

So the forecasts leave the identities out. The Styles tab describes teams, and the ratings pick winners.
