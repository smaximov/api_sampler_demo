# File: config/initializers/api_sampler.rb

ApiSampler.configure do |config|
  # Collect samples for requests to enpoints which have path starting with "/api/v1/"
  config.allow(%r{^/api/v1/.*})

  # Exclude the :format parameter from collected samples
  config.path_params_blacklist << :format
end
