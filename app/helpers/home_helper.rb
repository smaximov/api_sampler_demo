# frozen_string_literal: true

module HomeHelper
  API_SAMPLER_CONFIG = Rails.root.join('config', 'initializers', 'api_sampler.rb')

  def api_sampler_config
    File.read(API_SAMPLER_CONFIG)
  end

  def example_create
    <<~EXAMPLE
      $ curl -H "Content-Type: application/json" -X POST \\
          -d '{ "product": { "name": "Cereal" } }' \\
          http://localhost:3000/api/v1/products
      {"id":3,"name":"Cereal","created_at":"2016-11-08T12:01:16.922Z","updated_at":"2016-11-08T12:01:16.922Z","url":"http://localhost:3000/api/v1/products/3"}
    EXAMPLE
  end

  def example_index
    <<~EXAMPLE
      $ curl -H "Content-Type: application/json" -X GET \\
          http://localhost:3000/api/v1/products
      [{"id":3,"name":"Cereal","created_at":"2016-11-08T12:01:16.922Z","updated_at":"2016-11-08T12:01:16.922Z","url":"http://localhost:3000/api/v1/products/3"},{"id":4,"name":"Milk","created_at":"2016-11-08T12:14:32.953Z","updated_at":"2016-11-08T12:14:32.953Z","url":"http://localhost:3000/api/v1/products/4"}]
    EXAMPLE
  end

  def example_show
    <<~EXAMPLE
      $ curl -H "Content-Type: application/json" -X GET \\
           http://localhost:3000/api/v1/products/3
      {"id":3,"name":"Cereal","created_at":"2016-11-08T12:01:16.922Z","updated_at":"2016-11-08T12:01:16.922Z","url":"http://localhost:3000/api/v1/products/3"}
    EXAMPLE
  end

  def example_update
    <<~EXAMPLE
      $ curl -H "Content-Type: application/json" -X PATCH \\
           -d '{ "product": { "name": "Strawberry Milk" } }' \\
           http://localhost:3000/api/v1/products/4
      {"id":4,"name":"Strawberry Milk","created_at":"2016-11-08T12:14:32.953Z","updated_at":"2016-11-08T12:22:54.418Z","url":"http://localhost:3000/api/v1/products/4"}
    EXAMPLE
  end

  def example_delete
    <<~EXAMPLE
      $ curl -H "Content-Type: application/json" -X DELETE \\
          http://localhost:3000/api/v1/products/4
    EXAMPLE
  end
end
