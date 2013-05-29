###
# Blog settings
###

# Time.zone = "UTC"

if ENV["DEPLOY"]
  set :asset_root, "http://nyan.catcyb.org/coba-ruby"
  set :challenge_root, "http://nyan.catcyb.org/coba-ruby/tingkat"
  set :ruby_eval_root, "http://mengenal-ruby-eval.herokuapp.com"
else
  set :asset_root, "http://localhost:4567"
  set :challenge_root, "http://localhost:4567/tingkat"
  set :ruby_eval_root, "http://localhost:4000"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = "https://github.com/catcyborg/coba-ruby.git"
  deploy.branch = "gh-pages"
end

### 
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :gzip
activate :minify_html

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
 
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :syntax
set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet