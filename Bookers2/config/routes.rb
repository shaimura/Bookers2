Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only:[:create, :index, :show, :update, :destroy, :edit]
  resources :users, only:[:show, :index, :edit, :update]

  root :to => 'hoom#top'

  get 'top' => 'home#top'
  get 'about' => 'home#about'

end
