Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :videos,  path: 'api/v1/videos'
  get 'api/v1/categories', to: 'categories#index'
end
