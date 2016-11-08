namespace :demo do
  task clear: :environment do
    puts 'Removing ApiSampler records...'
    ApiSampler::Endpoint.delete_all
    ApiSampler::Tag.delete_all
    puts 'Removing demo app records...'
    Product.delete_all
  end

  SAMPLE_PRODUCTS = %w(
    Milk Bread Celery Wine Juice
  ).freeze

  task seed: :environment do
    puts 'Creating sample products...'
    SAMPLE_PRODUCTS.each do |name|
      Product.create!(name: name)
    end
  end

  desc 'Reset the demo'
  task reset: %i(demo:clear demo:seed)
end
