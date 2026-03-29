---
layout: default
title: Writing
class: writing
permalink: /writing/
---

<section>
  <h2>
    <span class="icon icon-kite"></span>
    Writing
  </h2>

  <ul class="list">
    {% assign listed_posts = site.posts | where: "listed", "true" %}
    {%- for post in listed_posts -%}
    <li>
      <div class="list-title"><a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a></div>
      <div class="list-meta">{{ post.date | date: "%Y-%m-%d" }}</div>
    </li>
    {%- endfor -%}
  </ul>
</section>
