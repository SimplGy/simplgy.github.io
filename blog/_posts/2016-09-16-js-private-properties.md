---
title: Private Properties in JS
excerpt:
  In JavaScript, you can't hide object properties, so private instance properties are... impossible?
banner: "https://farm4.staticflickr.com/3584/3808662116_97708ee26c_b_d.jpg"
bannerCaption: "Photo by flickr.com/photos/helloclams: http://tinyurl.com/j29yr89"
---

A few years ago, I was learning Ruby and C# and also building a pretty large JS application.

I wanted to use some of the access modifiers I was seeing in these other languages to improve the APIs in my JavaScript app.

There is (or was) a popular truism that JavaScript's prototypal model is better than Classical Inheritance because it's a superset. Succinctly put:
 
> You can model any Classical Inheritance behavior with Prototypal mechanisms.
> - The Internet

Great! I had a thing to model (private members) and all I needed to do was figure out how. Let's [ask the internet](http://stackoverflow.com/questions/9572029/implementing-private-instance-variables-in-javascript).

The answer to my question at that time was basically: "no", or one of these workarounds:

* **Private by Convention**: name private methods with an underscore. eg: `this._name`. But... It's just a convention.

* **Private by scope, with method duplication**: put private variables in the Constructor/factory function *and* define all your privileged methods on `this`. eg: `this.greet = function(){}`. This is not the most efficient. It's probably not a performance issue in most situations, but I also don't think it "feels" architecturally correct. I feel like I *can* reuse something, I *should*.

Recent studying has reminded me of two central truths needed to resolve this issue.

## Truth 1

> You cannot hide properties of an object. Ever.

You can't hide properties in ES3, 4, or 5. You can't in ES6 either, and as far as I know not in any future proposal. (Please tweet wonderful discoveries [@simplgy](https://twitter.com/simplgy))

Instead, if you have a reference to the object, you also have access to all the properties. Simple as that.

## Truth 2

> Functions retain a reference to their scope, even if nobody else does.

This is sort of obvious if you do much in JS. But, when considered with *Truth 1*, it's clear that this will be our only way to achieve something like private members.

## Now What?

It's clear then, that we can't put our private data on properties of the object we return to our consumers. If we did, it would never be private (see [Truth 1](#truth-1))

What we *can* do, however, is hide identifiers in scopes nobody else has lexical access to (see [Truth2](#truth-2)).



## A Way Forward

A function retains a reference to its scope environment (closure), even if nobody else does. We can leverage this to hide all of our "instance data".

By using an IIFE to capture our scope, we can have our instances point to that scope while still hiding it from anywhere else in the program.

Here's a design:

{% highlight js %}
const Person = (function(){
  var i=0;
  const me = {};
  function Person(name) {
    this.i = i++;
    me[this.i] = {}; // All our "private instance" data will live in this hash
    me[this.i].name = name;
  }
  Person.prototype.greet = function(){ return "Hi, I'm " + me[this.i].name }
  return Person;
})();

var eric = new Person("Eric");
eric.name; // undefined
eric.greet(); // Hi, I'm Eric
{% endhighlight %}

So, this is what we're looking for, right? And while there's some boilerplate with `me[this.i]`, it's all internal to our Object's implementation, our callers never have to see it, so from an API design perspective I think that's not bad.

We can't make our `i` private in any way except convention, so if somebody decides to fool around with that they're going to switch data around in very surprising ways, but I think that's an ok compromise.

## Great! Except...

There is one huge, giant caveat though. Memory leaks.

![warning button](http://i.giphy.com/l0HlQsyujTwFgxXjy.gif)

This structure is practically designed to leak memory. Check this out:

{% highlight js %}
var eric = new Person("Eric");
var bob = new Person("Bob");
eric.greet(); // Hi, I'm Eric
bob.greet(); // Hi, I'm Bob
eric = null;
// The eric reference is nulled out, but what about that `me` hash of private data?
bob.i = 0; // Cheat to reference the previous object's data
bob.greet(); // Doh. Data for "Eric" is still here
{% endhighlight %}
    
Because of this (and pub/sub apis) I am very much looking forward to WeakMap. With a WeakMap, we can implement private members beautifully:

{% highlight js %}
const Person = (function(){
  window.map = new WeakMap(); // demo only: public so you can verify that the data is garbage collected
  function Person(name) {
    map[this] = {};
    map[this].name = name;
  }
  Person.prototype.greet = function(){ return "Hi, I'm " + map[this].name }
  return Person;
})();

var eric = new Person("Eric"); // our object graph is now `eric -> map[this] -> {name: "Eric"}`
window.map[eric].name // "Eric"
eric = null // now nothing references our object at key `map[this] -> {name: "Eric"}` and it can be garbage collected
{% endhighlight %}

I wish that were the happy ending, but so far I've been unable to verify in Chrome 52 that the data in the map is being collected by forcing garbage collection cycles and inspecting the object.

This means I'm also unable to verify the correct functioning of great-looking shims like [benvie/WeakMap](https://github.com/Benvie/WeakMap).

To be continued...