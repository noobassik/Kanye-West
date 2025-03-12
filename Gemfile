source 'https://rubygems.org'

ruby '2.7.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Soon, here will be something nice :)
# Summary (https://rubygems.org/gems/owl)
# Soon, here will be something nice :)
# Summary (https://rubygems.org/gems/owl)
gem 'owl', '>= 0.1.10', github: 'propimo/owl'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Full-stack web application framework. (https://rubyonrails.org)
gem 'rails', '6.1.4.4'
# Use sqlite3 as the database for Active Record
# This module allows Ruby programs to interface with the SQLite3 database engine (http://www.sqlite.org) (https://github.com/sparklemotion/sqlite3-ruby)
gem 'sqlite3'
# Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/] (https://github.com/ged/ruby-pg)
gem 'pg', '~> 1.1'
# Use Puma as the app server
# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications (http://puma.io)
gem 'puma', '~> 3.0'

# A convenient way to diff string in ruby (http://github.com/samg/diffy)
# gem 'diffy'

# Russian language support for Ruby and Rails (http://github.com/yaroslav/russian/)
gem 'russian', '~> 0.6.0'
# Склоняет заданный заголовок по падежам (https://github.com/estum/russian_inflect)
gem 'russian_inflect', github: 'funkthis/russian_inflect'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Create JSON structures via a Builder-style DSL (https://github.com/rails/jbuilder)
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Ruby file upload library (https://github.com/carrierwaveuploader/carrierwave)
gem 'carrierwave'

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick (https://github.com/minimagick/minimagick)
gem 'mini_magick'

# Upload images encoded as base64 to carrierwave. (https://github.com/lebedev-yury/carrierwave-base64)
gem 'carrierwave-base64'

# Use for parse
# The Mechanize library is used for automating interaction with websites (https://github.com/sparklemotion/mechanize)
gem 'mechanize'
# gem 'faraday'
# gem 'em-http-request'

# Use for ping hosts
# A ping interface for Ruby. (https://github.com/chernesk/net-ping)
gem 'net-ping'

# Flexible authentication solution for Rails with Warden (https://github.com/heartcombo/devise)
gem 'devise'

# Common locale data and translations for Rails i18n. (http://github.com/svenfuchs/rails-i18n)
gem 'rails-i18n', '~> 6.0'

# Use webpack to manage app-like JavaScript modules in Rails (https://github.com/rails/webpacker)
gem 'webpacker', '~> 3.5'

# Reports exceptions to Rollbar (https://rollbar.com)
gem 'rollbar'

# Intelligent search made easy with Rails and Elasticsearch or OpenSearch (https://github.com/ankane/searchkick)
gem 'searchkick'

# A simple Ruby on Rails plugin for creating and managing a breadcrumb navigation (https://simonecarletti.com/code/breadcrumbs_on_rails)
gem 'breadcrumbs_on_rails'

# Cron jobs in ruby. (https://github.com/javan/whenever)
gem 'whenever', require: false

# memoize methods invocation (https://github.com/matthewrudy/memoist)
gem 'memoist'

# Transliteration between cyrillic <-> latin from command-line or your program | Транслитерация между кириллицей и латиницей с коммандной строки или в твоей программе (http://github.com/tjbladez/translit)
gem 'translit'

# Boot large ruby/rails apps faster (https://github.com/Shopify/bootsnap)
gem 'bootsnap', require: false

# Easily generate XML Sitemaps (https://github.com/kjvarga/sitemap_generator)
gem 'sitemap_generator'

# Use Pry as your rails console (https://github.com/rweng/pry-rails)
gem 'pry-rails'

# Do some browser detection with Ruby. (https://github.com/fnando/browser)
gem 'browser'

# Business Transaction Flow DSL (https://dry-rb.org/gems/dry-transaction)
gem 'dry-transaction'

# Coercion and validation for data structures (https://dry-rb.org/gems/dry-schema)
gem 'dry-schema'

# PDF generator (from HTML) gem for Ruby on Rails (https://github.com/mileszs/wicked_pdf)
gem 'wicked_pdf', '~> 1.4'

# Provides binaries for WKHTMLTOPDF project in an easily accessible package.
gem 'wkhtmltopdf-binary' # Dependency for wicked_pdf

# Authorization framework for Ruby/Rails application (https://github.com/palkan/action_policy)
gem 'action_policy', '~> 0.4.0'

# Simple, efficient background processing for Ruby (https://sidekiq.org)
gem 'sidekiq', '~> 6.0'

# Render parts of the page asynchronously with AJAX (https://github.com/renderedtext/render_async)
gem 'render_async'

# An efficient digital signature library providing the Ed25519 algorithm (https://github.com/RubyCrypto/ed25519)
gem 'ed25519'

# OpenBSD's bcrypt_pbkdf (a variant of PBKDF2 with bcrypt-based PRF) (https://github.com/net-ssh/bcrypt_pbkdf-ruby)
gem 'bcrypt_pbkdf'

# Forms made easy! (https://github.com/heartcombo/simple_form)
gem 'simple_form'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platform: :mri
  # Ruby on Rails model and controller UML class diagram generator. (http://github.com/preston/railroady)
  gem 'railroady'

  # RSpec for Rails (https://github.com/rspec/rspec-rails)
  gem 'rspec-rails', '~> 3.7'

  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites (http://github.com/colszowka/simplecov)
  # Code coverage for Ruby (https://github.com/simplecov-ruby/simplecov)
  gem 'simplecov', require: false

  # Patch-level verification for Bundler (https://github.com/rubysec/bundler-audit#readme)
  gem 'bundler-audit'
end

group :development do
  # Documentation tool for consistent and usable documentation in Ruby. (http://yardoc.org)
  gem 'yard', require: false

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # A debugging tool for your Ruby on Rails applications. (https://github.com/rails/web-console)
  gem 'web-console', '>= 3.3.0'
  # Listen to file modifications (https://github.com/guard/listen)
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # Rails application preloader (https://github.com/rails/spring)
  gem 'spring'
  # Makes spring watch files using the listen gem. (https://github.com/jonleighton/spring-watcher-listen)
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Add comments to your Gemfile with each dependency's description. (https://github.com/ivantsepp/annotate_gem)
  gem 'annotate_gem', require: false
  # Annotates Rails Models, routes, fixtures, and others based on the database schema. (http://github.com/ctran/annotate_models)
  gem 'annotate', require: false
  # Automatic Ruby code style checking tool. (https://github.com/rubocop/rubocop)
  gem 'rubocop', require: false
  # Automatic Rails code style checking tool. (https://github.com/rubocop/rubocop-rails)
  gem 'rubocop-rails', require: false

  # A single dependency-free binary to manage all your git hooks that works with any language in any environment, and in all common team workflows. (https://github.com/evilmartians/lefthook)
  gem 'lefthook'

  # Security vulnerability scanner for Ruby on Rails. (https://brakemanscanner.org)
  gem 'brakeman'

  # Provide an easy way to check the consistency of the database constraints with the application validations. (https://github.com/djezzzl/database_consistency)
  gem 'database_consistency', require: false

  # Manage localization and translation with the awesome power of static analysis (https://github.com/glebm/i18n-tasks)
  gem 'i18n-tasks', require: false

  # Profiles loading speed for rack applications. (http://miniprofiler.com)
  # gem 'rack-mini-profiler', require: false # включай, когда нужен
  # Ruby application performance monitoring (https://github.com/scoutapp/scout_apm_ruby)
  gem 'scout_apm'

  # Capistrano - Welcome to easy deployment with Ruby over SSH (https://capistranorb.com/)
  gem 'capistrano', '~> 3.0', require: false
  # Bundler support for Capistrano 3.x (https://github.com/capistrano/bundler)
  gem 'capistrano-bundler'
  # rbenv integration for Capistrano (https://github.com/capistrano/rbenv)
  gem 'capistrano-rbenv', require: false
  # Rails specific Capistrano tasks (https://github.com/capistrano/rails)
  gem 'capistrano-rails'
  # yarn support for Capistrano 3.x (https://github.com/j-arnaiz/capistrano-yarn)
  gem 'capistrano-yarn'

  # A rule-based sentence boundary detection gem that works out-of-the-box across many languages (https://github.com/diasks2/pragmatic_segmenter)
  gem 'pragmatic_segmenter'

end
