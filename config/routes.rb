Vacation::Application.routes.draw do
  devise_for :users

  resources :companies, :only => [:index, :show] do
    shallow do
      resources :users, :only => :show
    end
  end

  root :to => "companies#index"
end
