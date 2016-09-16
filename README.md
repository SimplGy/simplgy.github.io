# Eric Miller, Simple Guy
### I create web applications in Angular, Backbone, and more.

This is the repo for my personal site. It uses Jekyll.

## Quick Start

`bundle exec jekyll serve -w` to run in dev mode

## Authoring

Hide a blog post or project (unpublish)

> Add an `x` to the front of the title of the file

Add a blog post

> Add a text file of the format `YYYY-MM-DD-my-title` to the `blogs/_posts` folder. Make sure to include an `excerpt` field in the front matter.

To add a live code demo to your blog post, add a `demo` section to your front matter. This will add an iframe to the demo and a link.

    ---
    demo: https://jsfiddle.net/yhvrcwog/2/embedded/result
    ---

If you need to use `-` or `:` in the front matter of the post, these are special characters to YAML. Surround the whole thing in quotes to make it work.

    ---
    title: Something easy
    description: "Singing: how to do it while chewing gum."



## Development & Deployment

To run in dev mode:

    bundle exec jekyll serve -w

If you'd like to see `_drafts`, too:

    bundle exec jekyll serve --wD

To build only:

    bundle exec jekyll build

To add a post:

1. Create a file `YEAR-MONTH-DATE-url-title.md`
2. Place the file in _posts
3. Add YAML front matter including a category like `travel`, `van`, or `dev`.

To add a project:

Same as above, but put it inside `projects/_posts`. This tells jekyll to categorize them as `project` but keeps things separate since I don't usually want to treat projects as blog posts.



## Projects

These go in `projects/_posts`. I use the `{{content}}` tags for the headers since they're complex html, and put description text and other values in the yml front matter.
It's almost all configuration based except for the copywriting and the header fanciness.


## Post Categories

* Projects - work I've created. The set of these is a portfolio.
* Book Notes - quotes and summaries from books I've read. A less-good version of this kind of book note: http://scattered-thoughts.net/
* blog - An article I've written, usually technical

## To-Do

### On Deck
o wrap jekyll in gulp/npm scripts so I can have at least a min-cat asset pipeline
o Fix video origin, see if it can work on mobile
o Use an img while the video is loading, and play seamlessly from there
o Support code highlighting with normal triple-backtick code blocks instead of boo `% highlight js %` stuff
o consider https://github.com/poole/poole
o redo colors using http://www.rocket-design.fr/color-template/
o Better fit on mobile and tablet (footer, reduce global padding/margins)
o Click responsiveness and IxN on mobile and tablet (aim for perfect on ipad air)
o https://mmistakes.github.io/skinny-bones-jekyll/getting-started/
o See if there's a way to get reddit, google+, and other post parsers to see the banner image before the content images (hide an `img` tag in the banner?)

### Over the Rainbow
o Pick a color scheme I can live with for a while. Main color (green), supporting color (blue?), background color (not quite white), shaded bg color (pale white), dark (not quite black, tinged brown), etc.
o Style blockquotes nicely
o Style lists in markdown posts nicely
o Move all van posts over from winterpress to here
o Handle loading smoothly (load flat images in dom order. Then load videos based on scroll position. Play videos only when the user is viewing that one)


### Done
x Use the youtube JS api to handle the loading and replay states more seamlessly
x Try the video on the landing page
x Point to geoblocked CDN for projects
x If the img fails to load, remove the containing element
x Improve copy for project titles
x Hover/animation/IxN so that `simple guy` and `Eric Miller` interchange
x MvP design for a project summary with: list of code snippets, short description, technology bullet points
x Implement design
x Write good content for descriptions
x fix flexbox for safari
x Improve IxN For project details (hover to hint, click or hover for deets)
x Adjust `typePretty` for new font
x Carefully select and make available **awesome** code snippets
x Get project page working against posts
x footer with programatically generated gh-page references for organization
x show loader while gifs are coming in
x List all projects
x Include gif or image for each project
x list of blog posts and blog post perma page
x footer
