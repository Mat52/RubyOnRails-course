Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  Rails.application.routes.draw do
    get "/products", to: "products#index" # index shows all the records

    get "/products/new", to: "products#new" # renders a form for creating a new record
    post "/products", to: "products#create" # Processes the new form submission, handling errors and creating the record

    get "/products/:id", to: "products#show"  # Show - Renders a specific record for viewing

    get "/products/:id/edit", to: "products#edit" #Edit - Renders a form for updating a specific record
    patch "/products/:id", to: "products#update" # Update (full) - Handles the edit form submission, handling errors and updating the entire record, and typically triggered by a PUT request.
    put "/products/:id", to: "products#update"

    delete "/products/:id", to: "products#destroy"

  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
