#SpreeAbandonedCartEmail

Abandoned cart email extension. Looks for orders with line items that were created over 12 hours ago and gives them a nudge to complete.

Use the config values below to change settings:

```
Spree::AbandonedCartEmail::Config.email_timeframe = 12.hours
Spree::AbandonedCartEmail::Config.email_from = "spree@example.com"
```

Override the email view to customise:

```
app/views/spree/abandoned_cart_mailer/abandoned_email.html.erb
```

##Installation

Add spree_abandoned_cart_email to your Gemfile:

```ruby
gem 'spree_abandoned_cart_email'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_abandoned_cart_email:install
```

##Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_abandoned_cart_email/factories'
```
