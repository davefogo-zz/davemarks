if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.mailgun.org',
    port:           '587',
    authentication: :plain,
    :openssl_verify_mode => OpenSSL::SSL::VERIFY_NONE,
    user_name:      ENV['MAILGUN_SMTP_LOGIN'],
    password:       ENV['MAILGUN_SMTP_PASSWORD'],
    domain:         'https://lit-citadel-94662.herokuapp.com',
    enable_starttls_auto: true
  }
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp

  # This interceptor just makes sure that local mail
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
  class DevelopmentMailInterceptor
    def self.delivering_email(message)
      message.to =  'david.forrero@gmail.com'
      message.cc = nil
      message.bcc = nil
    end
  end

  # Locally, outgoing mail will be 'intercepted' by the
  # above DevelopmentMailInterceptor before going out
  if Rails.env.development?
    ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
  end
end
