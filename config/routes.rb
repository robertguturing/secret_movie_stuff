Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm, :showl
  resources :movies, only: [:index, :show]
end
