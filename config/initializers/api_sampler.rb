# File: config/initializers/api_sampler.rb

ApiSampler.configure do |config|
  # Collect samples for requests to enpoints which have path starting with "/api/v1/"
  config.allow(%r{^/api/v1/.*})

  # Exclude the :format parameter from collected samples
  config.path_params_blacklist << :format

  # Tag samples of requests which took more than 1 second to complete as slow
  config.tag_with(:slow, color: 'red') do |request|
    request.env['api_sampler_demo.elapsed_time'] > 1.second
  end
end
