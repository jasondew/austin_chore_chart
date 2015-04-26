Rails.application.routes.draw do
  resources :chores

  post "/chores/:id/complete" => "chores#complete", as: :complete_chore
  delete "/chores/:id/uncomplete" => "chores#uncomplete", as: :uncomplete_chore

  post "/payments" => "payments#create", as: :payments

  root "charts#show"
end
