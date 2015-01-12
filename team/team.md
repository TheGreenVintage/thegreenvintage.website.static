---
layout: page
title: team 
locale: en
permalink: /en/team/
---

<!-- About Us Text -->
<div class="about-us container">
  <div class="row">
    <div class="about-us-text span7">
      <h4>{{ 'who_title' | translate }}</h4>
      <p>{{ 'who_description' | translate }}</p>
      <h4>{{ 'how_title' | translate }}</h4>
      <p>{{ 'how_description' | translate }}</p>
      <h4>{{ 'why_title' | translate }}</h4>
      
      <ul class="gramophone">
        <li>{{ 'commitment1' | translate }}</li>
        <li>{{ 'commitment2' | translate }}</li>
        <li>{{ 'commitment3' | translate }}</li>
        <li>{{ 'commitment4' | translate }}</li>
        <li>{{ 'commitment5' | translate }}</li>
      </ul>
      
    </div>
    <div class="span5">
    <img src="https://dl.dropboxusercontent.com/u/105212173/office-3_Fotor.jpg" style="
      width: 350px;
      margin-top: 70px;
      box-shadow: 0px 0px 20px rgba(0,0,0,0.7);
      border: 2px solid white;
  	">
    </div>
  </div>
</div>

<!-- Meet Our Team -->
<div class="team container">
  <div class="team-title">
    <h3>{{ 'who_we_are' | translate }}</h3>
  </div>
  <div class="row">
    
    <div class="span3"></div>
    
    {% for employee in site.data.employees %}
    <div class="team-text span3">
      <img src="{{ employee.photo }}" alt="">
      <h4>{{ employee.name }}</h4>
      <p>{{ employee.description_en }}</p>
      <br>
      <h5><em class='violet'>{{ employee.phrase }}</em></h5>
      <br>
      <p><b>Email:</b> <a href="mailto:{{ employee.email }}">{{ employee.email }}</a></p>
      <p><b>Tel.</b> <a href="tel:{{ employee.telephone }}">{{ employee.telephone }}</a></p>
    </div>
	{% endfor %}
    
    <div class="span3"></div>
    
  </div>
  <p> </p>
  <div class="team-title"> </div>
  <p> </p>
</div>
