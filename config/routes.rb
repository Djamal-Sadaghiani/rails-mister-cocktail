Rails.application.routes.draw do
  get 'cocktails/search', to: 'cocktails#search', as: :search_cocktail
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy, :show]
  root 'cocktails#index'
end
