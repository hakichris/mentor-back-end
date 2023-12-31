Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  use_doorkeeper do
    skip_controllers :authorization, :applications, :authorized_applications
  end
  devise_for :users, only: []
  namespace :api do
    namespace :v1 do
      resource :users, only: [:create] do
        get '/user', to: 'users#user'
      end
      get 'reservations/index'
      # get '/expertises', to: 'expertises#expertises'
      resource :mentors, only: [:create, :destroy] do
        get '/', to: 'mentors#mentors'
        get '/:id', to: 'mentors#mentor'
        post '/:id', to: 'mentors#update'
        delete '/:id', to: 'mentors#destroy'
      end

      resource :expertises, only: [:index, :create, :update, :destroy] do
        get '/', to: 'expertises#expertises'
        delete '/:id', to: 'expertises#destroy'
      end

      resource :reservations, only: [:index, :create, :update, :destroy] do
        get '/', to: 'reservations#reservations'
        delete '/:id', to: 'reservations#destroy'
      end
    end
  end

  root 'home#index'
end
