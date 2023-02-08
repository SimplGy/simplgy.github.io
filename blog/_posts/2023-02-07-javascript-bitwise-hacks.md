---
title: "JavaScript Bitwise Hacks - My Favorites"
excerpt: "Bitwise hacks in JS can help you in your daily coding, even if you don't do a lot of nitty-gritty numerical and binary manipulation."
color: rgb(96, 60, 108)
initallyCreated: 2016-08-15
secondEdit: 2023-02-07
---


> Javascript bitwise hacks are tricks and techniques used to optimize code by taking advantage of bitwise operators. They can be used to perform arithmetic operations on numbers or manipulate values in memory more efficiently.

I don't do a lot of bitwise operations, but sometimes they can do really useful things. This article collects some of my favorites.

![Image from lexica.art](/img/lab-cat.jpg){: .hero-image }


## Number to binary

Not all that useful in everyday scenarios, but in case you ever need it, you can see the binary value of any number like this:

```js
(42).toString(2) // '101010'
```



## Permissive default params

JavaScript has for a while now supported default parameters. For example, if a function is defined as 

```js
function greet(name = "John") { 
  console.log("Hello " + name); 
}
```

...then calling the greet() function without any arguments will log "Hello John" to the console, since the parameter name has been set to its default value of "John".

However, this is only going to work if the inbound value is `undefined` (surprisingly, even calling `greet(null)` will not result in the default value being used [1])

If you want more permissive optional params, you can use the `||` operator.

The `||` operator in JavaScript tests whether one or both operands are truthy, returning the first value that is so.

This means you can implement more permissive default parameters in this way:

```js
function foo(options) {
  options = options || {}; // If options is a falsey value, use a blank object instead
}
```





## Cast to Number with 0 as a default/error case

> In Javascript, the double tilde (`~~`) operator is used to perform a bitwise NOT operation on its operand. This can be used to convert a value to the nearest integer, as the double tilde will round the number down towards zero.

```js
~~x;
```

This is a surprising syntax if you haven't seen it, but consider these outputs:

```js
~~(null)
0
~~(undefined)
0
~~(7)
7
~~("15")
15
~~([])
0
```

Can you see a use for this yet?

I use this one often for tracking "counts" of labeled things. This technique lets me use the same code path whether the key has already been counted against or not.

For example:

```js
const counts {};
const key = 'foo';
counts[key] = ~~counts[key] + 1; // if the key does not exist, this will evaluate to `0 + 1`
```



## Chop off all decimal places

Continuing on the `~~` train... It's sort of a shorthand round. It gives you the whole number.

If you ever want a quick 'give me an integer' behavior, consider this:

```js
~~123.456; // 123
``` 

Note that this doesn't perform mathematical rounding. It just chops off the decimal, so even `3.999` becomes `3`. Careful!



## Shorthand `.indexOf(x) !== -1`

An oddity of the `indexOf` api is that it returns `-1` when a value isn't found, rather than a nice non-value like `undefined`.

If you wrote `if (indexOf(foo))`, you'd actually be incorrect, because `0` can be a valid index location, but would be JS falsey and fail the `if` clause.

So this exception requires awareness of the API and we usually write `if (indexOf(foo) < 0)`, or something like it.

But, there's an alternative solution to this using `~`, the NOT operator. The NOT operator works like this on numbers:

```
~N -> -(N+1)
```

The `indexOf` function can return any value from `-1` to... well `Infinity-1`, I suppose.

This means that the not operator will convert `-1` to 0 (which is falsey), but everything else to a progressively smaller and smaller negative number (which are truthy).

So you can do this terse little approach, if you're brave:

```js
if (~haystack.indexOf(needle)) {
  // found
} else {
  // not found
}
```

## Wrap Up

Hope you enjoyed these. If you're feeling so inclined, let me know your favorite "I use this every week" bitwise hack on Twitter.






[1]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters#passing_undefined_vs._other_falsy_values