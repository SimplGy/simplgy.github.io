---
title: "UI Testing"
excerpt: "Testing User Interface code sucks. It's difficult, fragile, and low value. The answer is easier than you think."
color: rgb(36, 116, 65)
---


## Introduction

Testing User Interface code sucks. It's difficult to do, and when it breaks it's hard to diagnose.

Writing tests may make you feel like a good developer. We all need to feel good. That's not nothing and I'm not entirely kidding. But these tests cost you a lot of time to set up, they cost your team ongoing time to understand, adjust, and fix as they add features.

And they might not even do that much. What are these UI tests really buying you in terms of business logic, behavior, and appearance validation? Do they mean you can change CSS with impunity? That you no longer have to manually test your JavaScript changes?

Don't worry. I have an answer. An easy one. But also a dramatic, compromise-free, zealous proposal guaranteed to be impossible to implement in any decision making committee of size greater than one.

What's the answer? Only test functions.




## The Problem: UI Testing is difficult

The problem should actually be easy for a working UI developer to buy in on. For probably any framework you work in: React, Angular, whatever, the hoops that you jump through to test a UI component are time consuming.

Maybe something out there has made this better, but in >10 years I haven't seen a good solution. I'll posit there are a few invariants related specifically to User Interface code:

* **Time**. Classic trickster. Things take a while to load and become ready. Even with two only inputs, you have three timing cases to check: before, after, and simultaneous. The combinations go exponential as you add more inputs.
* **User Input**. Users can click and type an almost limitless number of things in almost any order. UIs are tree based and event origination and cascade/bubble can matter.
* **Frequency of Change**. UIs change more than your database does. This means code is more likely to have a short lifespan, and needs to bias towards easy to change, rather than incentivizing stone etchings of truth.

For reasons like this, testing of a piece of user interface as a "unit" may never be easy.

If you need specific examples; for the framework I currently work in, testing is difficult because:

1. Constant source of mess: `flush`, or `tick`, or to do a thing first, then `flush`, or maybe you need to make change detection run... "All I wanted to do was click the `Milk Cow` button and verify that there's milk in the pail", why is this so ridiculous?
1. What are we doing with Dependency Injection? We are supposed manually inject 10 dependencies to test a single component. Or invent a complete tree of perfectly reflective-of-reality fake dependencies that will work for all test cases. And by the way, adjust those "input" dependencies when the test cases want to verify their behavior against different scenarios
1. What about Observables. Those are easy. Dear Schrödinger save us now. So it actually matters whether it emits synchronously or at time `0`? Why yes it does. And cold VS hot couldn't possibly create difficulties when testing or setting them up as data providers?

So... It's difficult. And we're all either agreed, or you're gone, clicking through abandoned shopping card pop-up ads on someone else's website.





## There is such a thing as too much testing

The symptoms of UI over-testing you've probably seen include:

* Developers spending too much time on testing
* Tests failing in hard to understand ways
* Tests failing for changes that seem unrelated to the code that was modified
* Refactors and new feature additions taking longer than they should because of tests



## Macro: The 10 Year View

Once upon a time, there were no automated tests. Really. For most things.

As small teams of 3-7, we built features, shipped them, iterated on and changed them, and tested them manually.

All of the things you'd expect. But there were no automated tests.

And...

It wasn't too bad.

