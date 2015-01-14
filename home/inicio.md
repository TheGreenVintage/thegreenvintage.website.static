---
layout: page
title: home 
icon: home
locale: es
permalink: /es/home/
---

<!-- Slider -->
<div class="slider">
  <div class="container">
    <div class="row">
      <div class="span10 offset1">
        <div class="flexslider">
          <ul class="slides">
            <li data-thumb="/assets/images/slider/1.jpg">
              <img src="/assets/images/slider/1.jpg">
            </li>
            <li data-thumb="/assets/images/slider/2.jpg">
              <img src="/assets/images/slider/2.jpg">
            </li>
            <li data-thumb="/assets/images/slider/5.jpg">
              <img src="/assets/images/slider/5.jpg">
            </li>
            <li data-thumb="/assets/images/slider/3.jpg">
              <img src="/assets/images/slider/3.jpg">
            </li>
            <li data-thumb="/assets/images/slider/4.jpg">
              <img src="/assets/images/slider/4.jpg">
            </li>
            <li data-thumb="/assets/images/slider/6.jpg">
              <img src="/assets/images/slider/6.jpg">
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Site Description -->
<div class="presentation container">
  <h2>{{ 'home.subheader' | translate}}</h2>
</div>

<!-- Services -->
<div class="what-we-do container">
  <div class="row">
    <div class="service span3">
      <div class="icon-awesome">
        <i class="icon-sitemap"></i>
      </div>
      <h4>{{ 'home.meetings' | translate}}</h4>
      <p><em>{{ 'home.meetings_phrase' | translate}}</em></p>
      <a href="/{{locale}}/services">{{ 'common.readmore' | translate }}</a>
    </div>
    <div class="service span3">
      <div class="icon-awesome">
        <i class="icon-group"></i>
      </div>
      <h4>{{ 'home.teambuilding' | translate}}</h4>
      <p><em>{{ 'home.teambuilding_phrase' | translate}}</em></p>
      <a href="/{{locale}}/services">{{ 'common.readmore' | translate }}</a>
    </div>
    <div class="service span3">
      <div class="icon-awesome">
        <i class="icon-heart"></i>
      </div>
      <h4>{{ 'home.weddings' | translate}}</h4>
      <p><em>{{ 'home.weddings_phrase' | translate}}</em></p>
      <a href="/{{locale}}/services">{{ 'common.readmore' | translate }}</a>
    </div>
    <div class="service span3">
      <div class="icon-awesome">
        <i class="icon-glass"></i>
      </div>
      <h4>{{ 'home.parties' | translate}}</h4>
      <p><em>{{ 'home.parties_phrase' | translate}}</em></p>
	  <a href="/{{locale}}/services">{{ 'common.readmore' | translate }}</a>
    </div>
  </div>
</div>

<!-- Latest Work -->
<div class="portfolio container">
  <div class="portfolio-title">
    <h3>{{ 'home.lastest_work' | translate }}</h3>
  </div>
  <div class="row">
    <!--
        <a href="/assets/portfolio/work1.jpg" rel="prettyPhoto"><i class="icon-search"></i></a>
        <a href="portfolio.html"><i class="icon-link"></i></a>
	-->
        
    {% for project in contents.projects %}
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

<!-- Testimonials -->
<div class="testimonials container">
  <div class="testimonials-title">
    <h3>{{ 'home.testimonials' | translate }}</h3>
  </div>
  <div class="row">
    <div class="testimonial-list span12">
      <div class="tabbable tabs-below">
        <div class="tab-content">
          {% for testimonial  in contents.testimonials %}
          <div class="tab-pane{% if forloop.index == 1 %} active{% endif %}" id="A{{ forloop.index }}">
            <img src="{{ testimonial.photo }}" title="{{ testimonial.who }}" alt="{{ testimonial.who }}">
            {{ testimonial.description }}
            <p><span class="violet">{{ testimonial.who }}</span></p>
          </div>
          {% endfor %}
        </div>
        <ul class="nav nav-tabs">
          {% for testimonial  in contents.testimonials %}
          <li class="{% if forloop.index == 1 %} active{% endif %}"><a href="#A{{ forloop.index }}" data-toggle="tab"></a></li>
          {% endfor %}
        </ul>
      </div>
    </div>
  </div>
</div>
