require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module School
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.time_zone = 'Central America'
    config.i18n.default_locale = :es
    config.i18n.available_locales = [:es, :en]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
