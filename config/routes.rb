Rails.application.routes.draw do
  root to: 'git_hub_contributors#home'

  get '/contributor', to: 'git_hub_contributors#show', as: 'git_hub_contributor'
  resources :git_hub_contributors, only: [:index, :show], path: 'contributor'

end
