Rails.application.routes.draw do
  root :to => "foods#index"
  resources :foods
  resources :exercises
end
