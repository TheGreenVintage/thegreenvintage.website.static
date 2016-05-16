---
layout: default
section: tours
locale: ca
permalink: /ca/tours/
---

<div class="space-70"></div>
<div class="container">
    <div class="row">

      {% assign tours = site.data.tours %}
      {% for tour in tours %}
      <div class="col-md-4 col-sm-6 margin-btm-40">
          <div class="portfolio-sec">
              <div class="portfolio-thumnail">
                  <a href="/{{ page.locale}}/tours/{{ tour | translate: 'name' | slugify }}">
                    <img class="img-responsive" src="/assets/images/{{ tour.photo }}" alt="{{ tour | translate: 'name' }}" title="{{ tour | translate: 'name' }}">
                  </a>
              </div>
              <div class="portfolio-desc text-center">
                  <h4 class="portfolio-post-title">{{ tour | translate: 'name' }}</h4>
                  <span class="portfolio-post-cat">{{ tour | translate: 'title' }}</span>
                  <h4><a href="/{{ page.locale}}/tours/{{ tour | translate: 'name' | slugify }}" class="btn theme-btn-default btn-lg">{{ 'generic.more_info' | translate }}</a></h4>
              </div>
          </div>
      </div><!--portfolio item -->
      {% endfor %}
    </div>
</div>
