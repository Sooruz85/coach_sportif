Rails.application.routes.draw do
  # Routes simplifiées
  get 'home', to: 'pages#home'
  get 'services', to: 'pages#services'
  get 'about', to: 'pages#about'
  get 'gallery', to: 'pages#gallery'
  get 'contact', to: 'pages#contact'
  post 'contact', to: 'pages#submit_contact'

  # Routes pour les pages spécifiques des services
  get 'coaching', to: 'pages#coaching', as: :coaching
  get 'group_training', to: 'pages#group_training', as: :group_training
  get 'specific_physical_preparation', to: 'pages#specific_physical_preparation', as: :specific_physical_preparation

  # Routes pour la réservation de coaching
  get 'coaching/reservation', to: 'pages#reservation', as: 'coaching_reservation'
  post 'coaching/reservation', to: 'pages#create_reservation'

  # Health check pour vérifier l'état de l'application
  get "up" => "rails/health#show", as: :rails_health_check

  # Route racine
  root 'pages#home'
end
