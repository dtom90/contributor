Rails.application.routes.draw do
  root to: 'git_hub_contributors#home'
  resources :git_hub_contributors, only: [:create, :show], path: '', param: :username
end
