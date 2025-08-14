---
layout: page
title: Downloads
permalink: /downloads/
---

<style>
:root {
  --accent: #ffd633;
  --bg-dark: #181818;
  --bg-card-dark: #202020;
  --text-light: #eaeaea;
  --text-muted-light: #aaa;

  --bg-light: #f9f9f9;
  --bg-card-light: #ffffff;
  --text-dark: #222;
  --text-muted-dark: #555;
}

body {
  background: var(--bg-dark);
  color: var(--text-light);
}
.downloads-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.25rem;
  margin-top: 1.25rem;
}
.download-card {
  background: var(--bg-card-dark);
  border-radius: 10px;
  padding: 1rem 1.25rem;
  transition: background 0.2s ease;
}
.download-card:hover {
  background: #242424;
}
.download-card h3 {
  margin: 0 0 0.4rem;
  font-size: 1rem;
  font-weight: 600;
  color: var(--accent);
}
.download-card p {
  margin: 0.25rem 0;
  font-size: 0.9rem;
  line-height: 1.4;
  color: var(--text-light);
}
.download-card small {
  font-size: 0.75rem;
  color: var(--text-muted-light);
}
.download-btn {
  display: inline-block;
  margin-top: 0.5rem;
  padding: 0.45rem 0.9rem;
  background: var(--accent);
  color: #000;
  font-weight: 600;
  border-radius: 5px;
  text-decoration: none;
  font-size: 0.85rem;
  transition: background 0.2s ease;
}
.download-btn:hover {
  background: #ffe066;
}
details summary {
  cursor: pointer;
  font-size: 1rem;
  font-weight: 600;
  margin-top: 2rem;
  color: var(--accent);
  list-style: none;
}
details summary::-webkit-details-marker {
  display: none;
}
details[open] summary {
  margin-bottom: 0.5rem;
}
h2, h3 {
  font-weight: 600;
}

@media (prefers-color-scheme: light) {
  body {
    background: var(--bg-light);
    color: var(--text-dark);
  }
  .download-card {
    background: var(--bg-card-light);
  }
  .download-card:hover {
    background: #f2f2f2;
  }
  .download-card p {
    color: var(--text-dark);
  }
  .download-card small {
    color: var(--text-muted-dark);
  }
}
</style>

## Latest Release — v{{ site.data.releases.latest.version }}

<small>Released {{ site.data.releases.latest.date }}</small>

<div class="downloads-container">
{% for item in site.data.releases.latest.downloads %}
  <div class="download-card">
    <h3>{{ item.platform }}</h3>
    <p>{{ item.description }}</p>
    <a class="download-btn" href="{{ item.file }}">Download</a>
    <p><small>SHA256: `{{ item.sha256 }}`</small></p>
  </div>
{% endfor %}
</div>

## Changelog

**v{{ site.data.releases.latest.version }}** — {{ site.data.releases.latest.date }}
{% for note in site.data.releases.latest.notes %}
- {{ note }}
{% endfor %}

<details>
  <summary>Older Versions</summary>

  {% for release in site.data.releases.older %}
    {% capture old_content %}
### v{{ release.version }} — {{ release.date }}

<div class="downloads-container">
{% for item in release.downloads %}
  <div class="download-card">
    <h3>{{ item.platform }}</h3>
    <p>{{ item.description }}</p>
    <a class="download-btn" href="{{ item.file }}">Download</a>
    <p><small>SHA256: `{{ item.sha256 }}`</small></p>
  </div>
{% endfor %}
</div>

{% for note in release.notes %}
- {{ note }}
{% endfor %}
    {% endcapture %}
    {{ old_content | markdownify }}
  {% endfor %}
</details>
