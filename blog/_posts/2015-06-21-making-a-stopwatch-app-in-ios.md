---
title: "Making a Stopwatch app in IOS"
excerpt: "My Very first iOS app. A Timer. How hard could it be?"
---

> My Very first iOS app. A Timer. How hard could it be?

This is kind of the story of how it came to be. For the project page, go [here](/projects/three/).

## The Idea

A super simple timer modeled after traditional "twist-to-start" kitchen timers.

This meant it should be easy to set, analog, highly visual, not too concerned about fiddly exact times.

I also wanted a minimalistic, non skeuomorphic appearance. Because of this, animations were important for communicating when the timer is set, ticking, or ringing.

## Who It's For

This isn't for everyone. There are lots of people who want a more fully-featured stopwatch for interval training or other advanced purposes.

You may find you love it if you want a perfectly simple timer for situations like this:

* Meditate for 10 minutes (quick to set, has a peaceful bird sound as the alert tone)
* Take a quick 30 minute nap (quick to set, just slide it to 30 and drift off)
* Play video games for no more than an hour (Throw the hour timer up to the top, leave it by the tv so you can see how much time you have left)
* Pomodoro technique (Easy to set and re-set, lets you focus on working)
* Take a stretch break every hour (mindless to set, peaceful when it rings)

## What it doesn't do

There's lots this app doesn't do. I know it. Here's a list:

* Set multiple timers
  * How many are running? which ones are active? No thanks. Either I have a timer set, or I don't.
* Set precise times (eg: `6:53`)
  * could your old twist-to-start kitchen timer do that? Who needs that?) I keep it simple by not letting you worry about the difference between 5 minutes and 10 minutes.
* Change the ring sound
  * This might be nice, but it would require a settings screen. Instead, I play a random, peaceful bird sound.

## Sounds

Bird sounds were selected because they are peaceful, and the high pitch cuts across most other ambient noises.

Bird sounds were recorded on location in beautiful northern Thailand. If you've been you may recognize some of the bird calls.

I used iMovie because it's what I had and just selected nice segments of sound, making sure they start on a bright note almost right away and fade out to silence nicely at the end.

## Asking Permission

In iOS8, you can't tell the user *why* you'd like them to allow local notifications when you request this permission.

Some apps use this in a spammy way to "re-engage their users", and I thought it might be unclear why a timer app needs notifications. Because of this, I decided to follow the "pre-request pattern". I ask the user if they would like their timer to be able to keep working in the background. If they say no, I don't request the permission. If they say yes, I do.

This means a double-dialog, but I felt the quality of the explanation made it a worthy trade-off.

I didn't want to ask for permission as soon as the app launches. I think it's not fun to have that be the first thing you see when you launch an app. Also, if you ask right away instead of when it's needed, [acceptance rates are lower](https://www.nngroup.com/articles/permission-requests/).

I also don't always need notification permissions. For a timer I only needed sound and alert permissions, and then only if the app is likely to be in the background long enough to get suspended. This means long-running timers. I chose `>11` minutes to mean long-running. A nice benefit is that the way my app is set up, with 2, 10, and 60 minute tiers, only the last timer can trigger the notification request. So the user is likely to have explored the app a little bit before I request notification permissions.

Once we decide to actually ask them, here are the rules I use to maximize politeness:


```
x pre-asking (explain why we want it)
  x pre-ask first time >11 mins
  x pre-ask 3rd time
  x pre-ask 5th time
  x only pre-ask 3 times, no more
x Formal requests
  x fire if you say "yes" to the pre-ask
  x Fire if you say "no" to the pre-ask 3 times, then do more long-timer activity
x Granted permissions
  x never pre-ask again
  x never formally request again
```

And the code:

```swift
static func askPolitely(minutesRemaining: Int) {
  if NotifyPermissions.any     { return }   // don't ask for what we already have
  if minutesRemaining < 11     { return }   // don't ask unless it's needed
  if NotifyPermissions.requested {          // don't ask twice, but warn them
    return politeWarning()
  }
  if evenOddTracker++ % 2 == 1 { return }   // Ask every other time
  // Finally! :) Show the pre-request
}

// 
static func politeWarning() {
  if evenOddTracker++ % 2 == 1      { return } // every other time
  if warnCount > maxPoliteNotices   { return } // no more than the limit
}
```


Also, I have the following requirements:

1. Work as well as possible, even without permissions
2. Don't request 


## Releasing

I know it doesn't do much, but I think what it does do is really precise and excellent.

Also I spent a lot of time and thought on it.

Also I believe in what Marco Arment says about [charging for your apps](https://marco.org/2013/04/19/paid-app-market).

If you think you should get a free version (because you're a child educator, because you're an interested fellow developer) drop me a line explaining why and maybe I can send you a promo code.


## Looking Forward

Probably this app won't become crazily popular, or even pay for the time I spent developing it. That's ok with me.

I am happy that I've finally released something on my own volition. After many years of selling my time, I'm now finally selling a product.

