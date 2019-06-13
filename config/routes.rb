Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :categories, only:[:index, :show]
  resources :brans, only:[:index, :show]
  scope module: 'users' do
    resources :user_cards, only:[:edit, :update]
    resources :user_identifications, only:[:edit, :update]
  end
end
