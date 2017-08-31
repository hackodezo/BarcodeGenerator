Rails.application.routes.draw do
  root to: "qr_codes#new"
  get "/qr_codes/new"
  post "/qr_codes/create"
end
