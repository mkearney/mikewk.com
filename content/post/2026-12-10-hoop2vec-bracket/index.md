---
title: "hoop2vec brackets and playoffs"
author: kearneymw
date: 2026-12-10
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - March Madness
  - NBA
  - WNBA
---

College basketball ends in a single-elimination tournament. The pros play a long regular season and then a run of playoff series. [hoop2vec](https://mkearney.github.io/hoop2vec/) forecasts both, and they need pretty different math.

## The NCAA tournaments

The men's and women's NCAA tournaments now have 76 teams each, with a 12-game Opening Round before the usual round of 64. Until Selection Sunday, hoop2vec projects the field. Each conference's automatic bid goes to its tournament champion, or to its highest-rated team until that tournament is played, and at-large bids and seeds follow Power, the site's team rating. After Selection Sunday the real bracket replaces the projection automatically. The two tournaments are set up differently, too. In the women's tournament, the top 16 seeds host the first two rounds on their own campuses, so the model counts home court where the men's version uses neutral sites.

Most bracket models simulate the tournament thousands of times and count how often each team wins. hoop2vec works out the odds exactly. It has a win probability for every possible game, including each team's travel to that game's site, so it can calculate each team's chances round by round without any simulation noise. In the men's tournament, even the best team usually has well under a 50 percent chance to win the whole thing, since it has to win six games in a row against good teams. The women's game has bigger gaps between the top teams and everyone else, so a women's favorite can get a lot closer to even.

I've spent a lot of time over the years trying to predict upsets. One approach was to predict how many upsets would happen in a round, given the matchups, and then force that many of the most likely ones into my picks. hoop2vec doesn't do anything like that. Its picks come straight from the probabilities.

It fills out a bracket two ways. Most likely takes the favorite in every game. Pool-optimal is built for a pool that scores rounds 1, 2, 4, 8, 16, and 32 points, so it picks the likeliest champion first and works backward from there.

Winning a pool takes more than being right. You also want to be right when the other people in your pool are wrong. hoop2vec doesn't know what your coworkers are picking, so it can't help with that part.

March is also just hard to predict. In 936 past men's tournament games, every reasonable model I tested landed within noise of the others, including a plain efficiency rating. A single tournament is 75 games, which isn't nearly enough to tell good models apart.

## The pro playoffs

The NBA and WNBA sites have a Playoffs page instead of a bracket. Before the playoffs start, there's still a lot of regular season left to play, so hoop2vec plays it out 10,000 times, with each game priced by the game model at its actual arena. Each simulated season also shifts every team's strength by a random amount, sized from how much ratings have moved in past seasons between that point and the end. That's a big shift in November and a small one in April.

From there it applies the tiebreakers, the NBA's play-in, and the playoff format for each league. Each series is solved exactly from two numbers: the better seed's chance to win a game at home and on the road. That works from any series score, so the same code covers the regular season, the playoffs in progress, and a finished season.

I tested it on every past playoff series, predicted before game 1 by models trained only on earlier seasons. A simple rule, where the team with home court wins at its usual historical rate, is a decent baseline. In the NBA, hoop2vec does a fair amount better. In the WNBA there are so few series that most reasonable models look about the same.
