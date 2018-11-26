---
title: "UI Trick: Range Slider With Two Handles"
excerpt: "With a little bit of javascript, you can make two range inputs look like a modern two-handled range selector."
color: rgb(172, 203, 235)
---

I wanted a two handled "range" control like you'd use for picking a price range, but the native element doesn't support that ([source](https://stackoverflow.com/questions/4753946/html5-slider-with-two-inputs-possible)).

What if I put two `input type="range"` controls right next to each other? Could they be made to appear like a single control?

![sketch of combining two input ranges](http://simple.gy/img/dual-slider-sketch.jpg)

The idea:

As you drag the slider near the center boundary, add more "steps" to the input by changing the min or max. At the same time, give each input an amount of visual space that is proportional to the number of steps they're responsible for.

My hope was that changing this on the fly would appear flicker free and seamless.

If this could work, we'd have a control that's pretty close to native with almost no JS, which should be a win for durability and accessibility.

And it turns out it works pretty well. Here's a demo:

![animated demo](http://simple.gy/img/dual-slider-demo.gif)

See that little seam in the middle? That's the boundary between the two inputs.

Remaining Challenges:

* [Style](https://css-tricks.com/styling-cross-browser-compatible-range-inputs-css/) to conceal they're separate controls
* Support ranges of a single discrete choice

Live Demo:

<script async src="//jsfiddle.net/simplgy/z93s82xL/embed/result/"></script>

The key function is this:

```js
// As the user drags on input, update the available range and visual space for both inputs
on('input', 'mousedown')(a, b)(update);

function update({target} = {}) {
  let pivot;
  
  if (target === a) {
    if (a.valueAsNumber >= Number(a.max)) {
      pivot = Math.min(max - 1, Number(a.max) + 1);
    }
  }
  
  if (target === b) {
	   if (b.valueAsNumber <= Number(b.min)) {
      pivot = Math.max(min, Number(b.min) - 2);
    }
  }
  
  if (pivot != null) {
  	 a.max = pivot;
	 b.min = pivot + 1;
  }
  
  // Amount of visual/presentation space proportional to steps
  a.style.flexGrow = stepsIn(a); // how many steps in input `a`?
  b.style.flexGrow = stepsIn(b);
}
```

The [full source is here](http://jsfiddle.net/simplgy/z93s82xL/) if you'd like to play with it.

Thanks for reading.