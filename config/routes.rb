MonkeyB::Application.routes.draw do
  devise_for :admins do 
  	get '/admins/sign_out' => 'devise/sessions#destroy' 
  end

  resources :posts do
    resources :comments
  end

  get "home/index"
  root :to => 'home#index'
end
