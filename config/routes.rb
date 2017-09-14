Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines
  end

  resources :machines

  resources :snacks
end
