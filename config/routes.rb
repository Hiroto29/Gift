Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :souvenirs
  resources :perfumes
  root 'souvenirs#index'
  # resources :souvenirs, only: [:index, :show] 
  namespace :admin do
    resources :souvenirs, only: [:index, :new, :create, :show,  :edit, :destroy]
  end
get 'souvenir/ichiosi' => 'souvenirs#ichiosi'
end
