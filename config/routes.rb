Rails.application.routes.draw do

  #get 'dados/new'

  #post 'dados/create'

  #get 'dados/index'

  #get 'dados/show'

  resources :dados

  devise_for :admins
  
  root 'articles#index'

  resources :articles

=begin
  
  get 'articles/index'
  
  get 'articles/show'

  get 'articles/new'

  get 'articles/create'

  get 'articles/edit'

  get 'articles/update'

  get 'articles/destroy'
  
=end  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
