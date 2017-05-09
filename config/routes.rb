Rails.application.routes.draw do
  root to: 'contributors#home'
  resources :contributors, only: [:create, :show], path: '', param: :username
end
