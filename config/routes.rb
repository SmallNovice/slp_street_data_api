Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :departments do
        resources :categories do
          resources :projects do
            resources :quarter_tables
          end
        end
      end
      get "/all_data", to: "projects#all_data"
      get "/specify_data/:id", to: "projects#specify_data"
    end
  end
end
