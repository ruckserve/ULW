Rails.application.routes.draw do

  resources :fmr_datasets, except: [:edit, :update]

  resources :fair_mkt_rents, only: [:index, :show]

  get '/ulw', to: 'ulw#show', as: :ulw
  get '/', to: 'ulw#search'
end
