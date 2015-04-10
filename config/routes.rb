Rails.application.routes.draw do
  post "/payments" => "payments#create", as: :payments
  post "/chores/:id/complete" => "chores#complete", as: :complete_chore
  delete "/chores/:id/uncomplete" => "chores#uncomplete", as: :uncomplete_chore
  root "charts#show"
end
