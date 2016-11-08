Rails.application.routes.draw do
  scope 'api/v1', constaints: { format: :json }, defaults: { format: :json } do
    resources :products, except: %i(new edit)
  end

  mount ApiSampler::Engine, at: '/api_sampler'

  root to: 'home#index'
end
