---
title: Javascript Dev Revisits the `C` programming language after 14 years
excerpt: I hadn't written a line of C since learning it in a high-school AP class.
banner: http://simple.gy/img/apollo-13-eva-test.jpg
bannerCaption: "Photo Credit: http://unsplash.com"
---

I hadn't written a line of C in 14 years, not since the *Intro to Computer Programming* class with Treyton "T-Rex" Williams I took at Columbia State Community College. He was a great professor. I hope he's doing well.

Revisiting C was fun. There are some tidbits I took from it that were really useful to me. This post collects the best bits.

If you want to follow along, Treehouse has a [really nice overview](https://teamtreehouse.com/library/objectivec-basics) of `C` on the way to learning Objective C.

## Arrays and Memory Space

The first thing I found interesting was a succinct explanation of why arrays start at `0`. Paraphrased:

> Arrays start at `0` because they describe contiguous blocks of memory. The first item is stored in the first position, and subsequent items are described by offsets from that item. Therefore, the first item is at `arrayLocation + 0` (no offset).

The next fascinating thing is how you get an array length in C. It exposes the under-the-hood mechanics in a very direct way.

```
float numbers[] = { 1.1, 2.2, 3.3 }
// Get the size of a `float`:
printf("Size of float: %ld bytes\n", sizeof(float)); // 4 bytes
// Get the memory size of `numbers`
printf("Size of numbers: %ld bytes\n", sizeof(numbers)); // 12 bytes
// items in array
printf("Floats in Array: %ld", sizeof(numbers)/sizeof(float)); // 3 items
```

This left me with a strong impression of how close to the metal C really is, and how useful it can be to think about things in the same way as the computer does.

## Reference and Value

In C, you create a reference explicitly using `*` and point it to a value's memory address using `&`:

```
char *ref;
char e = 'e';
ref = &e;
printf("value: %c, reference: %c\npointer address: %s\n", e, *ref, ref);
e = 'changed';
printf("value: %c, reference: %c, e, *ref);
```

It struck me that the same mechanic is possible in JS. While the memory address is not exposed, JS objects (hash maps) allow us to emulate our own reference behavior. We have to be careful not to change the reference of the original object, but it can be done:

```
var nums = [1,2,3];
var map = { a: nums };
var ref = 'a';
console.log("value: "+ nums +", reference: "+ map[ref] +", address: "+ ref);
// nums = [3,4,5]; // Nope. Stomping the array would unlink this reference
nums.splice(-3); // empty it
Array.prototype.push.apply(nums, [3,4,5]);
console.log("value: "+ nums +", reference: "+ map[ref] +", address: "+ ref);
```

Pointers in C are more powerful though. For example, autoincrementing is type aware and works on a reference type. you can use this for iterating over the characters in a string:

```
var *letter;
char eric[] = "Eric";
letter = &eric[1];  // pointer to 'r'
++letter;           // pointer to 'i'
```
