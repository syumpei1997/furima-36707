Rails.application.routes.draw do
  get 'image_informations/index'
  get 'image_informations/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'image_informations#index'
   resources :image_informations, only: [:new, :create] do
   end
end