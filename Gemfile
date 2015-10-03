source "https://rubygems.org"

ruby "2.2.2"

gem "rails", "4.2.1"
gem "rails-api"
gem "pg"
gem "active_model_serializers", "~>0.8.0"
gem "rack-cors", require: "rack/cors"

group :development, :test do
  gem "byebug"
  gem "web-console", "~> 2.0"
  gem "spring"
end

group :production do
  gem "puma"
  gem "rails_12factor"
end
