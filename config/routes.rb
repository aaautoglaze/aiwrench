Rails.application.routes.draw do
  root "pages#home"

  resources :leads, only: [:create]

  namespace :admin do
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"

    root "leads#index"
    resources :leads, only: [:index, :update, :destroy] do
      collection do
        delete :bulk_destroy
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
