---
shortName: watcher
title: The $watch Watcher
summary: A friendly digest performance monitor for Angular
colorName: green
mainImg: blinky.jpg
animation: blinky.gif
classNames:
- whiteBgMainImg
technologies:
- title: Angular
- title: Vanilla JS
links:
- title: Live Demo
  url: http://www.simple.gy/ngWatchWatcher/
- title: GitHub Repo
  url: https://github.com/SimplGy/ngWatchWatcher
---

`ngWatchWatcher` helps you answer questions about your Angular application's performance:

* Keep an eye on the timing of your `$digest` cycle as your app grows
* Know if you're cleaning up watches and scopes properly
* Preempt performance issues by identifying them early

You can think of it like the check engine light for your ng-code.

Check out the [live demo](http://www.simple.gy/ngWatchWatcher/). In the upper-right you can see the light blinking to indicate when Angular is really churning.