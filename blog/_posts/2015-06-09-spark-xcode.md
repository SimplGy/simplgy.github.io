---
title: Undo Spark Inspector's Framework Setup Assistant
excerpt: How to fix it when Spark nukes your build
---

Spark inspector looks awesome.

It let's you see a 3d visualization of your app's view heirarchy.

Actually, I sort-of take this for granted. Web developers have a rich suite of tools built in to Chrome, Firefox, Safari, and others. For iOS devs, this is freakin' revolutionary.

I followed the install directions, but never saw an addition to the "Product" menu for launching in Spark. I tried another method, using `Spark Inspector > Framework Setup Assistant`. I found my project file and ran Spark's install process. Cool.

Back to xcode, click run. 

![xcode build failure with spark inspector](https://raw.githubusercontent.com/SimplGy/simplgy.github.io/master/img/xcode-spark-fail.png)

**Build Fail**. @#$@#!!!!.

![anger gif](http://i.giphy.com/swoGNQawNCM7K.gif)

I don't know what Spark did. How do I reverse this?

Well, fixing the build is pretty easy, thankfully. You just go to:

    your-project > build settings > other linker flags > debug
    
And delete the `spark` line. There might be other things Spark modified. I'm concerned I've left something important, but at least my project compiles and runs again.

Would love to see some uninstall directions from these guys so I can make sure I've reversed this correctly.

Fortunately I hadn't otherwise modified my `.pbjproj` file, so I reverted it to an earlier version from git.

Spark: Please, if you're gonna have a magic install, provide an uninstall too. You never know what could happen out there.

It's a shame, I really would like Spark to have worked. Not sure if it's some combination of OS, xcode, swift version, Package Manager, or what. Some day I'll be good enough to debug the build process, but I'm still new at this.

I miss my safe, reliable, visual, web-based debugging tools :(