---
title: "UX: Wide + Shallow or Narrow + Deep?"
excerpt: "A framework for thinking about UX that applies to almost every visual product decision."
color: #4321fc
---



I've been noticing that I keep coming back to this particular framework when thinking about UX and product decisions, so I wanted to have a quick think about it and write something up.

The framework is this:

When deciding how to make a feature, you can choose either:

1. Wide and shallow
2. Narrow and deep

The first option is like the menu at an ice cream store that specializes in flavor variety:

![menu of ice cream choices - from lexica.art](/img/ice-cream-menu.jpg){: .hero-image }

Everything's right there at your fingertips, just one decision away. But, there are also a lot of options.

In a UI, wide and shallow choices would result in an interface where many items are immediately accessible to the user, such as a long menu or an overview of many items (eg: the icons on your phone's home screen).

The second option is like ordering at Chipotle.

![a long path with few choices - from lexica.art](/img/guided-path.png){: .hero-image }

One easy choice at a time, but lots of steps: Salad, bowl, or burrito? Black beans or pinto? What kind of meat?

In a UI, this might involve a multi-step guided process to get to the choice, such as a wizard or a series of dialog boxes that guide the user through a decision-making process (eg: tax software).

## History / Past References

I didn't come up with this idea. The (AI Chat Bot) thinks it was from Jared Spool [2], but I can't find an article about it from him today. It also might get mentioned in "The Design of Everyday Things" by Don Norman and/or "Don't Make Me Think" by Steve Krug.

## Choosing

The choice between wide and shallow or narrow and deep UI design depends on the content you're presenting and the goals of the user and business. We should aim to strike a balance between these two approaches, providing users with the appropriate level of guidance to make informed decisions without feeling either overwhelmed or baby-sat.

## Real Examples

What's really sunk in over the last little while is that this question comes up all the time in the *little* things -- like, organizing five things rather than a hundred things.

Eg:

1. Should we add all the buttons to the top so they're one click away, or collapse them them into a "settings" menu?
2. Should we ask people what kind of car they want to buy first, or let them tell us they want to buy a car and walk them through the choices after that?

In "micro choices" like whether to arrange things as `a,A -> [abc,ABC]` or just put all `[abcABC]` up on the main screen, the same concepts apply, they're just smaller effects. So rather than "it's SOOOOO tedious to go through all the steps of the wizard", the feeling will be more like "I always have to click x, then y, which is ever-so-slightly irritating".

## Shallow

A wide and shallow design may be more appropriate for interfaces where the user needs to access a large number of options quickly. Choose *shallow* when the choice is easy to make, they're in the same "category" already, and the distribution of intended or actual user behavior is about the same.

The risk to avoid here is overwhelming people with too many choices. (aka: "cluttered" or "confusing")

## Deep

A narrow and deep design may be more suitable for interfaces that require careful decision-making and where users may need guidance or prompts along the way.

Choose *deep* when the choice is hard or high-risk, when each choice is in a different mental category, or when certain end states of the flow chart are much less likely than others.

The risk with this approach is it can become tedious if there are too many steps involved. Also, the distance (in time and visual space) increases as you go through many steps, so in a narrow and deep design, UI feedback may be more crucial, as the user may need reassurance that they are making the right choices at each step of the process.

---

Whether wide and shallow or narrow and deep, the ultimate goal should be to create an interface that is simple, obvious, and effective.






[2]: https://articles.uie.com/




