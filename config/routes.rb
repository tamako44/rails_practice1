Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'  #這行代表把 localhost:3000/groups 這個網址設成首頁
  resources :groups do
    resources :posts
  end
  
end
