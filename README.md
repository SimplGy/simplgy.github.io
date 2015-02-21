# Eric Miller, Simple Guy
### I create web applications in Angular, Backbone, and more.

This is a repo for a personal/portfolio/blog website. It uses Jekyll.

To run in dev mode:

    jekyll serve --watch
    // or...
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