# Eric Miller, Simple Guy

### Builder of Things

This is the repo for my personal site. It uses Jekyll as a static site generator.

## Quick Start

To run in dev mode:

    bundle exec jekyll serve -w

If you'd like to see `_drafts`, too:

    bundle exec jekyll serve -wD

To build only:

    bundle exec jekyll clean && bundle exec jekyll build

To recompile css:
    
    sass --update css/
    # of course you'll need the sass command line tool

Sync my local development environment with what GitHub is using:

    bundle update // this uses `Gemfile` to pull the latest versions of dependencies

To add a post:

1. Create a file `YEAR-MONTH-DATE-url-title.md`
2. Place the file in _posts
3. Add YAML front matter including a category like `travel`, `van`, or `dev`.

To add a project:

Same as above, but put it inside `projects/_posts`. This tells jekyll to categorize them as `project` but keeps things separate since I don't usually want to treat projects as blog posts.

## Developing

Make a `.sass` change to jekyllTimeline:

    TODO

## Authoring

Date formatting:

    {{event.from | date: '%Y-%-m'}}

[tips for formatting dates](http://alanwsmith.com/jekyll-liquid-date-formatting-examples)

Hide a blog post or project (unpublish)

> Add an `x` to the front of the title of the file

Add a blog post

> Add a text file of the format `YYYY-MM-DD-my-title` to the `blogs/_posts` folder.

Fill in front matter something like this:

```
---
title: Plain old Title
excerpt: "This title has something strange: a colon in the text." // optional
banner: "http://simple.gy/img/deep-fried-bacon.jpg" // optional
bannerCaption: "Deep-fried bacon in Thailand" // optional
color: rgb(172, 203, 235) // optional
---
```

If you need to use `-` or `:` in the front matter of the post, these are special characters to YAML. Surround the whole thing in quotes to make it work.

To add images to the body of your blog post:

Bit of a chicken and egg problem here, unfortunately. I haven't figured out a way to make local relative pathing while authoring work the same as published. So, publish images first, then reference.

1. Put images in `img/` and publish
1. Reference as absolute paths in markdown. eg: `![animated demo](http://simple.gy/img/dual-slider-demo.gif)`

Also, if you want the image to be styled as a "hero" (full width, special visual treatment), put it in a blockquote by adding a caret in front of the image code. eg:

    > ![](my-image.png)

To embed demos / scripts, you can either use front matter or a JS Fiddle snippet.

If you want the special `demo` style of embedding, you can add this section to your front matter. Normal JS Fiddle async script embed will also work though, if you want an inline display style:

```
---
demo: https://jsfiddle.net/yhvrcwog/2/embedded/result
---
```
    
### Projects

Every project should have:

* 1 and 2x images in `projects/card`. The `shortName` property of the project specifies which card to use.
* A `mainImg`
* Optionally, an `animation`. This loads on top of the `mainImg`

To add a project: 

1. Assemble a bunch of screenshots, maybe an animated gif or movie
2. Add an entry to `projects/_posts`
3. Create a project card in `projects/cards/project card images.sketch`
4. Create a `mainImg` to showcase the project, or choose a favorite screenshot. If you have a main animation, create a freeze-frame for it using the instructions below
5. Polish content, add screenshots throughout
6. Spellcheck!

### Process Images

Strip exif info (like location. You may need to download the command line tool):

    exiftool -all= -overwrite_original_in_place *.jpg

Shrink large images to a standard size:

    sips -Z 2560 *.jpg

### Creating freeze-frames from gifs

Animated gifs take a while to load, so it's good to have a static image ready sooner.

The code supports this but you have to generate the static image for yourself and use it as the `mainImg` property. 

The first frame of the gif is a good candidate.

You can create `jpg`s out of the first frame of every animation by running this command in the project root (OSX dependency on `sips`):

    sips -s format jpeg ./projects/animation/*.gif --out projects/mainImg

## Post Categories

* Projects - work I've created. The set of these is a portfolio.
* Book Notes - quotes and summaries from books I've read. Sort of like this: http://scattered-thoughts.net/
* Blog - An article I've written, usually technical
