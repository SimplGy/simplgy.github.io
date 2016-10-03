---
shortName: blockchain
title: Blockchain Visualizer
summary: Displays the Bitcoin Blockchain in near real-time
colorName: orange
mainImg: blockchain.jpg
mainImgBgColor: "#feac97"
links:
- title: Live Demo
  url: http://www.simple.gy/bitcoin/
- title: GitHub Repo
  url: https://github.com/SimplGy/bitcoin 
---

I happened to be in Hho Chi Minh City during a Bitcoin meetup. I met some very interesting people there for whom Bitcoin was a very practical, everyday part of their lives.

It got me thinking about how the Blockchain really works, and how accessible and visualizable it actually is.

Turns out, it's really easy to visualize and the data is extremely accessible. Here's a sample of the data you can get:

![Hover a block for details](/projects/img/blockchain/blockchain-details.png)

This visualization shows the bitcoin blockchain. Recently confirmed blocks are at the top and older ones are at the bottom. Blocks are grouped by day.

Each rectangle is a single block of many transactions. Bitcoin processes about one block every 10 minutes.

The width of the block represents the number of transactions.

The color represents how close it is to capacity in byte size. Blocks are limited by the bitcoin protocol to 1mb, and many blocks are already very close to that limit, as you can see.

The coloring of the blocks is pretty, and meant to point out what was at the time (and, incredibly, still is) a critical issue with the blockchain: The byte limit is too low and going to cause a bottleneck.

When I built this a year ago, it used to be much more colorful, but today almost every block that has been processed is deep red, representing it is at it's byte limit.

Then (mid 2015):

![See all the roomy yellow blocks?](/projects/img/blockchain/2015.png)

Now (late 2016):

![Look at all the scary dark red blocks](/projects/img/blockchain/2016.png)













