Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only:[:new, :create, :index, :show, :update, :destroy, :top, :edit]
  resources :users, only:[:show, :index, :edit, :update]

root to: 'books#index'

end
