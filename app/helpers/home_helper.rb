# frozen_string_literal: true

module HomeHelper
  API_SAMPLER_CONFIG = Rails.root.join('config', 'initializers', 'api_sampler.rb')

  def api_sampler_config
    File.read(API_SAMPLER_CONFIG)
  end
end
