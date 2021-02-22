Rails.application.routes.draw do
  resources :mechanics, :parks

  post "mechanics/:id/rides", to: "mechanic_rides#create"
end
