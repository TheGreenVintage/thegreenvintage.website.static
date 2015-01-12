---
layout: page
title: portfolio 
locale: en
permalink: /en/portfolio/
---

<div class="portfolio portfolio-page container">

  <div class="row">
    {% for project in site.data.projects %}
    <div class="work span3">
      <img src="{{ project.photo }}" alt="">
      <h4>{{ project.title }}</h4>
      <p>{{ project.description }}</p>
      <div class="icon-awesome">
        <a href="/{{locale}}/services"><i class="icon-search"></i></a>
      </div>
    </div>
    {% endfor %}
  </div>

</div>
