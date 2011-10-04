Devise.setup do |config|
  require 'devise/orm/active_record'

  config.mailer_sender = "nevinera@gmail.com"
  config.mailer = "Devise::Mailer"

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]

  config.params_authenticatable = true
  config.http_authenticatable = false
  config.http_authenticatable_on_xhr = true
  config.stretches = Rails.env.test? ? 1 : 10
  config.confirm_within = 0.days
  config.confirmation_keys = [ :email ]
  config.remember_for = 2.months
  config.remember_across_browsers = true
  config.extend_remember_period = false
  config.use_salt_as_remember_token = true

  config.password_length = 6..128
  config.email_regexp = /\A[^@]+@[^@]+\z/

  config.timeout_in = 4.hours
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [ :email ]
  config.unlock_strategy = :both
  config.maximum_attempts = 20
  config.unlock_in = 5.minutes
  config.reset_password_keys = [ :email ]
  config.reset_password_within = 10.minutes

  config.sign_out_via = :delete
end
