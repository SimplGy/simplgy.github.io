---
shortName: floaty
title: UI Layering Abstraction
summary: Manages modals, tooltips, popovers, and more
colorName: blue
animation: floaty.gif
mainImg: floaty.jpg
mainImgBgColor: "#3d81f6"
invertedTitle: true
isPrivate: true
technologies:
  - title: Angular
  - title: CoffeeScript
  - title: SASS
files:
  - title: floaty.factory.coffee
    url: https://gist.github.com/SimplGy/5e7f052b326c2a3ffc1b
---

I built Floaty as an abstraction to manage layers in a large application's UI.

This component manages the depth and dismissibility behavior of other layered elements, leaving a clean API for the end-developer.

This included tooltips, drop downs, modals, and popovers.

By using a central abstraction, challenges like "dismiss the topmost floating element when the background is clicked" become very straightforward and performant.

It is implemented for an Angular app as a resuable set directives and factory methods. It allows the developer to create tooltips, toggle-able panels,
and modals of N depth without requiring knowledge of the other layered elements being used at the application at that time.