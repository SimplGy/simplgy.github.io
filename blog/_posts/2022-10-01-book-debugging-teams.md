---
title: "Book Summary - Debugging Teams"
excerpt: "As engineers & creators, problems are vague and certainty is rare. Still, large problems mean we need multiple people to move in the same direction."
color: rgb(13, 133, 133)

bookAuthors: ["Brian Fitzpatrick", "Ben Collins-Sussman"]
bookYear: 2016
bookTitle: "Debugging Teams - Better Productivity Through Collaboration"
bookLink: https://www.amazon.com/dp/1491932058
---

<!-- Book Image Link -->

<a href="https://www.amazon.com/Debugging-Teams-Productivity-through-Collaboration/dp/1491932058?keywords=debugging+teams&qid=1664655350&qu=eyJxc2MiOiIwLjc4IiwicXNhIjoiMC42NiIsInFzcCI6IjAuNzYifQ%3D%3D&sr=8-1&linkCode=li3&tag=&linkId=9cd75488171729d13de979ff8819c21e&language=en_US&ref_=as_li_ss_il" target="_blank"><img border="0" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1491932058&Format=_SL250_&ID=AsinImage&MarketPlace=US&ServiceVersion=20070822&WS=1&tag=&language=en_US" ></a><img src="https://ir-na.amazon-adsystem.com/e/ir?t=&language=en_US&l=li3&o=1&a=1491932058" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />

## TL;DR

This is a book about "soft skills".

As engineers & creators, problems are vague and certainty is rare. Still, large problems mean we need multiple people to move in the same direction.

In that environment, how do we all work better together and with the other teams in our organization?

The book proposes a very gentle and empathic model of teamwork they call `HRT` which I think is reflective of the authors' Google backgrounds.

Quote:

> The goal of this book is to help people spend more time creating and less time fighting -- by improving their ability to collaborate with other people.

## Selected Book Outline

### Three pillars - HRT

* **Humility**: You are not the center of the universe, and are open to self-improvement
* **Respect**: You care about others you work with. You appreciate their abilities and accomplishments.
* **Trust**: You believe others want to do the right thing and have good intentions. You're Ok with letting them drive when appropriate.

> Almost every social conflict can ultimately be traced back to a lack of humility, respect, or trust.

Related Skills:

* Lose the ego; go with collective/team ego instead.
* Learn to give and take criticism; humble about skills, trust the other person.
* Leave time for learning; trying a new technical area grants an instant +1 to your `humility` stat.
* Be patient; in challenging situations, this helps finds a way forward
* Be open to influence; choose your battles carefully.


### Team Culture

> Your team's culture is much like a good loaf of sourdough: your starter culture (your founders) inoculates your dough, and as the team grows, out pops a great loaf of bread.
> ...It's a set of shared experiences, values, and goals unique to every engineering team.

Communication Patterns:

* High level -- have a mission statement that defines direction and limits scope of the product (the thing the team is building together)
* Synchronous -- high cost, high bandwidth
* Async -- lower cost, flexible for consumer

Meetings:

* For standups, make "sidebar" (parking lot) a thing.
* For design, keep the participant count small.

> If you're trying to design something new, try to include no more than five people in your meeting.
> It's practically impossible to make decisions with more than five unless there's only one person making the decisions.

Good rule of thumb.

Design Docs:

* one owner
* high-level blueprint
* a goal is low investment, so that criticism is easier to accept

Issue Trackers:

* Have a process for triaging bugs
* Encourage people to file and fix in a timely manner
* No "shouting complaints into the void"
* Record hallway conversations in the tracker

> A bug tracker is just a specialized "internet forum". It shares most properties with email lists and the same best practices apply.

Coding:

* Code reviews for every commit (personally, I disagree on the "every single commit" front, in favor of developer velocity. I worked before this was the norm and things worked pretty well)
* Automated test and release

Bringing it all back:

