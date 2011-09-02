Ehinventory::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users" }
  devise_scope :user do 
    get "/users/sign_up"  => "users#new"
  end
  resources :users

  resources :tasks do
    collection do
      post 'mark_completed'
    end
  end

  resources :rooms

  resources :hardware_types

  resources :groups

  resources :rooms

  resources :ports

  resources :owners

  resources :tickets

  resources :documents do
    resources :tickets
  end

  resources :hardwares do
    resources :tickets
  end

  resources :softwares do
    resources :tickets
  end

  resources :assignments

  match "/" => redirect("/documents")

end
