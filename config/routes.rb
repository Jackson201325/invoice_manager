# config/routes
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :invoices do
      resources :items
    end
  end

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :invoices, only: :index
  end


  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
