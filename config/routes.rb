Rails.application.routes.draw do
  root to: "songs#index"
  resources :songs, only: [:show, :index]
end
