require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BitTorrent
  class Application < Rails::Application
    require Rails.root.join 'app/models/settings'

    config.time_zone = 'Beijing'

    config.i18n.default_locale = :cn

    config.i18n.load_path += Dir[Rails.root.join('locales', '*.yml').to_s]

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g| #自定义模板生成
      g.assets false
      g.helper false
      g.stylesheets false
      g.javascripts false
    end

    config.generators do |g| #测试框架
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      :address => Settings.email_stmp_address,
      :port => Settings.email_stmp_port,
      :user_name => Settings.email,
      :password => Settings.email_password,
      :authentication => "login",
      :enable_starttls_auto => true,
      :openssl_verify_mode => 'none' #Use this because ssl is activated but we have no certificate installed. So clients need to confirm to use the untrusted url.
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
