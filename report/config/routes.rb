Report::Application.routes.draw do
  resources :salles

  get "list-reports" => "salles#list_report"
  root :to => "salles#index"
end
