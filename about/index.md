---
categories:
- about
title: About
---

## About

I'm a web-focused software developer with a background in UX.

I write here about things I've built or found interesting.

Sometimes it's convenient to include a link to an Amazon product I've used in a project, and for those links I use Amazon's affiliate program.
As an Amazon Associate I earn from qualifying purchases.

You can find me on the internet in some of these places:

<!--

  // TODO: pulling this data would be neat:
  
  I've written n blog posts, have n stars on github, gotten n likes on instagram, and made n impressions on stack overflow.
  
  I was last seen online in [CITY].
-->


{% include ul-social.html %}

<script>
  (function(){
    window.endpoints = {};

    // Use the templating language to list all social sites with endpoints
    {% for site in site.data.social %}
      if ('{{ site.api }}' != '') {
        endpoints['{{site.id}}'] = '{{ site.api }}'
      };
    {% endfor %}

    // Handle success for each endpoint
      onSuccess = {};
      onSuccess.github = function(data){
        console.log({ githubUserData: data });
        img = document.createElement('img');
        img.src = data.avatar_url;
        node = document.querySelectorAll('.social .bg-github')[0];
        node.appendChild(img);
      }

    // Hit the endpoint for each site
    for (key in endpoints) {
      var request = new XMLHttpRequest();
      request.open('GET', endpoints[key], true);
      request.onload = function() {
        if (request.status >= 200 && request.status < 400) {
          onSuccess[key](JSON.parse(request.responseText));
        }
      };
      request.send();
      }
  })();
</script>