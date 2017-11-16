Rails.application.routes.draw do

  get 'doses/create'

  get 'doses/destroy'

   resources :cocktails do
     resources :doses, only: [ :create]
   end 
    resources :doses, only: :destroy

   root to: 'cocktails#index'
end