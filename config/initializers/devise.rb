Devise.setup do |config|
  config.secret_key = '3871ec2f05b7caf456be3919e36415b691712d4b56d7fc36e8479275159c01a7f04ddc54c2b5af3fe5068bf3a1fe94553b579f0c1d8b63c56770307914c841b9'
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.mailer_sender = 'noreply@yourdomain'
end
