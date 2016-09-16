---
title: Swift Changes Since Launch That'll Break an iOS Project
excerpt: If you haven't touched Swift since Apple released it a year ago, some things have changed. Here's what I found.
banner: http://simple.gy/img/swift.jpg
color: rgb(232,120,67)
---


I did a [small project](https://github.com/SimplGy/Easy-Timer) when Swift was released.

Now, a year later, I want to start the project back up again.

When I fired up the project I got a stack of 10 compiler errors and warnings. Here's what I ran into, how I fixed it, and why the change was made if I could figure that out.

## Array types are now written with the brackets around the element type

Instead of `let emptyArray = String[]()`, we use `let emptyArray = [String]()`. This one is pretty easy, and the error message explicit and helpful.

## Use of unresolved identifier `..`

Looks like the range syntax was changed. You can no longer use `..` to indicate a half-open range.

> Closed Range Operator `...` – makes a range including the last number, so `0...3` is a range containing 0, 1, 2, and 3.
Half-Open Range Operator `..<` – makes a range excluding the last number, so `0 ..< 3` is a range containing 0, 1, and 2.
- [codingexplorer.com](http://www.codingexplorer.com/loops-switch-statements-ranges-swift/)

This makes sense, it's more explicit. I never could remember in Ruby or CoffeeScript which set of dots was which.

## `IBOutlet` property has non-optional type `UILabel`
    
This was a [change in Beta 4](http://makeapppie.com/tag/iboutlet-optional/). UILabels are optional and should now be marked as such. Just add `!` after the `UILabel` to create an "implicitly unwrapped optional":

```
@IBOutlet var timeDisplay : UILabel!
```

From Apple's "Using Swift with Cocoa and Objective-C":

> “When you declare an outlet in Swift, you should make the type of the outlet an implicitly unwrapped optional. This way, you can let the storyboard connect the outlets at runtime, after initialization. When your class is initialized from a storyboard or xib file, you can assume that the outlet has been connected.”

[More on implicity unwrapped optionals](http://commandshift.co.uk/blog/2014/07/20/swift-implicitly-unwrapped-optionals/).

## `required` modifier must be present on all overrides of a required initializer

This was the broken line:

```
init(coder aDecoder: NSCoder) {
```

[Quote:](https://github.com/ksm/SwiftInFlux#required-and-designated-initializers-in-subclasses)

> Swift compiler now strictly enforces the presence of required initializers in subclasses.... if you subclass a Cocoa class that conforms to NSCoding (e.g. UIView) and add your own designated initializer, you must also define init(coder:). If you don't want to actually implement it, you can simply make it fail at runtime, like so:

> The compiler now requires overrides of designated initializers to be explicitly marked with override and implementations of required initializers — with required

The fix is:

```
required init(coder aDecoder: NSCoder) {
```

[Quote](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html):

> To require that subclasses implement a superclass’s initializer, mark the superclass’s initializer with the `required` declaration modifier. The subclass’s implementation of that initializer must also be marked with the `required` declaration modifier.

## `CGFloat` is not convertible to `Float`

I was doing some math on the window height. Pulling `self.frame.height` gives you the height property of a `CGRect` class, which is a `CGFloat` type.

I am doing math with some other values, and for them to play together they need to be the same type. The best solution for me is to declare all values as `CGFloat`:

```
let interval: CGFloat = 1.0
```

[Quote](https://devforums.apple.com/message/998222#998222):

> CGFloat is a typealias for either Float or Double depending on whether you're building for 32 or 64-bits. This is exactly how Objective-C works, but is problematic in Swift because Swift doesn't allow implicit conversions.
> We're aware of this problem and consider it to be serious: we are evaluating several different solutions right now and will roll one out in a later beta. As you notice, you can cope with this today by casting to Double. This is inelegant but effective

[More info (Stack Overflow)](http://stackoverflow.com/questions/26094881/cgfloat-is-not-convertible-to-float-and-more).

## Extra argument `selector` in call (to `NSTimer.scheduledTimerWithTimeInterval`)

At first I thought the signature had changed, but that is not the case. It turns out it wasn't seeing the first param correctly, because I was sending an interval of type `CGFloat`, which doesn't automatically cast to `NSTimeInterval`. The solution:

```
var timer = NSTimer.scheduledTimerWithTimeInterval(
  NSTimeInterval(interval),
  target: self,
  selector: "tick",
  userInfo: nil,
  repeats: true)
```

## Resources

* [Swift in Flux](https://github.com/ksm/SwiftInFlux)
* [Implicity unwrapped optionals](http://commandshift.co.uk/blog/2014/07/20/swift-implicitly-unwrapped-optionals/)
* [cgFloat to float](http://stackoverflow.com/questions/26094881/cgfloat-is-not-convertible-to-float-and-more)
* [Keeping up with changes](http://blog.teamtreehouse.com/keeping-changes-swift)