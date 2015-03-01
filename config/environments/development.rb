Rails.application.configure do
  APP_ID='348078458713880'
  APP_SECRET='9339e316e3738162b0991e0bfedf7481'

  # APP_ID='358910230964036'
  # APP_SECRET='28af6ac1884c8cfa9a5ecfecb60d3f40'
  APP_HOST='http://localhost:3000/'
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #     :address => "email-smtp.us-west-2.amazonaws.com",
  #     :user_name => "AKIAI3HPHMX53UCEHCCQ", # Your SMTP user here.
  #     :password => "AnhvhrUQBnmrF27i1TGJ7YdjTvxsFW8nvlU/fXgQuZZN", # Your SMTP password here.
  #     :authentication => :login,
  #     :enable_starttls_auto => true
  # }

  config.action_mailer.delivery_method = :letter_opener


end