---
title: Create an Infinite Scroll List with Bacon.js
excerpt:
  In this tutorial I'll show you how to build an infinite scrolling mechanism using Functional Reactive Programming techniques using Bacon.js.
  If you, like me, have heard about FRP or Bacon but aren't sure where to start, this tutorial is for you.
  Give this 30 minutes of your time and you'll be rewarded with a new way of thinking about programming.
---

> In this tutorial I'll show you how to build an infinite scrolling mechanism using Functional Reactive Programming techniques with [Bacon.js](https://github.com/baconjs/bacon.js).

[Live Demo](https://jsfiddle.net/yhvrcwog/2/embedded/result/) (The double scrollbar is an artifact of the jsfiddle)

Functional Reactive Programming, or FRP, is the [newish](http://hipsterdevstack.tumblr.com/post/39558331788/frp-yeah-we-were-doing-that-in-2012) [hotness](https://www.google.com/trends/explore#q=functional%20reactive%20programming%2C%20smelly%20old%20socks&date=1%2F2010%2072m&cmpt=q&tz=).
If you've been busy working, you may not have tried it out yet. Or you might have read a little about it. And then you may have been confused. I was. I did. I was again.

If you, like me, have heard about FRP or Bacon but aren't sure where to start, this tutorial is for you. The [intro](https://github.com/baconjs/bacon.js#intro) tutorial is neat, but sometimes you need to implement something less trivial to really understand a new technology. [Staltz's article](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754) does an awesome job explaining the abstraction. I recommend reading it when you want deeper understanding of concepts. I aim to give you strong hands-on experience. Give this 30 minutes of your time and you'll be rewarded with a new way of thinking about programming.

Infinite scrolling is a great candidate to implement with a functional reactive programming style because it involves a reasonably complex data and UI events that change over time. Keeping the display in sync using traditional imperitive programming techniques can be a bit hairy.

Let's begin.

## Getting Prepared

We'll need an html file that includes Bacon.js and Lodash. We'll also want a few CSS rules that are common to most infinite scrolling implementations, so I'll skip discussing them here. You can use [this gist](https://gist.github.com/SimplGy/850ca58f33f28f301125) to get started.

Once you have that file, let's add some variables.

{% highlight js %}
var totalResults = 10000; // let's assume this is known. You'd probably have to query for the result count in a real api
var rowHeight = 30;
var phonebookEl = document.getElementById('Phonebook');
phonebookEl.style.height = totalResults * rowHeight + "px";
{% endhighlight %}

So far nothing Bacony.

We're going to assume we know the result set size, and that all rows are the same height. In the real world we might need to query an API for the result set size and in that case we'd just wait to init the `phonebookEl` container until we get that information.

## Scrolling and Resizing

An infinite scroller needs to know which rows are on screen so it can manage the total number of DOM nodes. Too many and the browser will get slow.

This means we need to know which rows are on screen. Let's reason backwards from the UI events the browser can give us.
We know we're going to be interested in both scrolling and resizing.
We care about scrolling because this tells us which set of rows the user is looking at, and resizing because screen size tells us how many rows will fit on screen.

Let's have some bacon. We'll create streams for the scrolling and resizing:

{% highlight js %}
var scrolling = Bacon.fromEvent(window, 'scroll');
var resizing  = Bacon.fromEvent(window, 'resize').debounce(50);
{% endhighlight %}

[`fromEvent`](https://github.com/baconjs/bacon.js#bacon-fromevent) turns a normal browser event into a stream.

Debouncing our resize is usually a good choice, and Bacon makes it easy, so we added it already.

We care about the `y` position when we scroll, and the height of the screen after a resize:

{% highlight js %}
var scrolling = Bacon.fromEvent(window, 'scroll');
var yPos = scrolling.map(function(){ return window.scrollY });
yPos.log('y');
var resizing = Bacon.fromEvent(window, 'resize').debounce(50);
var windowH = resizing.map(function(){ return window.innerHeight });
windowH.log('height');
{% endhighlight %}

The [`map`](https://github.com/baconjs/bacon.js#observable-map) function takes a stream and applies a transformation to each value. In our case we just grab the global `y` and `height` values value for each point in time.

We're logging the results to make sure we're getting what we expect so far. You can put `.log` on any Bacon observable. We should see fluid logging of the `y` position as we scroll and slightly debounced logging of the window height when we resize the browser.

Actually, all we care about are the `y` position and screen height. We'll never reuse scroll and resize so let's simplify:

{% highlight js %}
var yPosition = Bacon.fromEvent(window, 'scroll').map(function() { return window.scrollY });
var screenHeight = Bacon.fromEvent(window, 'resize').debounce(50).map(function() { return window.innerHeight });
{% endhighlight %}

## Which Rows are Visible?

Now we can walk slowly towards our infinite scrolling problem. From a stream of `y` scroll position it's easy to calculate the first row that is visible on screen:

{% highlight js %}
var firstVisibleRow = yPosition.map(function(y){ return Math.floor( y / rowHeight ) }).skipDuplicates();
firstVisibleRow = firstVisibleRow.toProperty(0); // Seed the initial value.
{% endhighlight %}

[`skipDuplicates`](https://github.com/baconjs/bacon.js#stream-skipduplicates) causes the stream to not emit new values if the values is the same. This is good. Otherwise, every scroll event would fire a new `firstVisibleRow` event. Since our rows are 30 pixels tall, that means we would otherwise be sending lots of duplicate messages.

[`toProperty(0)`](https://github.com/baconjs/bacon.js#stream-toproperty-initialValue) tells the observable property it should start with the value `0`. A browser doesn't throw a scroll event if you start at the top of the screen, so we need to seed the start value. If you start partway down the screen, as when you reload and have already scrolled, this is init'd to `0` and a scroll event is thrown after, so that case works as well.

We are now calculating the first visible row in a way that updates in real time as we scroll, which is awesome. Let's do the same thing for the number of rows that can fit on screen:

{% highlight js %}
screenHeight = screenHeight.toProperty(window.innerHeight); // Seed the initial value.
var rowCount = screenHeight.map(function(screenHeight){
  return Math.ceil( screenHeight / rowHeight)
}).skipDuplicates();
{% endhighlight %}

Similar to how we seeded the first visible row, we need to seed the screen's height with `.toProperty(window.innerHeight)` because the browser doesn't throw a scroll event on page load. The row count can be the same for many values of screen height so we use `skipDuplicates`.

If you log `rowCount` and `firstVisibleRow` you should see a beautiful, live updating stream of all the data you need to compute your infinite scroll elements:

{% highlight js %}
rowCount.log('Row Count');
firstVisibleRow.log('First Row');
{% endhighlight %}

What we want is an array of all the row indices that are visible on screen. Let's combine these streams using [`combineWith`](https://github.com/baconjs/bacon.js#bacon-combinewith). This method creates a new stream based on other streams. Looks like this:

{% highlight js %}
function calcVisibleRows (firstRow, rowCount) {
  var visibleIndices = [];

  // Limit the number of visible rows
  lastRow = firstRow + rowCount + 1;
  if (lastRow > totalResults) {
    firstRow -= lastRow - totalResults;
  }

  for (var i = 0; i <= rowCount; i++) { visibleIndices.push(i + firstRow) }
  return visibleIndices;
}
var visibleRowIndices = Bacon.combineWith(calcVisibleRows, firstVisibleRow, rowCount);
{% endhighlight %}

Our `calcVisibleRows` function just takes two integer indices and calculates what should be visible on screen. It is bound by the result set size in this case, but you could remove this if you have a truly infinite data set.

Because it's all streams, the recalculation happens whenever any of the source streams change, so if we resize or if we scroll, the `visibleRowIndices` will be recalculated.

Here's a good place to pause. Think about what this stream combination is doing. It's a pretty great wow moment. Doing this the traditional way by responding to scroll and resize events, then referencing state variables is a much more fragile and less clear way to define the behavior we want. I hope you're starting to see some of FRP's power. It's pretty cool.

![pausing for reflection](http://i.giphy.com/yidUzHnBk32Um9aMMw.gif)

...feeling it?

Ok, let's keep going.

## Rendering

There is one more step we can take in streams to get our data closer to exactly what the UI needs to do the drawing. Let's create two more streams. One for rows that have just become visible (because we need to draw them), and one for rows that have gone off screen (so we can clean them up).

{% highlight js %}
var rowIndicesRemoved = visibleRowIndices.diff([], _.difference);
var rowIndicesAdded   = visibleRowIndices.diff([], function(prev, cur){ return _.difference(cur, prev) }); // longer form here so we can reverse `cur` and `prev`
{% endhighlight %}

Bacon's [`diff`](https://github.com/baconjs/bacon.js#observable-diff) method sends the previous and current value of a stream to a callback function. Then we use lodash's [`difference`](https://lodash.com/docs#difference) method to compute the difference between two arrays. If we used to be showing rows `[1,2,3]`, and now we're showing rows `[2,3,4]`, the `_.difference` is `[4]`. Calling with the arguments in the other order gets the removed elements. It's a little confusing that `diff` and `difference` have similar names. They aren't related. You can implement any function you want and pass it to Bacon's `diff` method.

Now we have exactly the data we want in streams, let's just do our drawing:

{% highlight js %}
var rows = {}; // cache row dom elements for quick and lookup-free cleanup

rowIndicesAdded.onValue(  function(indices){ _.map(indices, renderRow) });

function renderRow(idx) {
  var row = document.createElement('li');
  row.innerText = idx;
  row.style.top = idx * rowHeight + 'px';
  phonebookEl.appendChild(row);
  rows[idx] = row;
}
{% endhighlight %}

What what what? Any time we get a new value in the stream of added row indices, want to do something, so we use [`onValue`](https://github.com/baconjs/bacon.js#stream-onvalue). What we want to do is send each index in the array of added rows to the render row method. There is usually only one index, but if you jump your scrolling or do it quickly, there can be a lot. Passing these indices on to renderRow individually is what [`_.map`](https://lodash.com/docs#map) is doing for us.

At this point you have a working scroller, but old rows aren't being cleaned up so we get none of the benefits of an infinite scroll widget. Here's the last step, cleanup hidden rows:

{% highlight js %}
rowIndicesRemoved.onValue(function(indices){ _.map(indices, removeRow) });

function removeRow(idx) {
  if (idx == null) { return }
  rows[idx].parentElement.removeChild(rows[idx]);
  rows[idx] = undefined;
}
{% endhighlight %}

To clean up, we just pull the element out of the DOM and remove the cache reference. I would have used `delete` but I think modifying the object's hidden class is slower. Would have to test but I don't have a perf issue yet. Also, reusing DOM elements instead of appending and removing them would be faster, but it would increase the complexity and I wanted to keep this focused on Bacon.js and FRP.

You should now have a working infinite scroller that prints the index of the row, with all your rendering confined to a nice single method that is provided the row index.

## Links

* [All the code](https://gist.github.com/SimplGy/d6362369ac4ebf27f3ec)
* [Working Demo](http://jsfiddle.net/yhvrcwog/2/)

## kthxbai

I hope you're feeling excited about this new way of thinking about programming, and proud of yourself for the beautiful work you've done today.

Tweet at me or something if you like this post. If there's enough interest I'll do a part two that integrates an async data feed.

![slow smile](http://i.giphy.com/R0TrhAtNeUC0E.gif)

Good work, you.



