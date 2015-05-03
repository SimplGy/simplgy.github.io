# Eric Miller, Simple Guy
### I create web applications in Angular, Backbone, and more.

This is the repo for my personal site. It uses Jekyll.

## Authoring

Hide a blog post or project (unpublish)

> Add an `x` to the front of the title of the file

Add a blog post

> Add a text file of the format `YYYY-MM-DD-my-title` to the `blogs/_posts` folder. Make sure to include an `excerpt` field in the front matter.

To add a live code demo to your blog post, add a `demo` section to your front matter. This will add an iframe to the demo and a link.

    ---
      demo: https://jsfiddle.net/yhvrcwog/2/embedded/result
    ---

## Development & Deployment

To run in dev mode:

    jekyll s -w

If you'd like to see `_drafts`, too:

    jekyll s --wD

To build only:

    jekyll build

To add a post:

1. Create a file `YEAR-MONTH-DATE-url-title.md`
2. Place the file in _posts
3. Add YAML front matter including a category like `travel`, `van`, or `dev`.

To add a project:

Same as above, but put it inside `projects/_posts`. This tells jekyll to categorize them as `project` but keeps things separate since I don't usually want to treat projects as blog posts.


## Projects

These go in `projects/_posts`. I use the `{{content}}` tags for the headers since they're complex html, and put description text and other values in the yml front matter.
It's almost all configuration based except for the copywriting and the header fanciness.