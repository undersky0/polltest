Polltest::Application.routes.draw do
      
  resources :votings

  root "votings#index"
  
  get "/home", to: "pages#home", as: "home"
  
end
