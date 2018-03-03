require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module TournamentManager
  class Application < Rails::Application
    config.assets.quiet = true
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.load_defaults 5.1
    config.active_job.queue_adapter = :delayed_job
  end
end
