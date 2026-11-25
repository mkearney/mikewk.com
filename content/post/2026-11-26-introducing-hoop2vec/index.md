---
title: "Introducing hoop2vec"
author: kearneymw
date: 2026-11-26
categories:
  - sports
tags:
  - hoop2vec
  - college basketball
  - NBA
  - WNBA
  - Claude Code
  - Python
---

[hoop2vec](https://mkearney.github.io/hoop2vec/) is a basketball ratings and forecasting site. It covers four leagues: men's and women's Division I, the NBA, and the WNBA. Every team gets a new rating each morning, every game gets a forecast, and every player gets a value. All of it comes from free public data.

Each league has its own ratings, player values, team identities, and a Matchup Lab where you can pit any two teams against each other at any site. The college sites add NBA or WNBA draft projections and a projected NCAA tournament bracket. The pro sites have playoff odds instead. There's also a page for each league on how the models work and how well they've done in testing. I'll write about each part in its own post.

The name is a nod to word2vec, a method that learns a list of numbers for each word based on the words around it. I liked the idea of doing that for teams and players. hoop2vec doesn't actually use word2vec or anything like it, at least not yet. I kept the name anyway.

## Why basketball

I went to graduate school at the University of Kansas. I tutored players on the men's and women's basketball teams and went to a bunch of games. I live in Michigan now, and I still crave Free State Brewing Company and Burger Stand about once a week. That's most of why I care about college basketball as much as I do. It also means my favorite team is the correct favorite team.

I've been building models for it on and off for about ten years, going back to a college basketball dataset I put on data.world. I've tried to predict upsets. I've tried strange hybrids of Bayesian models, latent variable models, Elo, XGBoost, and a transformer fine-tuned on press coverage. A few of them filled out my brackets. I usually compared them against KenPom, and mostly what I learned is how simple and effective KenPom is. The site still looks like it's from the 90s, though, and I've always thought there was room for small innovations and features built around that approach. That's a lot of what hoop2vec is.

## How it got built

From about 2014 to 2020 I was making things all the time and sharing most of them, a lot of it on Twitter. Some of it was academic and some of it was just for fun. Then COVID hit, I had my first kid, and I changed careers. Now there are two young kids at home, and side projects pretty much stopped.

What's different now is that I can do this kind of work from my phone. I describe what I want to Claude Code, it writes the code, and I read what it did and push back. Most of hoop2vec got built that way, a few minutes at a time.

It started as two separate men's college projects. On the first, I described what I wanted and how I thought it should be done, then gave Claude Code license to build it and propose improvements. The second I directed much more strictly, iterating on what I thought would work. Then I merged the good ideas from both into hoop2vec, keeping whichever piece tested better where they overlapped. Once that worked, I carried the same approach over to the women's game, the NBA, and the WNBA.

I'm not very happy about working this way. I like control, and I like knowing how every piece works. I have less of that here than I'd want. But I've spent years building up expertise in analytics and data science, and this gives me a way to use it much faster than I could by typing everything myself. Without it, hoop2vec wouldn't exist.
