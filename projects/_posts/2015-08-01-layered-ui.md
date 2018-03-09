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
linesOfCode: 71000 # only counting the "main language, eg: .js or .coffee"
---

I built Floaty as an abstraction to manage layers in a large application's UI.

This component manages the depth and dismissibility behavior of other layered elements, leaving a clean API for the end-developer.

This included tooltips, drop downs, modals, and popovers.

By using a central abstraction, challenges like "dismiss the topmost floating element when the background is clicked" become very straightforward and performant.

It is implemented for an Angular app as a reusable set directives and factory methods. It allows the developer to create tooltips, toggle-able panels,
and modals of N depth without requiring knowledge of the other layered elements being used at the application at that time.

## Side Note: Scale

This was part of a large application. Here's [cloc](https://github.com/AlDanial/cloc) output:

```
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
CoffeeScript                   722          13819           6447          70657
SASS                           124           1895            598           8014
HTML                           185            585            232           4123
Markdown                         3             58              0            136
JSON                             1              0              0              3
-------------------------------------------------------------------------------
SUM:                          1881          20081           9585         177776
-------------------------------------------------------------------------------
```

`70k` Lines of CoffeeScript! And CS is a terse language, so that's probably 100k lines in JS.

And yep, I removed `bower_components` and `node_modules` from the counts.