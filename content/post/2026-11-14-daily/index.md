---
title: "daily: a five-minute news brief written by an agent"
author: kearneymw
date: 2026-11-14
categories:
  - ai
tags:
  - AI agents
  - Claude Code
  - Python
---

Every morning at 8:23 Eastern, a Claude Code scheduled task researches and writes a news brief, commits it to [daily](https://github.com/mkearney/daily), and sends a notification to my phone. The repo's front page is always today's brief, and every earlier one is archived under `briefs/`.

Each brief has three parts: up to five top stories, one line of market numbers, and a few things going viral. It's meant to be read on a phone in under five minutes, which works out to about 3 KB of Markdown. Here's part of Saturday's:

> **Nationwide ground stop cancels 7,000+ flights.** The FAA halted all US departures for about four hours Friday after communication problems at several air traffic control centers. Flights resumed after 8:15 p.m. ET.
>
> **Markets · Fri Nov 13:** S&P 500 **−0.4%** · Nasdaq **−0.9%** · Dow **+0.1%** · 10-yr 5.15% (+5 bp)

## Scripts for facts, the model for judgment

The split that works: anything that is a lookup is a script, and anything that needs judgment is the model.

- `headlines.py` pulls Google News Top Stories plus its U.S., World, Business and Tech sections, in Google's order, with the outlets covering each story. Position and outlet count are a decent proxy for how big a story is, so a story from a single outlet needs a good reason to lead.
- `markets.py` gets index changes and the 10-year Treasury yield from FRED, works out which trading session to report, and handles weekends and holidays. At 8:23 FRED usually has the Dow and Nasdaq but not yet the S&P 500 or the 10-year, so the script marks those as missing, and only those get filled in from web search.
- `viral.py` reads the day's top Reddit posts from public RSS (Reddit's JSON endpoints are blocked from cloud servers), plus Bluesky trending topics, Google Trends and Wikipedia's most-read pages as signals of what people are talking about.

The model reads all of that, decides what matters, checks it and writes.

## Rules for the usual failures

A daily summary goes wrong in predictable ways, so the rules target those directly.

**Repeats.** Each run reads the last seven days of briefs first. A story comes back only with a material development (a decision, vote, ruling, resignation or casualty count), its headline marked "(update)", and it says only what's new. Reaction and analysis don't count. A slow news day means fewer stories, not old ones.

**Accuracy.** Every top story is checked against a second search on a major outlet, and stories found only on aggregators or blogs are dropped or labeled unconfirmed. Event dates are checked, not article dates. When sources disagree on a number, the most precise primary source wins.

**Tone.** Plain, neutral, short sentences. No opinion, hype or filler. Every sentence carries a fact.

## The rules live in a file

The requirements are in [`BRIEF.md`](https://github.com/mkearney/daily/blob/main/BRIEF.md) as 21 numbered rules, and the scheduled task's prompt implements them. The file's first line says to change both together. Numbered rules make it easy to say exactly what went wrong when a brief misses, and to fix it in one place.

The whole thing is three small Python scripts, a file of rules and a schedule. The [repo](https://github.com/mkearney/daily) has all of it, along with every brief so far.
