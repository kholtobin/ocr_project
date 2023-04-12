require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OcrApp
  class Application < Rails::Application
    config.load_defaults 7.0
    config.autoload_paths += %W(#{config.root}/lib)
    config.api_only = true
  end
end
