---
shortName: gol
title: Game of Life
summary: Conway's classic built in JS on Backbone.
colorName: green
mainImg: gol.jpg
animation: gol.gif
technologies:
  - title: Backbone
  - title: jQuery
  - title: CoffeeScript
  - title: Grunt
  - title: SASS
links:
  - title: Live Demo
    url: http://www.simple.gy/gameOfLife/
  - title: GitHub Repo
    url: https://github.com/SimplGy/gameOfLife 
---

This project was built at Game of Life hackathon. I was using Backbone at work and thought each cell should be a Backbone Model. In that way, they are all autonomous beings.

Using a relatively heavy Backbone model for each cell is not the most performant way to have done it but there is some architectural beauty there and it was a fun experiment.

You can interact with the simulation as it is running, which turned out pretty neat and makes it feel almost game-like.

Here's a larger animation of the app to give you a real sense of it:

![Large Game of Life Animation](/projects/animation/gol-large.gif)