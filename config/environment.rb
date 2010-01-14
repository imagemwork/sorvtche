RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.time_zone = 'UTC'
  config.active_record.observers = :user_observer
  config.i18n.default_locale = "pt-BR"
  #config.gem 'prawn'
  config.gem "rack", :version => "1.0.1"
  
end

ActionMailer::Base.default_content_type = "text/html"

ActionMailer::Base.smtp_settings = {
	:tls => true,
	:address => "smtp.acisai.com",
	:port => "587",
	:domain => "acisai.com",
	:authentication => :plain, # pode usar também :login
	:user_name => "acisai@acisai.com",
	:password => "acisai"
}
