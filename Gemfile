source "https://rubygems.org"

gem "jekyll", "~> 4.2.2"

# kramdown v2 comes without the gfm parser
gem "kramdown-parser-gfm"

gem "tzinfo-data"

# Pin activesupport to 7.x; 8.x emits Logger warnings under Jekyll 4.2.
# 7.2.3.1 patches the Dependabot-flagged ReDoS / XSS issues.
gem "activesupport", "~> 7.2.3", ">= 7.2.3.1"

# Jekyll serve seems to complain about webrick w/o this specific dependency
gem "webrick", "~> 1.8"

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-paginate"
  gem "jekyll-sitemap"
  gem "jekyll-gist"
  gem "jekyll-feed"
  gem "jemoji"
  gem "jekyll-include-cache"
  gem "jekyll-algolia"
end
