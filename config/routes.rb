Rails.application.routes.draw do
  root to: 'git_hub_contributors#home'

  get '/contributor', to: 'git_hub_contributors#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
