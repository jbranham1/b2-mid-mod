Rails.application.routes.draw do
  resources :mechanics

  post "mechanics/:id/rides", to: "mechanic_rides#create"
end
