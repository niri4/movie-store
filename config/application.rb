require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MovieStore
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.to_prepare do
    Devise::SessionsController.layout "devise"
    Devise::RegistrationsController.layout "devise"
    Devise::ConfirmationsController.layout "devise"
    Devise::UnlocksController.layout "devise"
    Devise::PasswordsController.layout "devise"
  end

    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
