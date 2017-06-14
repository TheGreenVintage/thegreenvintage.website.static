---
layout: default
section: blog
locale: es
permalink: /es/blog/
---

<div class="space-70"></div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            {% for post in site.posts %}
            <div class="blog-post-section">
                <div class="blog-post-img">
                    <img src="/assets/images/blog/{{ post.image }}" class="img-responsive" alt="{{ post.title }}">
                </div>
                <div class="blog-post-header">
                    <h3><a href="{{ post.url }}" class="hover-color">{{ post.title }}</a></h3>
                </div>
                <div class="blog-post-info">
                  <p>{{ post.date | date: "%b %-d, %Y" }}{% if post.author %} • {{ post.author }}{% endif %}{% if post.meta %} • {{ post.meta }}{% endif %}</p>
                </div>
                <div class="blog-post-detail">
                  {{ post.excerpt }}
                </div>
                <div class="blog-post-more text-right">
                    <a href="{{ post.url }}" class="btn theme-btn-default btn-lg">{{ 'blog.continue' | translate }}</a>
                </div>
            </div><!--blog post section end-->
            <div class="space-40"></div>
            {% endfor %}
        </div><!--blog content-->
        <div class="col-md-4">
            <div class="sidebar-box">
                {% include recentposts.html %}
            </div>
            <div class="clearfix"></div>
            <hr>
            <div class="sidebar-box">
                {% include sharepost.html %}
            </div><hr>
        </div><!--sideabr blog end -->
    </div>

</div>
