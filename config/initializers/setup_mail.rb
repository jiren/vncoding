
require 'development_mail_interceptor'
if Rails.env.development? || Rails.env.staging?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if  Rails.env.development?  
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {

    #    :tls => true, #TODO this option is not working on rails 3.2 farther research about fixes or the side effexts of letting it like this needed
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "joshsoftware.com",
    :enable_starttls_auto => true,
    :authentication => :plain,
    :user_name => "joshsoftwaretest1@gmail.com",
    :password => "josh123#"
  }
else Rails.env.production?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if  Rails.env.development?  
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {

    #    :tls => true, #TODO this option is not working on rails 3.2 farther research about fixes or the side effexts of letting it like this needed
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "joshsoftware.com",
    :enable_starttls_auto => true,
    :authentication => :plain,
    :user_name => "joshsoftwaretest1@gmail.com",
    :password => "josh123#"
  }
end
