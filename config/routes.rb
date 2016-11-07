Rails.application.routes.draw do
  mount ApiSampler::Engine, at: '/api_sampler'

  root to: 'home#index'
end
