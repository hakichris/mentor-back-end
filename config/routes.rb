Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/index'
      get 'reservations/index'
      get 'expertises/index'
      get 'mentors/index'
    end
  end
end
