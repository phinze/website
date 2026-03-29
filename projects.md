---
layout: default
title: Projects
class: projects
permalink: /projects/
---

<section>
  <h2>
    <span class="icon icon-adventures"></span>
    Projects
  </h2>

  <ul class="list">
    {%- assign sorted_projects = site.projects | sort: "order" -%}
    {%- for project in sorted_projects -%}
    <li>
      <div class="list-title"><a href="{{ project.url | relative_url }}">{{ project.title | escape }}</a></div>
      <div class="list-meta">{{ project.role | escape }}</div>
    </li>
    {%- endfor -%}
  </ul>
</section>