> Taking some time to pay attention to communication creates a team that will spend more time writing and shipping product and less time arguing about what product to ship.



### Every Effective Team Has a Leader

* ✅ Leader: Lead the charge
* 🚫 Manager: Oversee production

> If the manager makes it obvious that she trusts her employee, the employee feels positive pressure to live up to that trust.

Antipatterns:

* micromanaging
* hiring pushovers
* ignoring low performers
* ignoring human issues
* compromise the hiring bar -- "A people hire A people, B people hire C people"
* not trusting enough / treating like children

Leadership Patterns:

* forge a way for a team
* look out for safety and well-being
* lose the ego
* Be zen -- aware of problems, but not overly skeptical. Intelligently optimistic.
* Be a catalyst -- drive consensus, find the DM, pair up engineers with the right projects
* Set clear goals
* Be Honest -- "I will tell you when I can't tell you something or if I just don't know"
* Track happiness -- spread out grungy chores, figure out what people need

#### Different People Need Different Things

> People are like Plants. Some need more light, some need more water, and some need more fertilizer

* 🌞 Light -- attention, praise
* 💧 Water -- time, concentration, learning
* 💩 Fertilizer -- vision, narrative

#### Intrinsic / Extrinsic Motivation

Depending on where people are, take different actions.

```
              Bored       Excited
          ---------------------------
          |                         |
Self-     |    in a       sweet     |
Directed  |    rut        spot ⭐   |
          |                         |
          |                         |
Scattered |   adrift      Look!     |
          |              Squirrel!  |
          |                         |
          ---------------------------
```

As a leader, you can try to apply either motivation or direction:

* If someone is "in a rut" -> motivate
* If someone is "look! squirrel" -> provide direction

More:

* intrinsic motivation often comes from autonomy
* extrinsic motivation is usually not as effective or long-lasting


### Poisonous Behaviors

