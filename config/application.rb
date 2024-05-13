require_relative "boot"

require "rails/all"
require './lib/shared_utils/utils'






# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TechZenith
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**','*.{rb,yml}').to_s]

    config.i18n.default_locale = :fr

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # Use sidekiq for active jobs
    #config.active_job.queue_adapter = :sidekiq

    #config.to_prepare do
    #ActionText::ContentHelper.allowed_tags << 'iframe'
  #end

  config.action_view.preload_links_header = false



  config.to_prepare do
      ActionText::ContentHelper.allowed_attributes.add 'style'
      ActionText::ContentHelper.allowed_attributes.add 'controls'
      ActionText::ContentHelper.allowed_attributes.add 'poster'

      ActionText::ContentHelper.allowed_tags.add 'video'
      ActionText::ContentHelper.allowed_tags.add 'audio'
      ActionText::ContentHelper.allowed_tags.add 'source'
      ActionText::ContentHelper.allowed_tags.add 'embed'
      ActionText::ContentHelper.allowed_tags.add 'iframe'
    end



    #For subfolders
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '**/')]
    #config.autoload_paths += %w(#{config.root}/app/models/ckeditor)



   


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
