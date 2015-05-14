---
title: Memory and Pointers in iOS (C and Objective-C)
excerpt: If you are even a little uncertain about how pointers work, this post aims to clear it up.
banner: "http://simple.gy/img/van-roof.jpg"
bannerCaption: "My van's support frame"
---

You use pointers in Objective-C a lot. As an iOS developer, every framework NSObject you create uses a pointer reference. You pass references to these objects.
Things are `strong` and `weak`. Sometimes you modify in place, sometimes you modify a copy. There's a lot to understand here.

I think it's important to understand pointers deeply. I figured out a few things, and here are some of the big "ah-ha" moments that helped me.

## Address and Value all the things

Everything in your program is stored in memory. Maybe that's obvious.

The key insight for me is that any variable, *no matter the type*, can access **both the memory address and the stored value**.

Both primitives (`int`, `long`) and reference types (`int *`, `NSObject *`) have a memory location **and** a value. The difference is just which one is returned by "default".

Here's an example:

{% highlight c %}
// Create a primitive
int myNum = 42;
myNum;   // 42             (returned by "default")
&myNum;  // 0x7fff5fbff6bc (memory address)

// Create a variable that points to an integer data type
int *pointer = &myNum;
pointer  // 0x7fff5fbff6bc (returned by "default")
*pointer // 42             (pointed-at value)
{% endhighlight %}
    
This shows that with a primitive value, you can get to the memory address with `&`, and in a pointer, you can get to the value with `*`.

I think this has really sunk in now, and it explains a lot. Everything in programming has both an address and a value.

## Even your Address has an Address

Even if your value is an address, that value has its own address. Huh? I'll show you.

{% highlight c %}
int myNum = 42;        // integer has value 42 and lives at address A
int *pointer = &myNum; // pointer has value A and lives at address B
printf("The pointer stores a mem address: %p\n", pointer);  // A
printf("The pointer lives in memory here: %p\n", &pointer); // B
{% endhighlight %}

**Everything** has both a value and a memory address, *even if the value itself is a memory address*.

Whaaaaaaa?! ...yes. It's true. Here is a technical diagram:

![Recursive Michelle Obama](http://simple.gy/img/infinite-mo.gif)

## Other Resources

Treehouse has an [*awesome* tutorial](https://teamtreehouse.com/library/objectivec-basics/beyond-the-basics/primitive-data-types) on the topic of pointers.
If you're already a member check it out. If you're not it's worth considering a trial membership to watch.

The instructor is [Amit Bijlani](http://twitter.com/paradoxed). He makes it clear how important an understanding of pointers is to Objective C (all you do is declare pointers over and over again and modify referenced objects).
His explanations are succinct and thorough, with both concrete and abstract examples. Thanks Amit!
