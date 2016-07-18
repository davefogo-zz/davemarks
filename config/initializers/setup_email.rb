if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com',
    port:           '587',
    authentication: :login,
    user_name:      ENV['USERNAME'],
    password:       ENV['PASSWORD'],
    domain:         'gmail.com',
    enable_starttls_auto: true
  }
end
