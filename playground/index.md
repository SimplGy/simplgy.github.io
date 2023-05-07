## Dev Playground

{% for file in site.static_files %}
  {% if file.path contains 'playground/' %}
    {% if file.path contains '.html' %}
* [{{ file.path }}]({{ file.path }})
    {% endif %}
  {% endif %}
{% endfor %}