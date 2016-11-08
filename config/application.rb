require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ApiSamplerDemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    class MeasureRequestTime
      def initialize(app)
        @app = app
      end

      def call(env)
        start = Time.now

        @app.call(env).tap do
          env['api_sampler_demo.elapsed_time'] = Time.now - start
        end
      end
    end

    initializer 'api_sampler_demo.add_measure_request_time_middleware' do |app|
      app.middleware.insert_after ApiSampler::Middleware, MeasureRequestTime
    end
  end
end