(This section of the book appears heavily weighted by OSS experience, but I'll try to summarize based on team product development)

* Lack of respect for other people's time -- often out of naivety. Asking instead of reading.
  * Try to encourage a balance in speaking/chatting time, weighted by each team member's needs and personality.
* Lack of ability to compromise -- reopening old discussions, mandating certain outcomes.
* Entitlement -- demands features/outcomes
  * I see this one a lot especially from users, would love to have a good playbook here.
* Paranoia -- delusions of coordinated attacks
* Perfectionism -- great as the enemy of good. over-planning
  * Solution: redirect energy

Tips:

* Don't get overly emotional
* Look for facts in the bile (of a given user report or unvarnished team member concern)
* Know when to give up
* Focus on the long term


> Despite a short term loss, do you truly believe the project will benefit in the long run?

...if not, take action.

> Do you believe the conflict will ultimately resolve itself in a useful way?

...if not, take action.

> Genius is such a commodity these days that it's not acceptable to be an eccentric anymore.
> - Greg Hudson

Final Thought:

> Never attribute to malice that which is adequately explained by ignorance
> - Robert J. Hanlon, adapted

As a leader:

> Your job is to be intolerant of destructive behaviors and to be explicit about your expectations of Humility, Respect, and Trust.

### The Art of Organizational Manipulation

> Most people work in... bureaucracies and need to employ certain... techniques to get things done effectively.

AKA: politics, social engineering.

How things ought to be:

1. Your manager
2. The corporation beyond your manager
3. (that's it)

* IC seeks responsibility, demonstrates competence. Expanded responsibility reduces the workload of the lead, team gets more done.
* Leader focuses team on what's important, delegates and grows areas of responsibility appropriately.

How things are:

> Happy families are all alike; every unhappy family is unhappy in its own way.
> Leo Tolstoy, Anna Karenina

* Bad manager -- pick your favorite TV show about this. Fear of failure, insecure, knowledge hoarding.
* Politicians -- difficult to spot, quick to steal credit.
  * Route around when possible
* Bad Organization -- many processes, heavy

Tactics:

* **Ask Forgiveness** -- "It's easier to ask for forgiveness than permission"
  * Quote from Grace Murray Hopper (maybe)
  * (note: [rands](https://randsinrepose.com/) has a name for this tactic: [subterfuge](https://randsinrepose.com/archives/subtlety-subterfuge-and-silence/). I like that name too.)
  * Choose your battles wisely with this one.
  * A sounding board to test the risk level can help.
* **Grassroots** -- Find ways to get your ideas accepted at a grassroots level.
  * After that, it's too late.
* **Persuade with Proxies** -- increase chance of success by finding others who agree and getting them to drop the same hints
  * Sometimes you'll find that people will spread an idea only if they can take credit for the idea as their own.
  * Decide what's more important: you get the credit, or the idea spreads
  * Sub-tactic: suggest we "try" it for a limited time frame
* **Manage Up** -- selling yourself is perhaps distasteful, but the benefits are huge
  * Focus your energies on launching products over just about everything else
  * Shipping gives credibility, reputation, and political capital
* **Balance Offense and Defense** -- You can't always do tech debt (defense). You have to ship value.
  * Never spend more than 1/3 to 1/2 the team's time on defense
* **Adjust your attitude to expect Luck** -- be on the lookout for lucky opportunities, and they are more likely to "happen"
  * example given of a study where people were asked to count photographs in a newspaper. "Lucky" people noticed a message that said: "there are Tk photographs in this newspaper"
* **Keep your Bank Account Full** -- give favors freely. the interest they pay varies widely but they always exceed the cost.
* **Seek powerful friends**
  * connectors: knows everyone, eg: "who is working on things like X?"
  * old-timers: institutional knowledge and influence-based authority
* **Ask Executives for things Via Email** -- three bullets and one single call-to-action.



### Users & Product

> If you want to get new people to use your software, you have to care about their emotional perception of your software.

Consider:

> What is your product like to a newbie?

> Focus on the user, and all else will follow.

Three Pillars:

1. Marketing -- perception of your software
2. Product Design -- easy, fast, and functional
3. Customer Service -- long term user retention, growing the product in the right direction

Aspects:

* Underpromise and Overdeliver
  * Don't let the marketing get to the level of overpromising.
  * Be conservative with launch timelines.
  * Possibly, don't even pre-announce features.
* Choose your audience
  * users are on a spectrum of technical capability
* Measure usage, not users
  * eg: pageviews or DAUs
  * I'd like to extend this to measuring heavy users VS light users
* Speed matters
  * latency is a barrier to entry
* Don't try to be all things
  * Be the toaster oven. less is more.
* Hide complexity
  * don't seal it up so tight you handcuff users, though
* Manage your relationship with Users
  * Acknowledge them
  * Respect by default: Don't think of them as clueless, they are smart people with real jobs to do that are different than yours
    * eg: For most people, the car is a black box. You just want to drive it.
    * Users just want to get some work done.
  * Patience: users simply don't have the vocabulary to express their problems. It takes years of practice to learn to understand what they *mean*.
    * "The critical skill here is to learn to understand what people *mean*, not necessarily to try to interpret what they literally *say*."
  * user count and complexity both grow over time
  * ⚠️ Danger:
    * users trend towards less technically skilled over time
    * complexity in a product (both feature set and amount of content in it) trends up over time
  * User trust (in your product/company):
    * Delight: builds trust slowly.
    * Trust: can go away in an instant.
    * "There is no such thing as a temporary lapse of integrity"


## Final Notes

I hope this summary was as helpful to you in deciding whether to read this book (or reminding yourself of its contents) as it was helpful to me as a review mechanism.

If this was useful to you, please let me know how [@SimplGy](https://twitter.com/SimplGy).

---

## Similar Posts

* [Advice from the 1963 class of Harvard Business School](https://www.simple.gy/blog/hbs1963/)
* [Book: How to Fail and Still Win Big](https://www.simple.gy/blog/scott-adams-fails/)

