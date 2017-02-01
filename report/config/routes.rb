Report::Application.routes.draw do
  resources :salles

  root :to => "salles#index"
end
