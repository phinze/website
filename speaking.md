---
layout: default
title: Speaking
class: speaking
permalink: /speaking/
---

<section>
  <h2>
    <span class="icon icon-tiger"></span>
    Speaking
  </h2>

  <ul class="list">
    {%- for talk in site.talks reversed -%}
    <li>
      <div class="list-title"><a href="{{ talk.url | relative_url }}">{{ talk.title | escape }}</a></div>
      <div class="list-meta">{{ talk.date | date: "%Y-%m-%d" }}</div>
    </li>
    {%- endfor -%}
  </ul>
</section>

