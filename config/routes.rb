Rails.application.routes.draw do
  resources :chores
  resources :completed_chores, only: %i{create destroy}

  post "/payments" => "payments#create"

  root "charts#show"
end