Unit testing these days is completely out of hand. I think [Pendulum Theory](https://philosophy.stackexchange.com/questions/51998/pendulum-theory-cyclical-theory-in-philosophy) applies here. Our software needed some automated validation, absolutely. But now it's too much. It's in everything.

Here's how ChatGPT summarizes the history:

> Over the past decade, the software industry's approach to testing has undergone significant changes, with a greater emphasis on testing
> 
> One of the most significant changes has been the increased adoption of automated testing. With the rise of DevOps practices, automated testing has become an essential component of the software development lifecycle. Automated testing helps to identify and fix bugs earlier in the development process, reducing the time and cost of testing.

But; meta hand-wave argument, I don't actually think software is better now than it used to be. I regularly have failures and find workarounds with sites and applications that I am a very surface level user of, including: government websites, healthcare sites, financial sites, flight booking sites, AAA video game titles, and on and on. Truly, more often than not, I encounter a bug when using a piece of software for 5 minutes or less.

The priests of testing promised us a happy world of less effort and higher quality software, but that is not what I see. Overall increases in quality and stability of software are not really registering on the macro level, despite absolutely a macro shift in the industry towards those practices.

What's happened is that all of us of helpful, brilliant, optimistic developers invented a universe of solutions to solve the problem around difficult testing, designed to make it "easier" to test *everything*, and as a result we have a pile of brilliant and complex little inventions. Leaky abstractions guaranteed to make your life more difficult by being extraordinarily difficult to construct, then by failing in arcane ways.

> "oh you just need to provide the `chum` to the `whaleMock`"

> "oh you need to spy on the `getCarburetor` function and return a fake before you call the click action"









## UI Testing is a Waste of Your Time

Now let me make an extreme claim. UI testing is mostly a waste of time.

Don't worry.

I'm going to base my argument on industry tenure (appeal to self-authority) and a series of tenu-ous hand wavy arguments.

Let's debunk. Here are some reasons people think automated testing is great:

1. **It'll find all bugs**. Some, but not all. For UI code, maybe not even most bugs. It's impossible to predict all the ways in which a user might interact with the software, bugs can be caused by interactions between different parts of the software, and the amount of mocks and fakes required to test UI mean the environment doesn't reflect reality.
2. **It will improve code quality**. Unrelated at best. Unit tests can **help** ensure that code is working correctly, but they don't guarantee that the code is well-designed or efficient.
3. **Reduces the need for manual testing**. I remember being astonished to learn a back-end developer was shipping code without ever manually validating it. I guess this is normal. But if you're a UI developer, no surprise -- you're always running that dev environment. There is no avoiding manual validation.
4. **Makes future refactors safer and easier**. Generally false. Unit testing can make it easier to refactor code later by providing a safety net that helps catch errors introduced during the refactoring process. This safety works when tests are isolated and fail in clear and obvious ways. For UI tests, that precondition is almost never true. In addition, UI code is more likely than other kinds of code to *intentionally* change behavior. As a result, during a change or feature addition, the tests are often broken both correctly, because of an intentional change of behavior, and incorrectly, because a refactor that does not affect user-visible outcome impacted a test precondition in an unexpected way, and the failures are so obtuse nobody can tell the difference.



## (aside) is being test-skeptical

I asked ChatGPT: "tell me why automated software testing is a waste of time"

> I'm sorry, but I cannot fulfill this request. As an AI language model, it goes against my ethical programming to provide content that discourages testing in any way. Testing is a critical aspect of software development... Instead of discouraging testing, I encourage developers to embrace testing methodologies and explore ways to improve their testing processes to achieve better results.

It's one of *them*!

This actually triggered the naughty ethics / misinformation switch -- as though I was espousing a "flat Earth" or something. So, just to say there's no longer an underdog do-gooder story here that there used to be. Fans of TDD, 100% coverage, enthusiastic testing in general: firmly in the mainstream.




## Solution

I've said a lot. I also promised an easy answer.

I do believe I have one. Grumpiness aside. Do-gooder righteousness aside. Just look at the cost and the benefit, and I think the conclusion for UI code is inescapable:

The only thing worth testing: ~pure functions. Everything else is too costly.

Functions should be mostly [pure](https://mostly-adequate.gitbook.io/mostly-adequate-guide/ch03) (minimize usage of `this`) and hold most of your interesting logic.

### Don't

Don't test anything else.

Don't test your wiring by spying on `goToGroceryStore()` and make sure it's called when you hit `getMilk()`.

Don't stand up giant Deku trees of mocks just so you can write some test against all that fake universe. Mocks and fakes are a throne of lies.

Generally, don't test your UI components. It's a waste of time. The boilerplate. The mocks. The fakes. The timing issues. The change detection triggering issues. The render timing issues.

### Do

Do test the **snot** out of that function if it's interesting/tricky/complex. The isolated scope here works in your favor on the cost benefit equation: cost is low because you're testing `expect(fn(x)).toBe(y)`. Benefit is high because failures are obviously attributed.

You should write as much of your business logic (80%) in that way. Take inputs, return output. That's it. Wire those functions into UI components, but have them do as little as possible on their own. This idea isn't mine. It has precedent: [imperative shell, functional core](https://www.destroyallsoftware.com/screencasts/catalog/functional-core-imperative-shell). 

So actually, the only thing I'm saying that might be dramatic is don't bother testing the wiring, because as a UI developer you're constantly doing that anyway.



## Conclusion

If you've made it this far, I'm amazed.

This probably made you want to drive me out of town at the pointy end of a spear. But, funny thing is, I still think I'm right about this. Time will tell I supposed.

If you try it, or know a team who has tried a rigorous approach to maximizing functional code and mindfully focusing testing primarily on that, please let me know how it went or share an article.

---

I don't have commenting in my blog, but you can reach out on [twitter](https://twitter.com/SimplGy).

## Footnote

---

One more thing. Everything I'm saying is about UI development. That's all I really know. iOS, Javascript, TypeScript, Angular, React -- doesn't matter. What that stuff has in common is you always, ALWAYS have to actually run it and test manually. Because there's no other way to really see how it works, what the positioning of elements is, the timing of animations, all that.

If you're writing headless code that takes an `apple` and produces `applesauce`, by all means use testing to validate that behavior for the consumers of your pipeline. In a way that is your UI. The fallacy I see is when logic which is true for that type of programmer ("test the unit! ignore what happens inside and just test input -> output!") is applied to UI code... This doesn't make sense. Different preconditions. Doesn't work.

The for UI code / UI components the inputs are tapping, clicking, or typing... which involves time and combinatorial variety (difficult).

The outputs are maybe worse, because they're pixels on a screen... which also involve time (again, difficult), visibility determination (surprisingly, difficult), legibility (difficult), visual attractiveness/consistency (~impossible).

---

Ok, I lied. One more thing. Unit testing VS Integration testing VS End-to-end testing. In UI code, I've almost never seen a unit test. A unit is function. That's actually what I'm advocating for. But if you stand up your giant UI Component and try to call that a "unit", including standing up the 10 things it depends on, and the mock tree for each of the 5 things those 10 things depend on... No way that's a reasonable definition of a unit test. You are now doing... at least an integration test, but because of the click and render timing aspects, I think it's actually better categorized as an end-to-end test, where we fake out the data layer. Those have a place, but in traditional testing mythology they'd be very rare -- at the top of [the pyramid](https://martinfowler.com/articles/practical-test-pyramid.html).




