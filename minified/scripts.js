---
permalink: /assets/js/scripts.min.js
---

{% capture scripts %}
{% endcapture %}

{{ scripts | uglify }}
