Rails.application.routes.draw do
  get 'signup', to: 'companies#new'
  post 'signup', to: 'companies#create'
  resources :companies, only: %i[index]
end
