Rails.application.routes.draw do

  devise_scope :user do
    root 'devise/registrations#new'
  end

  get 'home', to: 'static_pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
