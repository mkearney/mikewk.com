---
title: "hoop2vec players: value and impact"
author: kearneymw
date: 2026-12-04
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - Python
build:
  publishResources: false
---

Thomas Haugh is a 6-foot-9 senior forward at Florida. He's averaging 17.6 points a game and making 51 percent of his threes. On [hoop2vec](https://mkearney.github.io/hoop2vec/#/players), he's the most important player in the country right now.

![The hoop2vec Players page, with lists of the best and most important players](players.png "The Players page as of November 25.")

## Two numbers

Every D-I player gets two numbers. The first is Value. It's how many points per 100 possessions better his team is with him on the floor than it would be with an average D-I player. Haugh's is +11.1, third in the country. Vanderbilt's Tyler Tanner, a 6-foot junior guard, is first at +11.2.

The second is Impact, which adds playing time. It's what a player adds to his team's rating compared with a replacement-level player, the kind of guy any team could find at the end of its bench. A great player who plays 15 minutes a game doesn't add as much as a very good one who plays 35. Haugh plays 33 minutes a game, which makes his Impact of +10.8 the highest in D-I.

## Where value comes from

Value starts from box plus/minus, a standard way to estimate a player's contribution from his box score. hoop2vec adjusts each game for the strength of his team and the opponent, using the ratings from the morning of that game.

Early in the season there isn't much to go on. So the number starts from a prior: what the player did last season, the typical jump for his class, and his recruiting ranking. As minutes pile up, this season's games take over. A freshman with five good games will still be partly rated on his recruiting ranking. By February, he won't be.

## Injuries

Players also feed the game forecasts through injuries. Every morning hoop2vec reads public injury reports and gives each player an availability. A healthy player is at 100 percent, a questionable one is at 50 percent, and a player ruled out is at zero.

The team ratings already reflect the players who've been playing. So the adjustment only counts the difference between who's available now and who usually plays. If a starter has missed the last three games, the ratings already know that. If he's out tonight for the first time, the forecast moves.

Florida is a good example. Boogie Fland was playing about 25 minutes a game before a shoulder injury. With him listed as out, the model takes about two points off Florida's rating until he's back.

The page shows rotation players by default, which means 15 or more minutes a game. There's a setting to show all 4,869.
